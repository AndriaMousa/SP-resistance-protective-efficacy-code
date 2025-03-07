
# Load the raster package
library(raster)
library(sf)
library(ggplot2)
library(cowplot)

#read in the tif files for each dhps combination:

tif_file_sext <- "data/Foo and Flegg/437G_540E_581G/2020_mean.tif"  ##sextuple
tif_file_quint<- "data/Foo and Flegg/437G_540E_A581/2020_mean.tif"  ##quintuple
tif_file_oth1 <- "data/Foo and Flegg/437G_K540_581G/2020_mean.tif"  ##other : could include 431V west african genotype
tif_file_quadr<- "data/Foo and Flegg/437G_K540_A581/2020_mean.tif" ## quadruple

tif_file_oth2 <- "data/Foo and Flegg/A437_540E_581G/2020_mean.tif" ##other 
tif_file_oth3 <- "data/Foo and Flegg/A437_540E_A581/2020_mean.tif" ##other
tif_file_oth4 <- "data/Foo and Flegg/A437_K540_581G/2020_mean.tif" ##other
tif_file_tripl<- "data/Foo and Flegg/A437_K540_A581/2020_mean.tif" ##triple


# save as raster data

raster_data_sext <- raster(tif_file_sext)
raster_data_quint <- raster(tif_file_quint )
raster_data_oth1 <- raster(tif_file_oth1)
raster_data_quadr <- raster(tif_file_quadr )

raster_data_oth2 <- raster(tif_file_oth2)
raster_data_oth3 <- raster(tif_file_oth3)
raster_data_oth4 <- raster(tif_file_oth4 )
raster_data_tripl <- raster(tif_file_tripl)


# Get the file extension
file_ext <- tools::file_ext(tif_file_oth1)
file_ext2 <- tools::file_ext(raster_data_oth1 )

# Print the file extension
print(file_ext2)

##sum up the "other" dhps combinations that are not the main types:
raster_data_oth <- raster_data_oth1+raster_data_oth2+raster_data_oth3+raster_data_oth4 


# Extract the value of a single observation
raster_data_sext[64501] # picked a random pixel that is not NA
raster_data_quint[64501]
raster_data_quadr[64501]
raster_data_tripl[64501]
raster_data_oth[64501]
raster_data_sext[64501]+raster_data_quint[64501]+raster_data_tripl[64501]+raster_data_quadr[64501]+raster_data_oth[64501]

coords <- xyFromCell(raster_data_quadr, 64501)
point <- cbind(0.1712591, -0.03745226)
result <- extract(raster_data_sext, point) + 
          extract(raster_data_quint, point) +
          extract(raster_data_quadr, point) +
          extract(raster_data_tripl, point) +
          extract(raster_data_oth1, point) +
          extract(raster_data_oth2, point) +
          extract(raster_data_oth3, point) +
          extract(raster_data_oth4, point) 
result ## should add up to 1
  
###add up frequencies of all dhps combinations

check<-raster_data_sext +
       raster_data_quint +
       raster_data_quadr + 
       raster_data_tripl + 
       raster_data_oth1 + 
       raster_data_oth2 +
       raster_data_oth3 +
       raster_data_oth4




# Plot the raster data
par(mfrow = c(3, 2))
plot(raster_data_sext, main = "dhps GEG (Sextuple)")
plot(raster_data_quint, main = "dhps GEA (Quintuple)")
plot(raster_data_quadr, main = "dhps GKA (Quadruple)")
plot(raster_data_tripl, main = "dhps AKA (Triple)")
plot(raster_data_oth, main = "All 4 'other' dhps combinations")
plot(check, main = "All 8 dhps combinations")
par(mfrow = c(1, 1))


SSA_adm0<- sf::st_read("data/GADM_Africa_Admin0.shp")


dt=0.5
lambda_trip<-59.41
w_trip<- 8.44
lambda_quint<-18.43
w_quint<-2.56
lambda_quadr<-32.96
w_quadr<- 4.91
lambda_sext<-12.86
w_sext<-3.61
lambda_other<-23
w_other<-4.5

time<-seq(from=0,to=63,by=dt)      #### Ran for 60 days, Protective Efficacy will depend on which time interval is being reported.


PEdata<-data.frame(time)

PEdata$SP_PE<-NA

p_protect_trip<- exp(-(time/lambda_trip)^w_trip)
p_protect_quadr<- exp(-(time/lambda_quadr)^w_quadr)
p_protect_quint<- exp(-(time/lambda_quint)^w_quint)
p_protect_sext<- exp(-(time/lambda_sext)^w_sext)
p_protect_other<- exp(-(time/lambda_other)^w_other)

prob_inf<-1-exp(-inc_pd*dt)  ## prob of infection at each time step

## simulate reinfection in a control vs two chemoprevention groups in a simple difference equation set up.

control<-treated<- treated_I_trip<- treated_I_quadr<-treated_I_quint<-treated_I_sext<-treated_I_other<-vector(length=length(time))   

##start with everyone being uninfected (at risk) at the first time point

treated_I_trip[1]<-0
treated_I_quadr[1]<-0
treated_I_sext[1]<-0
treated_I_quint[1]<-0
treated_I_other[1]<-0

treated[1]<-1
control[1]<-1  
PEdata$SP_PE[1]<-1

######run for each 
raster_mediandur<-raster_data_oth

for (r in 1: length(raster_data_oth)){

freq_trip<-raster_data_tripl[r]
freq_quadr<-raster_data_quadr[r]     
freq_quint<-raster_data_quint[r]
freq_sext<- raster_data_sext[r]
freq_other<- raster_data_oth[r]

if (!(is.na(raster_data_oth[r]))){
  
for(i in 2:length(time)) {
  control[i]<-control[i-1] - prob_inf*control[i-1]  
  treated_I_trip[i]<-treated_I_trip[i-1]+ (prob_inf*freq_trip*treated[i-1]*(1-p_protect_trip[i]))  ## proportion of new infections with S in treated group
  treated_I_quadr[i]<-treated_I_quadr[i-1]+ (prob_inf*freq_quadr*treated[i-1]*(1-p_protect_quadr[i]))  ## proportion of new infections with S in treated group
  treated_I_quint[i]<-treated_I_quint[i-1]+ (prob_inf*freq_quint*treated[i-1]*(1-p_protect_quint[i]))   ## proportion of new infections with S in treated group
  treated_I_sext[i]<-treated_I_sext[i-1]+ (prob_inf*freq_sext*treated[i-1]*(1-p_protect_sext[i])) 
  treated_I_other[i]<-treated_I_other[i-1]+ (prob_inf*freq_other*treated[i-1]*(1-p_protect_other[i])) 
  PEdata$SP_PE[i]<- (freq_trip*(p_protect_trip[i])) + 
    (freq_quadr*(p_protect_quadr[i]))+
    (freq_quint*(p_protect_quint[i]))+
    (freq_sext*(p_protect_sext[i]))+
    (freq_other*(p_protect_other[i]))
  
  treated[i]<-treated[i-1] -  
    (prob_inf*freq_trip*treated[i-1]*(1-p_protect_trip[i]))  -  
    (prob_inf*freq_quadr*treated[i-1]*(1-p_protect_quadr[i]))  -  
    (prob_inf*freq_quint*treated[i-1]*(1-p_protect_quint[i]))  - 
    (prob_inf*freq_sext *treated[i-1]*(1-p_protect_sext[i]))   -
    (prob_inf*freq_other *treated[i-1]*(1-p_protect_other[i]))   
}
  raster_mediandur[r]<-PEdata$time[which(abs(PEdata$SP_PE-0.5)==min(abs(PEdata$SP_PE-0.5)))]  ### this line will tell you at which day protective efficacy is 50% (ie. median duration of protection)
  
}
print(r)

}

# saveRDS(raster_mediandur, "raster_mediandur.RData")

raster_mediandur<-readRDS("raster_mediandur.rdata")

time<-seq(from=0,to=30,by=dt)      #### Ran for 60 days, Protective Efficacy will depend on which time interval is being reported.


p_protect_trip<- exp(-(time/lambda_trip)^w_trip)
p_protect_quadr<- exp(-(time/lambda_quadr)^w_quadr)
p_protect_quint<- exp(-(time/lambda_quint)^w_quint)
p_protect_sext<- exp(-(time/lambda_sext)^w_sext)
p_protect_other<- exp(-(time/lambda_other)^w_other)


mean_trip<-mean(p_protect_trip)
mean_quadr<-mean(p_protect_quadr)
mean_quint<-mean(p_protect_quint)
mean_sext<-mean(p_protect_sext)
mean_other<-mean(p_protect_other)

raster_30DPE<-raster_data_oth

for (p in 1: length(raster_data_oth)){

  if (!(is.na(raster_data_oth[p]))){
  raster_30DPE[p]<- mean_trip* raster_data_tripl[p] +
                    mean_quadr* raster_data_quadr[p]  +
                    mean_quint* raster_data_quint[p] +
                    mean_sext* raster_data_sext[p] +
                    mean_other*raster_data_oth[p]
    print(p)
  }
}
# 
# saveRDS(raster_30DPE, "raster_30DPE.RData")

raster_30DPE<-readRDS("raster_30DPE.RData")
  
par(mfrow = c(1, 2))
plot(raster_30DPE, main ="30-day protective efficacy" )
plot(raster_mediandur, main ="Median duration of protection" )



SSA_adm0_conv<-SSA_adm0
# Convert geometry from degrees to radians
SSA_adm0_conv$geometry <- st_geometry(SSA_adm0) * (pi / 180)

# Now SSA_adm0 geometry is in radians



# Set up the pdf output with specified dimensions
pdf("raster_plots2.pdf", width = 7.09, height = 3.55)

# Set up the layout for two panels side by side
par(mfrow = c(1, 2), mar = c(5, 4, 4, 5))  # Right margin increased to 5

# Plot Panel A: 30-day protective efficacy
plot(raster_30DPE, axes = TRUE, box = FALSE, main = "a. 30-day protective efficacy", cex.main = 0.7, cex.axis = 0.6, cex.lab = 0.7)
# Add the shapefile with a thinner border (adjusting lwd for line width)
plot(SSA_adm0_conv$geometry, add = TRUE, lwd = 0.5)  # lwd controls the thickness of the line

# Plot Panel B: Median duration of protection
plot(raster_mediandur, axes = TRUE, box = FALSE, main = "b. Median duration of protection", cex.main = 0.7, cex.axis = 0.6, cex.lab = 0.7)
# Add the shapefile with a thinner border (adjusting lwd for line width)
plot(SSA_adm0_conv$geometry, add = TRUE, lwd = 0.5)  # lwd controls the thickness of the line

# Reset the layout to default
par(mfrow = c(1, 1))

# Save the file
dev.off()



# pdf("raster_plots2.pdf",width = 10, height = 5)
# 
# # Set up the layout for two panels side by side
# #par(mfrow = c(1, 2))
# par(mfrow = c(1, 2), mar = c(5, 4, 4, 8))  # Increase right margin with `mar`
# 
# # Plot Panel A: 30-day protective efficacy
# plot(raster_30DPE, axes = FALSE, box = FALSE, main = "a. 30-day protective efficacy")
# plot(SSA_adm0_conv$geometry, add = TRUE)
# 
# # Plot Panel B: Median duration of protection
# plot(raster_mediandur, axes = FALSE, box = FALSE, main = "b. Median duration of protection")
# plot(SSA_adm0_conv$geometry, add = TRUE)
# 
# # Reset the layout to default
# par(mfrow = c(1, 1))
# dev.off()

#### supplementary materials plots

pdf("raster_plots_freqs.pdf",width = 8, height = 10)


# Create a new graphics device with 3 rows and 2 columns
par(mfrow = c(3, 2))

# Plot each histogram
plot(raster_data_sext, axes = FALSE, box = FALSE, main = "dhps GEG (437G-540E-581G)")
plot(SSA_adm0_conv$geometry, add = TRUE)

plot(raster_data_quint, axes = FALSE, box = FALSE, main = "dhps GEA (437G-540E-A581)")
plot(SSA_adm0_conv$geometry, add = TRUE)

plot(raster_data_quadr, axes = FALSE, box = FALSE, main = "dhps GKA (437G-K540-A581)")
plot(SSA_adm0_conv$geometry, add = TRUE)

plot(raster_data_tripl, axes = FALSE, box = FALSE, main = "dhps AKA (A437-K540-A581)")
plot(SSA_adm0_conv$geometry, add = TRUE)

plot(raster_data_oth, axes = FALSE, box = FALSE, main = "All 4 'other' dhps combinations \n (AEG, AKG, AEA, GKG)")
plot(SSA_adm0_conv$geometry, add = TRUE)

dev.off()



# 