# Load packages---------------------------------------------------------------------------
library(dplyr)
library(ggplot2)
library(viridis)  
library(raster)
library(gridExtra)
library(rgdal)
library(sf)

########################################################################

combined_data<-readRDS("data/inc_prev_loess.rds")

loess_fit_0_2 <- loess(clin_inc_0_2 ~ prev_2_10, data = combined_data)
loess_fit_0_5 <- loess(clin_inc_0_5 ~ prev_2_10, data = combined_data)

prev_seq <- data.frame(prev_2_10 = seq(0, 1, by = 0.001))
prev_seq$clin_inc_0_2 <- predict(loess_fit_0_2 , newdata = prev_seq)
prev_seq$clin_inc_0_5 <- predict(loess_fit_0_5 , newdata = prev_seq)


ggplot(combined_data, aes(x = prev_2_10, y = clin_inc_0_2)) +
  geom_point() +
  geom_line(data = prev_seq, aes(x = prev_2_10, y = clin_inc_0_2), color = "blue") +
  labs(title = "LOESS Fit", x = "Prev 2-10", y = "Clin Inc 0-2")

combined_data$extra <- as.factor(combined_data$extra)

ggplot(combined_data, aes(x = prev_2_10, y = clin_inc_0_2)) +
  geom_point(aes(color = extra)) +  # Color points by 'extra'
  geom_line(data = prev_seq, aes(x = prev_2_10, y = clin_inc_0_2), color = "blue") +
  labs(title = "LOESS Fit", x = "Prev 2-10", y = "Clin Inc 0-2", color = "Extra")
saveRDS(loess_fit_0_2,"data/loess_fit_0_2.rds")
saveRDS(loess_fit_0_5,"data/loess_fit_0_5.rds")

loess_fit_0_2<-readRDS("data/loess_fit_0_2.rds")
loess_fit_0_5<-readRDS("data/loess_fit_0_5.rds")

#####################
# Extract prev from the Malaria Atlas Project raster files downloaded 8/11/24 -> file name: 2024_GBD2023_Global_PfPR_2022.tif
# Weight for population with Worldpop. 
#####################

###### SHAPE FILE FOR WHOLE AFRICA
### load some shape file e.g.
# Load Africa shapefile
shp0 <- sf::st_read("data/GADM_Africa_Admin0.shp")


###########
# PREVALENCE FROM MAP
# Read in one prevalence - year raster to be able to crop population shapefile to same extent.
###########
### index prev raster file MAP
p<-raster("data/2024_GBD2023_Global_PfPR_2022.tif")

### crop to be Africa only
map_af<-crop(p,extent(shp0))

# 1. Extract prevalence values from the raster
map_values <- getValues(map_af)

# 2. Match each raster prevalence value to the closest prev_2_10 in prev_seq
# Create a function to find the closest value
match_closest <- function(x, target_values) {
  target_values[which.min(abs(target_values - x))]
}
# Apply the function across all raster values
matched_prev <- sapply(map_values, match_closest, target_values = prev_seq$prev_2_10)

# 3. Map the matched prev_2_10 values to corresponding clin_inc_0_2 values
# Create a lookup table from prev_seq
lookup_table_0_2 <- prev_seq %>% 
  dplyr::select(prev_2_10, clin_inc_0_2) %>%
  distinct()
lookup_table_0_5 <- prev_seq %>% 
  dplyr::select(prev_2_10, clin_inc_0_5) %>%
  distinct()

# Use a named vector for fast lookup
lookup_vector_0_2 <- setNames(lookup_table_0_2$clin_inc_0_2, lookup_table_0_2$prev_2_10)
lookup_vector_0_5 <- setNames(lookup_table_0_5$clin_inc_0_5, lookup_table_0_5$prev_2_10)

# Replace the matched prevalence values with clin_inc_0_2 values
clin_inc_values_0_2 <- lookup_vector_0_2[as.character(matched_prev)]
clin_inc_values_0_5 <- lookup_vector_0_5[as.character(matched_prev)]

# Handle any NAs if necessary
#clin_inc_values[is.na(clin_inc_values)] <- NA  # Replace NA with 0 or other desired value

# 4. Create a new raster with the updated clin_inc_0_2 values
clin_inc_0_2_no_dose <- raster(map_af)  # Create a copy of the original raster
clin_inc_0_5_no_dose <- raster(map_af)  # Create a copy of the original raster
values(clin_inc_0_2_no_dose) <- clin_inc_values_0_2  # Assign new values
values(clin_inc_0_5_no_dose) <- clin_inc_values_0_5  # Assign new values

# 5. Save or plot the new raster
plot(clin_inc_0_2_no_dose, main = "Clinical Incidence ages 0-2 without dose")
plot(clin_inc_0_5_no_dose, main = "Clinical Incidence ages 0-5 without dose")

writeRaster(clin_inc_0_2_no_dose, filename = "clin_inc_0_2_no_dose.tif", format = "GTiff", overwrite = TRUE)
writeRaster(clin_inc_0_5_no_dose, filename = "clin_inc_0_5_no_dose.tif", format = "GTiff", overwrite = TRUE)



################################
#### POPULATION DATA RASTERS
#### population raster from worldpop
#https://www.worldpop.org/geodata/summary?id=24776

### index population raster file
## only run for the whole world once, then save cropped raster to save storage
f <- "data/ppp_2020_1km_Aggregated.tif"
pop <- raster(f)
#crop shapefiles to same size to Africa using extent
pop_af<-crop(pop, extent(map_af))
pop_af_5k<-raster::aggregate(pop_af,5,fun=sum)

# Generate the new raster
pop_af_5k_modhigh <- pop_af_5k
values(pop_af_5k_modhigh) <- ifelse(values(map_af) < 0.1, NA, values(pop_af_5k)) ## replaces pop pixel with NA if low transmission (<10%)



## extract sum of pop for each adm0 in pixels that are >10% prev
af_sum_pop<-extract(pop_af_5k_modhigh,shp0,fun=sum,na.rm=T)  #### slow to run
shp0$af_sum_pop_2020<-af_sum_pop



###### changing the units from incidence pppy to incidence per 100 kids across 30 days:

clin_inc_0_2_no_dose<-clin_inc_0_2_no_dose * (30/365) *100
clin_inc_0_5_no_dose<-clin_inc_0_5_no_dose * (30/365) *100




##################################################################################

# Convert the raster to a dataframe for ggplot2
raster_df_clin_inc_0_2_no_dose <- as.data.frame(raster::rasterToPoints(clin_inc_0_2_no_dose))
raster_df_clin_inc_0_5_no_dose <- as.data.frame(raster::rasterToPoints(clin_inc_0_5_no_dose))
#summary(raster_df_clin_inc_0_2_no_dose$layer)


raster_df_clin_inc_0_2_no_dose$layer[raster_df_clin_inc_0_2_no_dose$layer <= 0.05] <- NA
raster_df_clin_inc_0_5_no_dose$layer[raster_df_clin_inc_0_5_no_dose$layer <= 0.05] <- NA


# Define consistent color scale limits
color_limits <- c(0, 50)  # Same range for both plots

# Plot 1: Age 0 to 2
p1 <- ggplot() +
  # Overlay raster data with geom_tile
  geom_tile(data = raster_df_clin_inc_0_2_no_dose, aes(x = x, y = y, fill = layer)) +
  scale_fill_viridis(
    option = "plasma", 
    name = "Clinical Incidence    \n(per 100)",
    na.value = "white",  # Set NA values to white
    trans = "sqrt",                # Square root transformation
    limits = color_limits,         # Consistent color scale limits
    breaks = c(0, 10, 20, 30, 40, 50),  # Explicit breaks for clarity
    labels = scales::label_number()
  ) +
  coord_fixed() +
  labs(
    title = "Clinical incidence without SP dose (Age 0 to 2)",
    x = "Longitude", 
    y = "Latitude"
  ) +
  theme_minimal() +
  theme(
    axis.text = element_blank(),   # Remove axis labels
    axis.ticks = element_blank(),  # Remove axis ticks
    axis.title = element_blank(),  # Remove axis titles
    panel.grid = element_blank()   # Remove gridlines
  ) +
  # Add Africa map as a background
  geom_sf(data = shp0, color = "black", fill = alpha("black", 0.0))



# Plot 2: Age 0 to 5
p2 <- ggplot() +
  # Overlay raster data with geom_tile
  geom_tile(data = raster_df_clin_inc_0_5_no_dose, aes(x = x, y = y, fill = layer)) +
  scale_fill_viridis(
    option = "plasma", 
    name = "Clinical Incidence    \n(per 100)",
    na.value = "white",  # Set NA values to white
    trans = "sqrt",                # Square root transformation
    limits = color_limits,         # Consistent color scale limits
    breaks = c(0, 10, 20, 30, 40, 50),  # Explicit breaks for clarity
    labels = scales::label_number()
  ) +
  coord_fixed() +
  labs(
    title = "Clinical incidence without SP dose (Age 0 to 5)",
    x = "Longitude", 
    y = "Latitude"
  ) +
  theme_minimal()+
  theme(
    axis.text = element_blank(),   # Remove axis labels
    axis.ticks = element_blank(),  # Remove axis ticks
    axis.title = element_blank(),  # Remove axis titles
    panel.grid = element_blank()   # Remove gridlines
  )+
  # Add Africa map as a background
  geom_sf(data = shp0, color = "black", fill=alpha("black", 0.0))

# Arrange both plots side by si
grid.arrange(p1, p2, ncol = 2)


######################adding a dose:

# Read in the raster
raster_30DPE <- readRDS("raster_30DPE.RData")

# View the current coordinates (radians)
extent(raster_30DPE)

# Get the grid cell coordinates (x and y)
coords <- rasterToPoints(raster_30DPE)

# Convert the coordinates from radians to degrees
coords[, 1] <- coords[, 1] * (180 / pi)  # Convert x (longitude) from radians to degrees
coords[, 2] <- coords[, 2] * (180 / pi)  # Convert y (latitude) from radians to degrees

# Create a new raster with the transformed coordinates
raster_30DPE_degrees <- rasterFromXYZ(coords)

# Update the CRS to reflect the correct projection in degrees
crs(raster_30DPE_degrees) <- CRS("+proj=longlat +datum=WGS84")

# Check the extent and CRS of the new raster
extent(raster_30DPE_degrees)
crs(raster_30DPE_degrees)

# Now plot the transformed raster (30-day protective efficacy as a proportion)
plot(raster_30DPE_degrees)

# Assuming the raster_df_clin_inc_0_5_no_dose dataframe has columns: x, y, and layer
raster_df_clin_inc_0_5_no_dose_raster <- rasterFromXYZ(raster_df_clin_inc_0_5_no_dose[, c("x", "y", "layer")])
raster_df_clin_inc_0_2_no_dose_raster <- rasterFromXYZ(raster_df_clin_inc_0_2_no_dose[, c("x", "y", "layer")])


# Make sure the CRS matches (you can set the CRS manually if needed)
crs(raster_df_clin_inc_0_5_no_dose_raster) <- crs(raster_30DPE)
crs(raster_df_clin_inc_0_2_no_dose_raster) <- crs(raster_30DPE)

# Resample to match the target raster
raster_30DPE_resampled_0_5 <- resample(raster_30DPE_degrees, raster_df_clin_inc_0_5_no_dose_raster, method = "bilinear")
raster_30DPE_resampled_0_2 <- resample(raster_30DPE_degrees, raster_df_clin_inc_0_2_no_dose_raster, method = "bilinear")


# Mask both rasters
raster_30DPE_resampled_masked_0_5 <- mask(raster_30DPE_resampled_0_5, raster_df_clin_inc_0_5_no_dose_raster)
raster_30DPE_resampled_masked_0_2 <- mask(raster_30DPE_resampled_0_2, raster_df_clin_inc_0_5_no_dose_raster)

raster_df_clin_inc_0_5_no_dose_masked <- mask(raster_df_clin_inc_0_5_no_dose_raster, raster_30DPE_resampled_masked_0_5)
raster_df_clin_inc_0_2_no_dose_masked <- mask(raster_df_clin_inc_0_2_no_dose_raster, raster_30DPE_resampled_masked_0_2)


# Multiply the rasters
raster_df_clin_inc_0_5_with_dose <- raster_df_clin_inc_0_5_no_dose_masked * (1-raster_30DPE_resampled_masked_0_5) 
raster_df_clin_inc_0_2_with_dose <- raster_df_clin_inc_0_2_no_dose_masked * (1-raster_30DPE_resampled_masked_0_2) 

# Convert to data frame for plotting
raster_df_clin_inc_0_5_with_dose_df <- as.data.frame(raster_df_clin_inc_0_5_with_dose, xy = TRUE)
raster_df_clin_inc_0_2_with_dose_df <- as.data.frame(raster_df_clin_inc_0_2_with_dose, xy = TRUE)



# Plot with modifications 0_2
p3<-
  ggplot() +
  # Overlay raster data with geom_tile
  geom_tile(data = raster_df_clin_inc_0_2_with_dose_df, aes(x = x, y = y, fill = layer)) +
 # geom_raster(na.rm = FALSE) +  # Ensure NA values are included
  scale_fill_viridis(
    option = "plasma", 
    name = "Clinical Incidence    \n(per 100)", 
    na.value = "white",  # Set NA values to white
    trans = "sqrt",                # Square root transformation
    limits = color_limits,         # Consistent color scale limits
    breaks = c(0, 10, 20, 30, 40, 50),  # Explicit breaks for clarity
    labels = scales::label_number()
  )  +
  coord_fixed() +
  labs(title = "Clinical incidence with SP dose (Age 0 to 2)") +
  theme_minimal() +
  theme(
    axis.title = element_blank(),  # Remove axis titles
    axis.text = element_blank(),   # Remove axis labels
    axis.ticks = element_blank(),  # Remove axis ticks
    panel.grid = element_blank()   # Remove gridlines
  )+
  # Add Africa map as a background
  geom_sf(data = shp0, color = "black", fill=alpha("black", 0.0))
# Plot with modifications 0_5
p4<- ggplot() +
  # Overlay raster data with geom_tile
  geom_tile(data = raster_df_clin_inc_0_5_with_dose_df, aes(x = x, y = y, fill = layer)) +
  #geom_raster(na.rm = FALSE) +  # Ensure NA values are included
  scale_fill_viridis(
    option = "plasma", 
    name = "Clinical Incidence    \n(per 100)", 
    na.value = "white",  # Set NA values to white
    trans = "sqrt",                # Square root transformation
    limits = color_limits,         # Consistent color scale limits
    breaks = c(0, 10, 20, 30, 40, 50),  # Explicit breaks for clarity
    labels = scales::label_number()) +
  coord_fixed() +
  labs(title = "Clinical Incidence with SP dose (Age 0 to 5)") +
  theme_minimal() +
  theme(
    axis.title = element_blank(),  # Remove axis titles
    axis.text = element_blank(),   # Remove axis labels
    axis.ticks = element_blank(),  # Remove axis ticks
    panel.grid = element_blank()   # Remove gridlines
  )+
  # Add Africa map as a background
  geom_sf(data = shp0, color = "black", fill=alpha("black", 0.0))
# Subtract the rasters to get cases averted

raster_difference_0_5 <- raster_df_clin_inc_0_5_no_dose_raster - raster_df_clin_inc_0_5_with_dose
raster_difference_0_2 <- raster_df_clin_inc_0_2_no_dose_raster - raster_df_clin_inc_0_2_with_dose


# Convert the difference raster to a data frame
raster_difference_df_0_5 <- as.data.frame(raster_difference_0_5, xy = TRUE)
raster_difference_df_0_2 <- as.data.frame(raster_difference_0_2, xy = TRUE)

# Plot the difference in clinical incidence due to dose
# 0 to 2
p5<-ggplot() +
  # Overlay raster data with geom_tile
  geom_tile(data = raster_difference_df_0_2, aes(x = x, y = y, fill = layer)) +
  geom_raster() +
  scale_fill_viridis(
    option = "plasma", 
    name = "Clinical cases averted \n(per 100 per dose)", 
    na.value = "white",  # Set NA values to white
    trans = "sqrt",                # Square root transformation
    limits = color_limits,         # Consistent color scale limits
    breaks = c(0, 10, 20, 30, 40, 50),  # Explicit breaks for clarity
    labels = scales::label_number()) +
  coord_fixed() +
  labs(
    title = "Clinical cases averted (Age 0 to 2)",
    x = "Longitude",
    y = "Latitude"
  ) +
  theme_minimal()+
  theme(
    axis.title = element_blank(),  # Remove axis titles
    axis.text = element_blank(),   # Remove axis labels
    axis.ticks = element_blank(),  # Remove axis ticks
    panel.grid = element_blank()   # Remove gridlines
  )+
  # Add Africa map as a background
  geom_sf(data = shp0, color = "black", fill=alpha("black", 0.0))


##0 to 5

p6<- ggplot() +
  # Overlay raster data with geom_tile
  geom_tile(data = raster_difference_df_0_5, aes(x = x, y = y, fill = layer)) +
  scale_fill_viridis(
    option = "plasma", 
    name = "Clinical cases averted \n(per 100 per dose)", 
    na.value = "white",  # Set NA values to white
    trans = "sqrt",                # Square root transformation
    limits = color_limits,         # Consistent color scale limits
    breaks = c(0, 10, 20, 30, 40, 50),  # Explicit breaks for clarity
    labels = scales::label_number()) +
  coord_fixed() +
  labs(
    title = "Clinical cases averted (Age 0 to 5)",
    x = "Longitude",
    y = "Latitude"
  ) +
  theme_minimal()+
  theme(
    axis.title = element_blank(),  # Remove axis titles
    axis.text = element_blank(),   # Remove axis labels
    axis.ticks = element_blank(),  # Remove axis ticks
    panel.grid = element_blank()   # Remove gridlines
  )+
  # Add Africa map as a background
  geom_sf(data = shp0, color = "black", fill=alpha("black", 0.0))



# Combine plots into a panel
#combined_plots <- grid.arrange(p1, p2, p3, p4, p5, p6, ncol = 2)

# Save the panel as a TIFF file
tiff("combined_plots.tiff", width = 10, height = 10, units = "in", res = 300)  # Adjust dimensions and resolution as needed
grid.arrange(p1, p2, p3, p4, p5, p6, ncol = 2)
dev.off()



summary(raster_difference_df)



clin_inc_0_2_no_dose_modhigh<-clin_inc_0_2_no_dose
values(clin_inc_0_2_no_dose_modhigh)<- ifelse(values(map_af) < 0.1, NA, values(clin_inc_0_2_no_dose_modhigh)) ## replaces cases averted (per pop per dose) pixel with NA if low transmission (<10%)

raster_30DPE_resampled_0_2_modhigh<-raster_30DPE_resampled_0_2
values(raster_30DPE_resampled_0_2_modhigh)<- ifelse(values(map_af) < 0.1, NA, values(raster_30DPE_resampled_0_2_modhigh)) ## replaces cases averted (per pop per dose) pixel with NA if low transmission (<10%)

raster_df_clin_inc_0_2_with_dose_modhigh<-raster_df_clin_inc_0_2_with_dose
values(raster_df_clin_inc_0_2_with_dose_modhigh)<- ifelse(values(map_af) < 0.1, NA, values(raster_df_clin_inc_0_2_with_dose_modhigh)) ## replaces cases averted (per pop per dose) pixel with NA if low transmission (<10%)

raster_difference_0_2_modhigh<-raster_difference_0_2
values(raster_difference_0_2_modhigh)<-ifelse(values(map_af) < 0.1, NA, values(raster_difference_0_2_modhigh))

median(getValues(clin_inc_0_2_no_dose_modhigh), na.rm = TRUE)
median(getValues(raster_30DPE_resampled_0_2_modhigh), na.rm = TRUE)
median(getValues(raster_df_clin_inc_0_2_with_dose_modhigh), na.rm = TRUE)
median(getValues(raster_difference_0_2_modhigh), na.rm = TRUE)


##################################################
######  OVERLAY the two rasters to get weights.
##########################
## first make a new raster which is rate*pop
## Use pop at 5k resolution created above.
af_wgt <- overlay(pop_af_5k_modhigh, raster_difference_0_2_modhigh, fun=function(x,y){return(x*y)})

####################
## EXTRACT sum of prev*pop for each adm1 USING SHAPE FILES
af_sum_wgt<-extract(af_wgt,shp0,fun=sum,na.rm=T)  ## slow to run

####################

shp0$weighted_cases_av_p100pdose<-af_sum_wgt[,1]/shp0$af_sum_pop_2020

###check for individual countries

# Find the indices of the top 3 highest values
top_indices <- order(shp0$weighted_cases_av_p100pdose, decreasing = TRUE)[1:4]
# Get the corresponding ADM0_NAME values
shp0$ADM0_NAME[top_indices]
### highest are:

##Liberia
##Benin
##Sierra Leone
##DRC

#mean for the whole of africa in mod-high transmission areas:

cellStats(af_wgt, stat = "sum")/ sum(shp0$af_sum_pop_2020, na.rm = TRUE)

###################################################################################################################
###sanity check:

# Define the coordinates
coordinates <- matrix(c(20, 0), ncol = 2)

median(getValues(clin_inc_0_2_no_dose_modhigh), na.rm = TRUE)
median(getValues(raster_30DPE_resampled_0_2_modhigh), na.rm = TRUE)
median(getValues(raster_df_clin_inc_0_2_with_dose_modhigh), na.rm = TRUE)
median(getValues(raster_difference_0_2_modhigh), na.rm = TRUE)


# List all rasters
raster_list <- list(
  clin_inc_0_2_no_dose_modhigh,
  raster_30DPE_resampled_0_2_modhigh,
  raster_df_clin_inc_0_2_with_dose_modhigh,
  raster_difference_0_2_modhigh
)

# Names for the rasters (for readability in output)
raster_names <- c(
  "clin_inc_0_2_no_dose_modhigh",
  "raster_30DPE_resampled_0_2_modhigh",
  "raster_df_clin_inc_0_2_with_dose_modhigh",
  "raster_difference_0_2_modhigh"
)

# Extract values for each raster
extracted_values <- sapply(raster_list, function(raster) extract(raster, coordinates))

# Combine into a data frame
results <- data.frame(
  Raster = raster_names,
  Value = extracted_values
)

# Print the results
print(results)


# 
# ######   FOR THE MAIN FIGURE

# Save the figure as PDF
pdf("Figure7.pdf", width = 8, height = 6)

ggplot() +
  # Overlay raster data with geom_tile
  geom_tile(data = raster_difference_df_0_2, aes(x = x, y = y, fill = layer)) +
  geom_raster() +
  scale_fill_viridis(
    option = "plasma", 
    name = "Clinical cases averted \nper 100 per dose", 
    na.value = "white",  # Set NA values to white
    trans = "sqrt",                # Square root transformation
    limits = color_limits,         # Consistent color scale limits
    breaks = c(0, 10, 20, 30, 40, 50),  # Explicit breaks for clarity
    labels = scales::label_number()) +
  
  coord_fixed() +
  labs(
    title = "",
    x = "Longitude",
    y = "Latitude"
  ) +
  theme_minimal()+
  theme(
    panel.grid.major = element_blank(),  # Remove major gridlines
    panel.grid.minor = element_blank(),  # Remove minor gridlines
    axis.title = element_text(size = 6), # Keep axis titles, adjust size if needed
    axis.text = element_text(size = 5),  # Keep axis labels, adjust size
    axis.ticks = element_line(size = 0.3), # Keep axis ticks, make thinner
    legend.title = element_text(hjust = 0.5, margin = margin(b = 10)), # Center legend title with margin
    legend.spacing = unit(0.5, "cm")  # Space between title and key scale
  )+
  # Add Africa map as a background
  geom_sf(data = shp0, color = "black", fill=alpha("black", 0.0))
dev.off()


# Save the figure as PDF with correct dimensions
pdf("Figure7.pdf", width = 7.09, height = 5.32)

ggplot() +
  # Overlay raster data with geom_tile
  geom_tile(data = raster_difference_df_0_2, aes(x = x, y = y, fill = layer)) +
  geom_raster() +
  scale_fill_viridis(
    option = "plasma", 
    name = "Clinical cases averted \nper 100 per dose", 
    na.value = "white",  # Set NA values to white
    trans = "sqrt",      # Square root transformation
    limits = color_limits,      
    breaks = c(0, 10, 20, 30, 40, 50),  
    labels = scales::label_number()
  ) +
  coord_fixed() +
  labs(
    title = "",
    x = "Longitude",
    y = "Latitude"
  ) +
  theme_minimal() +
  theme(
    panel.grid.major = element_blank(),  
    panel.grid.minor = element_blank(),  
    axis.title = element_text(size = 7), # Axis title size updated
    axis.text = element_text(size = 7),  # Axis labels size updated
    axis.ticks = element_line(size = 0.3), 
    axis.line = element_line(color = "black", size = 0.2), # Solid black axis lines
    legend.title = element_text(size = 7, hjust = 0.5, margin = margin(b = 10)), # Legend title size updated
    legend.text = element_text(size = 7),  # Legend label size updated
    legend.spacing = unit(0.5, "cm")
  ) +
  # Add Africa map as a background
  geom_sf(data = shp0, color = "black", fill=alpha("black", 0.0))

dev.off()

