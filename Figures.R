
# library(matrixStats)
# library(gdata)
library(ggplot2)
library(cowplot)
library(rstan)
library(bayesplot)
library(dplyr)
library(DescTools)


##read in data

input_df<- read.csv("data/combined_data.csv")  ### REINFECTION DATA

input_df<- input_df %>%
  rowwise() %>% 
mutate(N_I_total = sum (N_I_tripl, N_I_quadr, N_I_quint, N_I_sext,N_I_undeterm, na.rm=TRUE))

freq_day0_df<-read.csv("data/day0_frequencies.csv")  ##FREQUENCY ON DAY0 DATA

####  read in model

model<-readRDS("model_all_combined_10000iters.RData")

params<-rstan::extract( model)

dt=0.5

####READ IN PREDICTIONS FROM GENERATED QUANTITIES

new_y<-extract(model,pars="pr_treated_I_quint_SP_Bell")
new_pr_treated_I_quint_SP_Bell<-apply(new_y[[1]],2,quantile,probs=c(0.025,0.5,0.975)) #the median line with 95% credible intervals
new_pr_treated_I_quint_SP_Bell<-as.data.frame(t(new_pr_treated_I_quint_SP_Bell))
new_pr_treated_I_quint_SP_Bell<-plyr::rename(new_pr_treated_I_quint_SP_Bell, c("2.5%"="low_treated_I_quint_SP_Bell", "50%"="med_treated_I_quint_SP_Bell", "97.5%"="high_treated_I_quint_SP_Bell"))
new_pr_treated_I_quint_SP_Bell$T<-NA
new_pr_treated_I_quint_SP_Bell$T<-seq(0,42,by=dt)

new_y<-extract(model,pars="pr_treated_I_quint_SP_AS_Bell")
new_pr_treated_I_quint_SP_AS_Bell<-apply(new_y[[1]],2,quantile,probs=c(0.025,0.5,0.975)) #the median line with 95% credible intervals
new_pr_treated_I_quint_SP_AS_Bell<-as.data.frame(t(new_pr_treated_I_quint_SP_AS_Bell))
new_pr_treated_I_quint_SP_AS_Bell<-plyr::rename(new_pr_treated_I_quint_SP_AS_Bell, c("2.5%"="low_treated_I_quint_SP_AS_Bell", "50%"="med_treated_I_quint_SP_AS_Bell", "97.5%"="high_treated_I_quint_SP_AS_Bell"))
new_pr_treated_I_quint_SP_AS_Bell$T<-NA
new_pr_treated_I_quint_SP_AS_Bell$T<-seq(0,42,by=dt)

new_y<-extract(model,pars="pr_treated_I_quint_SP_Gesase")
new_pr_treated_I_quint_SP_Gesase<-apply(new_y[[1]],2,quantile,probs=c(0.025,0.5,0.975)) #the median line with 95% credible intervals
new_pr_treated_I_quint_SP_Gesase<-as.data.frame(t(new_pr_treated_I_quint_SP_Gesase))
new_pr_treated_I_quint_SP_Gesase<-plyr::rename(new_pr_treated_I_quint_SP_Gesase, c("2.5%"="low_treated_I_quint_SP_Gesase", "50%"="med_treated_I_quint_SP_Gesase", "97.5%"="high_treated_I_quint_SP_Gesase"))
new_pr_treated_I_quint_SP_Gesase$T<-NA
new_pr_treated_I_quint_SP_Gesase$T<-seq(0,28,by=dt)

new_y<-extract(model,pars="pr_treated_I_sext_SP_Gesase")
new_pr_treated_I_sext_SP_Gesase<-apply(new_y[[1]],2,quantile,probs=c(0.025,0.5,0.975)) #the median line with 95% credible intervals
new_pr_treated_I_sext_SP_Gesase<-as.data.frame(t(new_pr_treated_I_sext_SP_Gesase))
new_pr_treated_I_sext_SP_Gesase<-plyr::rename(new_pr_treated_I_sext_SP_Gesase, c("2.5%"="low_treated_I_sext_SP_Gesase", "50%"="med_treated_I_sext_SP_Gesase", "97.5%"="high_treated_I_sext_SP_Gesase"))
new_pr_treated_I_sext_SP_Gesase$T<-NA
new_pr_treated_I_sext_SP_Gesase$T<-seq(0,28,by=dt)

new_y<-extract(model,pars="pr_treated_I_undeterm_SP_Gesase")
new_pr_treated_I_undeterm_SP_Gesase<-apply(new_y[[1]],2,quantile,probs=c(0.025,0.5,0.975)) #the median line with 95% credible intervals
new_pr_treated_I_undeterm_SP_Gesase<-as.data.frame(t(new_pr_treated_I_undeterm_SP_Gesase))
new_pr_treated_I_undeterm_SP_Gesase<-plyr::rename(new_pr_treated_I_undeterm_SP_Gesase, c("2.5%"="low_treated_I_undeterm_SP_Gesase", "50%"="med_treated_I_undeterm_SP_Gesase", "97.5%"="high_treated_I_undeterm_SP_Gesase"))
new_pr_treated_I_undeterm_SP_Gesase$T<-NA
new_pr_treated_I_undeterm_SP_Gesase$T<-seq(0,28,by=dt)

new_y<-extract(model,pars="pr_treated_I_quadr_SP_Nahum")
new_pr_treated_I_quadr_SP_Nahum<-apply(new_y[[1]],2,quantile,probs=c(0.025,0.5,0.975)) #the median line with 95% credible intervals
new_pr_treated_I_quadr_SP_Nahum<-as.data.frame(t(new_pr_treated_I_quadr_SP_Nahum))
new_pr_treated_I_quadr_SP_Nahum<-plyr::rename(new_pr_treated_I_quadr_SP_Nahum, c("2.5%"="low_treated_I_quadr_SP_Nahum", "50%"="med_treated_I_quadr_SP_Nahum", "97.5%"="high_treated_I_quadr_SP_Nahum"))
new_pr_treated_I_quadr_SP_Nahum$T<-NA
new_pr_treated_I_quadr_SP_Nahum$T<-seq(0,90,by=dt)

new_y<-extract(model,pars="pr_treated_I_quadr_SP_AS_Nahum")
new_pr_treated_I_quadr_SP_AS_Nahum<-apply(new_y[[1]],2,quantile,probs=c(0.025,0.5,0.975)) #the median line with 95% credible intervals
new_pr_treated_I_quadr_SP_AS_Nahum<-as.data.frame(t(new_pr_treated_I_quadr_SP_AS_Nahum))
new_pr_treated_I_quadr_SP_AS_Nahum<-plyr::rename(new_pr_treated_I_quadr_SP_AS_Nahum, c("2.5%"="low_treated_I_quadr_SP_AS_Nahum", "50%"="med_treated_I_quadr_SP_AS_Nahum", "97.5%"="high_treated_I_quadr_SP_AS_Nahum"))
new_pr_treated_I_quadr_SP_AS_Nahum$T<-NA
new_pr_treated_I_quadr_SP_AS_Nahum$T<-seq(0,90,by=dt)



new_x<-extract(model,pars="pr_treated_I_tripl_SP_Allen_Magude")
new_z<-extract(model,pars="pr_treated_I_quint_SP_Allen_Magude")
new_y<-new_x[[1]]+ new_z[[1]]
new_pr_treated_I_total_SP_Allen_Magude<-apply(new_y,2,quantile,probs=c(0.025,0.5,0.975)) #the median line with 95% credible intervals
new_pr_treated_I_total_SP_Allen_Magude<-as.data.frame(t(new_pr_treated_I_total_SP_Allen_Magude))
new_pr_treated_I_total_SP_Allen_Magude<-plyr::rename(new_pr_treated_I_total_SP_Allen_Magude, c("2.5%"="low_treated_I_total_SP_Allen_Magude", "50%"="med_treated_I_total_SP_Allen_Magude", "97.5%"="high_treated_I_total_SP_Allen_Magude"))
new_pr_treated_I_total_SP_Allen_Magude$T<-NA
new_pr_treated_I_total_SP_Allen_Magude$T<-seq(0,42,by=dt)

new_x<-extract(model,pars="pr_treated_I_tripl_SP_AS_Allen_Magude")
new_z<-extract(model,pars="pr_treated_I_quint_SP_AS_Allen_Magude")
new_y<-new_x[[1]]+ new_z[[1]]
new_pr_treated_I_total_SP_AS_Allen_Magude<-apply(new_y,2,quantile,probs=c(0.025,0.5,0.975)) #the median line with 95% credible intervals
new_pr_treated_I_total_SP_AS_Allen_Magude<-as.data.frame(t(new_pr_treated_I_total_SP_AS_Allen_Magude))
new_pr_treated_I_total_SP_AS_Allen_Magude<-plyr::rename(new_pr_treated_I_total_SP_AS_Allen_Magude, c("2.5%"="low_treated_I_total_SP_AS_Allen_Magude", "50%"="med_treated_I_total_SP_AS_Allen_Magude", "97.5%"="high_treated_I_total_SP_AS_Allen_Magude"))
new_pr_treated_I_total_SP_AS_Allen_Magude$T<-NA
new_pr_treated_I_total_SP_AS_Allen_Magude$T<-seq(0,42,by=dt)



new_x<-extract(model,pars="pr_treated_I_tripl_SP_Allen_Boane")
new_z<-extract(model,pars="pr_treated_I_quint_SP_Allen_Boane")
new_y<-new_x[[1]]+ new_z[[1]]
new_pr_treated_I_total_SP_Allen_Boane<-apply(new_y,2,quantile,probs=c(0.025,0.5,0.975)) #the median line with 95% credible intervals
new_pr_treated_I_total_SP_Allen_Boane<-as.data.frame(t(new_pr_treated_I_total_SP_Allen_Boane))
new_pr_treated_I_total_SP_Allen_Boane<-plyr::rename(new_pr_treated_I_total_SP_Allen_Boane, c("2.5%"="low_treated_I_total_SP_Allen_Boane", "50%"="med_treated_I_total_SP_Allen_Boane", "97.5%"="high_treated_I_total_SP_Allen_Boane"))
new_pr_treated_I_total_SP_Allen_Boane$T<-NA
new_pr_treated_I_total_SP_Allen_Boane$T<-seq(0,42,by=dt)

new_x<-extract(model,pars="pr_treated_I_tripl_SP_AS_Allen_Boane")
new_z<-extract(model,pars="pr_treated_I_quint_SP_AS_Allen_Boane")
new_y<-new_x[[1]]+ new_z[[1]]
new_pr_treated_I_total_SP_AS_Allen_Boane<-apply(new_y,2,quantile,probs=c(0.025,0.5,0.975)) #the median line with 95% credible intervals
new_pr_treated_I_total_SP_AS_Allen_Boane<-as.data.frame(t(new_pr_treated_I_total_SP_AS_Allen_Boane))
new_pr_treated_I_total_SP_AS_Allen_Boane<-plyr::rename(new_pr_treated_I_total_SP_AS_Allen_Boane, c("2.5%"="low_treated_I_total_SP_AS_Allen_Boane", "50%"="med_treated_I_total_SP_AS_Allen_Boane", "97.5%"="high_treated_I_total_SP_AS_Allen_Boane"))
new_pr_treated_I_total_SP_AS_Allen_Boane$T<-NA
new_pr_treated_I_total_SP_AS_Allen_Boane$T<-seq(0,42,by=dt)


new_x<-extract(model,pars="pr_treated_I_tripl_SP_Allen_Namaacha")
new_z<-extract(model,pars="pr_treated_I_quint_SP_Allen_Namaacha")
new_y<-new_x[[1]]+ new_z[[1]]
new_pr_treated_I_total_SP_Allen_Namaacha<-apply(new_y,2,quantile,probs=c(0.025,0.5,0.975)) #the median line with 95% credible intervals
new_pr_treated_I_total_SP_Allen_Namaacha<-as.data.frame(t(new_pr_treated_I_total_SP_Allen_Namaacha))
new_pr_treated_I_total_SP_Allen_Namaacha<-plyr::rename(new_pr_treated_I_total_SP_Allen_Namaacha, c("2.5%"="low_treated_I_total_SP_Allen_Namaacha", "50%"="med_treated_I_total_SP_Allen_Namaacha", "97.5%"="high_treated_I_total_SP_Allen_Namaacha"))
new_pr_treated_I_total_SP_Allen_Namaacha$T<-NA
new_pr_treated_I_total_SP_Allen_Namaacha$T<-seq(0,42,by=dt)

new_x<-extract(model,pars="pr_treated_I_tripl_SP_AS_Allen_Namaacha")
new_z<-extract(model,pars="pr_treated_I_quint_SP_AS_Allen_Namaacha")
new_y<-new_x[[1]]+ new_z[[1]]
new_pr_treated_I_total_SP_AS_Allen_Namaacha<-apply(new_y,2,quantile,probs=c(0.025,0.5,0.975)) #the median line with 95% credible intervals
new_pr_treated_I_total_SP_AS_Allen_Namaacha<-as.data.frame(t(new_pr_treated_I_total_SP_AS_Allen_Namaacha))
new_pr_treated_I_total_SP_AS_Allen_Namaacha<-plyr::rename(new_pr_treated_I_total_SP_AS_Allen_Namaacha, c("2.5%"="low_treated_I_total_SP_AS_Allen_Namaacha", "50%"="med_treated_I_total_SP_AS_Allen_Namaacha", "97.5%"="high_treated_I_total_SP_AS_Allen_Namaacha"))
new_pr_treated_I_total_SP_AS_Allen_Namaacha$T<-NA
new_pr_treated_I_total_SP_AS_Allen_Namaacha$T<-seq(0,42,by=dt)




new_x<-extract(model,pars="pr_treated_I_tripl_SP_Allen_Catuane")
new_z<-extract(model,pars="pr_treated_I_quint_SP_Allen_Catuane")
new_y<-new_x[[1]]+ new_z[[1]]
new_pr_treated_I_total_SP_Allen_Catuane<-apply(new_y,2,quantile,probs=c(0.025,0.5,0.975)) #the median line with 95% credible intervals
new_pr_treated_I_total_SP_Allen_Catuane<-as.data.frame(t(new_pr_treated_I_total_SP_Allen_Catuane))
new_pr_treated_I_total_SP_Allen_Catuane<-plyr::rename(new_pr_treated_I_total_SP_Allen_Catuane, c("2.5%"="low_treated_I_total_SP_Allen_Catuane", "50%"="med_treated_I_total_SP_Allen_Catuane", "97.5%"="high_treated_I_total_SP_Allen_Catuane"))
new_pr_treated_I_total_SP_Allen_Catuane$T<-NA
new_pr_treated_I_total_SP_Allen_Catuane$T<-seq(0,42,by=dt)

new_x<-extract(model,pars="pr_treated_I_tripl_SP_AS_Allen_Catuane")
new_z<-extract(model,pars="pr_treated_I_quint_SP_AS_Allen_Catuane")
new_y<-new_x[[1]]+ new_z[[1]]
new_pr_treated_I_total_SP_AS_Allen_Catuane<-apply(new_y,2,quantile,probs=c(0.025,0.5,0.975)) #the median line with 95% credible intervals
new_pr_treated_I_total_SP_AS_Allen_Catuane<-as.data.frame(t(new_pr_treated_I_total_SP_AS_Allen_Catuane))
new_pr_treated_I_total_SP_AS_Allen_Catuane<-plyr::rename(new_pr_treated_I_total_SP_AS_Allen_Catuane, c("2.5%"="low_treated_I_total_SP_AS_Allen_Catuane", "50%"="med_treated_I_total_SP_AS_Allen_Catuane", "97.5%"="high_treated_I_total_SP_AS_Allen_Catuane"))
new_pr_treated_I_total_SP_AS_Allen_Catuane$T<-NA
new_pr_treated_I_total_SP_AS_Allen_Catuane$T<-seq(0,42,by=dt)





new_x<-extract(model,pars="pr_treated_I_tripl_SP_RHXNJ")
new_pr_treated_I_tripl_SP_RHXNJ<-apply(new_x[[1]],2,quantile,probs=c(0.025,0.5,0.975)) #the median line with 95% credible intervals
new_pr_treated_I_tripl_SP_RHXNJ<-as.data.frame(t(new_pr_treated_I_tripl_SP_RHXNJ))
new_pr_treated_I_tripl_SP_RHXNJ<-plyr::rename(new_pr_treated_I_tripl_SP_RHXNJ, c("2.5%"="low_treated_I_tripl_SP_RHXNJ", "50%"="med_treated_I_tripl_SP_RHXNJ", "97.5%"="high_treated_I_tripl_SP_RHXNJ"))
new_pr_treated_I_tripl_SP_RHXNJ$T<-NA
new_pr_treated_I_tripl_SP_RHXNJ$T<-seq(0,42,by=dt)

new_z<-extract(model,pars="pr_treated_I_quint_SP_RHXNJ")
new_pr_treated_I_quint_SP_RHXNJ<-apply(new_z[[1]],2,quantile,probs=c(0.025,0.5,0.975)) #the median line with 95% credible intervals
new_pr_treated_I_quint_SP_RHXNJ<-as.data.frame(t(new_pr_treated_I_quint_SP_RHXNJ))
new_pr_treated_I_quint_SP_RHXNJ<-plyr::rename(new_pr_treated_I_quint_SP_RHXNJ, c("2.5%"="low_treated_I_quint_SP_RHXNJ", "50%"="med_treated_I_quint_SP_RHXNJ", "97.5%"="high_treated_I_quint_SP_RHXNJ"))
new_pr_treated_I_quint_SP_RHXNJ$T<-NA
new_pr_treated_I_quint_SP_RHXNJ$T<-seq(0,42,by=dt)


new_y<-new_x[[1]]+ new_z[[1]]
new_pr_treated_I_total_SP_RHXNJ<-apply(new_y,2,quantile,probs=c(0.025,0.5,0.975)) #the median line with 95% credible intervals
new_pr_treated_I_total_SP_RHXNJ<-as.data.frame(t(new_pr_treated_I_total_SP_RHXNJ))
new_pr_treated_I_total_SP_RHXNJ<-plyr::rename(new_pr_treated_I_total_SP_RHXNJ, c("2.5%"="low_treated_I_total_SP_RHXNJ", "50%"="med_treated_I_total_SP_RHXNJ", "97.5%"="high_treated_I_total_SP_RHXNJ"))
new_pr_treated_I_total_SP_RHXNJ$T<-NA
new_pr_treated_I_total_SP_RHXNJ$T<-seq(0,42,by=dt)


new_x<-extract(model,pars="pr_treated_I_tripl_SP_RZENT")
new_z<-extract(model,pars="pr_treated_I_quint_SP_RZENT")
new_y<-new_x[[1]]+ new_z[[1]]
new_pr_treated_I_total_SP_RZENT<-apply(new_y,2,quantile,probs=c(0.025,0.5,0.975)) #the median line with 95% credible intervals
new_pr_treated_I_total_SP_RZENT<-as.data.frame(t(new_pr_treated_I_total_SP_RZENT))
new_pr_treated_I_total_SP_RZENT<-plyr::rename(new_pr_treated_I_total_SP_RZENT, c("2.5%"="low_treated_I_total_SP_RZENT", "50%"="med_treated_I_total_SP_RZENT", "97.5%"="high_treated_I_total_SP_RZENT"))
new_pr_treated_I_total_SP_RZENT$T<-NA
new_pr_treated_I_total_SP_RZENT$T<-seq(0,42,by=dt)



new_x<-extract(model,pars="pr_treated_I_tripl_SP_NMMSB")
new_pr_treated_I_tripl_SP_NMMSB<-apply(new_x[[1]],2,quantile,probs=c(0.025,0.5,0.975)) #the median line with 95% credible intervals
new_pr_treated_I_tripl_SP_NMMSB<-as.data.frame(t(new_pr_treated_I_tripl_SP_NMMSB))
new_pr_treated_I_tripl_SP_NMMSB<-plyr::rename(new_pr_treated_I_tripl_SP_NMMSB, c("2.5%"="low_treated_I_tripl_SP_NMMSB", "50%"="med_treated_I_tripl_SP_NMMSB", "97.5%"="high_treated_I_tripl_SP_NMMSB"))
new_pr_treated_I_tripl_SP_NMMSB$T<-NA
new_pr_treated_I_tripl_SP_NMMSB$T<-seq(0,42,by=dt)

new_z<-extract(model,pars="pr_treated_I_quint_SP_NMMSB")
new_pr_treated_I_quint_SP_NMMSB<-apply(new_z[[1]],2,quantile,probs=c(0.025,0.5,0.975)) #the median line with 95% credible intervals
new_pr_treated_I_quint_SP_NMMSB<-as.data.frame(t(new_pr_treated_I_quint_SP_NMMSB))
new_pr_treated_I_quint_SP_NMMSB<-plyr::rename(new_pr_treated_I_quint_SP_NMMSB, c("2.5%"="low_treated_I_quint_SP_NMMSB", "50%"="med_treated_I_quint_SP_NMMSB", "97.5%"="high_treated_I_quint_SP_NMMSB"))
new_pr_treated_I_quint_SP_NMMSB$T<-NA
new_pr_treated_I_quint_SP_NMMSB$T<-seq(0,42,by=dt)


new_y<-new_x[[1]]+ new_z[[1]]
new_pr_treated_I_total_SP_NMMSB<-apply(new_y,2,quantile,probs=c(0.025,0.5,0.975)) #the median line with 95% credible intervals
new_pr_treated_I_total_SP_NMMSB<-as.data.frame(t(new_pr_treated_I_total_SP_NMMSB))
new_pr_treated_I_total_SP_NMMSB<-plyr::rename(new_pr_treated_I_total_SP_NMMSB, c("2.5%"="low_treated_I_total_SP_NMMSB", "50%"="med_treated_I_total_SP_NMMSB", "97.5%"="high_treated_I_total_SP_NMMSB"))
new_pr_treated_I_total_SP_NMMSB$T<-NA
new_pr_treated_I_total_SP_NMMSB$T<-seq(0,42,by=dt)



new_x<-extract(model,pars="pr_treated_I_tripl_SP_PEADD")
new_z<-extract(model,pars="pr_treated_I_quint_SP_PEADD")
new_y<-new_x[[1]]+ new_z[[1]]
new_pr_treated_I_total_SP_PEADD<-apply(new_y,2,quantile,probs=c(0.025,0.5,0.975)) #the median line with 95% credible intervals
new_pr_treated_I_total_SP_PEADD<-as.data.frame(t(new_pr_treated_I_total_SP_PEADD))
new_pr_treated_I_total_SP_PEADD<-plyr::rename(new_pr_treated_I_total_SP_PEADD, c("2.5%"="low_treated_I_total_SP_PEADD", "50%"="med_treated_I_total_SP_PEADD", "97.5%"="high_treated_I_total_SP_PEADD"))
new_pr_treated_I_total_SP_PEADD$T<-NA
new_pr_treated_I_total_SP_PEADD$T<-seq(0,42,by=dt)

new_y<-extract(model,pars="pr_treated_I_quint_SP_KZN")
new_pr_treated_I_quint_SP_KZN<-apply(new_y[[1]],2,quantile,probs=c(0.025,0.5,0.975)) #the median line with 95% credible intervals
new_pr_treated_I_quint_SP_KZN<-as.data.frame(t(new_pr_treated_I_quint_SP_KZN))
new_pr_treated_I_quint_SP_KZN<-plyr::rename(new_pr_treated_I_quint_SP_KZN, c("2.5%"="low_treated_I_quint_SP_KZN", "50%"="med_treated_I_quint_SP_KZN", "97.5%"="high_treated_I_quint_SP_KZN"))
new_pr_treated_I_quint_SP_KZN$T<-NA
new_pr_treated_I_quint_SP_KZN$T<-seq(0,42,by=dt)



### non SP groups

new_y<-extract(model,pars="pr_treated_I_quint_SP_AQ_Bell")
new_pr_treated_I_quint_SP_AQ_Bell<-apply(new_y[[1]],2,quantile,probs=c(0.025,0.5,0.975)) #the median line with 95% credible intervals
new_pr_treated_I_quint_SP_AQ_Bell<-as.data.frame(t(new_pr_treated_I_quint_SP_AQ_Bell))
new_pr_treated_I_quint_SP_AQ_Bell<-plyr::rename(new_pr_treated_I_quint_SP_AQ_Bell, c("2.5%"="low_treated_I_quint_SP_AQ_Bell", "50%"="med_treated_I_quint_SP_AQ_Bell", "97.5%"="high_treated_I_quint_SP_AQ_Bell"))
new_pr_treated_I_quint_SP_AQ_Bell$T<-NA
new_pr_treated_I_quint_SP_AQ_Bell$T<-seq(0,42,by=dt)

new_y<-extract(model,pars="pr_treated_I_quint_SP_CQ_Bell")
new_pr_treated_I_quint_SP_CQ_Bell<-apply(new_y[[1]],2,quantile,probs=c(0.025,0.5,0.975)) #the median line with 95% credible intervals
new_pr_treated_I_quint_SP_CQ_Bell<-as.data.frame(t(new_pr_treated_I_quint_SP_CQ_Bell))
new_pr_treated_I_quint_SP_CQ_Bell<-plyr::rename(new_pr_treated_I_quint_SP_CQ_Bell, c("2.5%"="low_treated_I_quint_SP_CQ_Bell", "50%"="med_treated_I_quint_SP_CQ_Bell", "97.5%"="high_treated_I_quint_SP_CQ_Bell"))
new_pr_treated_I_quint_SP_CQ_Bell$T<-NA
new_pr_treated_I_quint_SP_CQ_Bell$T<-seq(0,42,by=dt)

new_y<-extract(model,pars="pr_treated_I_quadr_CQ_Nahum")
new_pr_treated_I_quadr_CQ_Nahum<-apply(new_y[[1]],2,quantile,probs=c(0.025,0.5,0.975)) #the median line with 95% credible intervals
new_pr_treated_I_quadr_CQ_Nahum<-as.data.frame(t(new_pr_treated_I_quadr_CQ_Nahum))
new_pr_treated_I_quadr_CQ_Nahum<-plyr::rename(new_pr_treated_I_quadr_CQ_Nahum, c("2.5%"="low_treated_I_quadr_CQ_Nahum", "50%"="med_treated_I_quadr_CQ_Nahum", "97.5%"="high_treated_I_quadr_CQ_Nahum"))
new_pr_treated_I_quadr_CQ_Nahum$T<-NA
new_pr_treated_I_quadr_CQ_Nahum$T<-seq(0,90,by=dt)



###BELL


##ASSIGN COLOURS FOR EACH GENOTYPE


tripl_col<-"forestgreen"
quadr_col<-"darkorange"
quint_col<-"brown2"
sext_col<-"darkred"
undeterm_col<-"darkorchid1"
total_col<-"darkorchid4"


tripl_shape<-17
quadr_shape<-4
quint_shape<-19
sext_shape<-15
undeterm_shape<-3
total_shape<-1


###MAKE PLOTS BY STUDY/DRUG COMBINATION (JUST FOR SP and SPAS)

Bell_SP<-ggplot() +  theme_bw() +
          geom_ribbon(data=new_pr_treated_I_quint_SP_Bell,aes(x = T,
                                                             ymin =low_treated_I_quint_SP_Bell,
                                                             ymax =high_treated_I_quint_SP_Bell),
                      fill=c(alpha(quint_col,0.2)), group=1) +
          geom_line(data=new_pr_treated_I_quint_SP_Bell,aes(x =T,y=med_treated_I_quint_SP_Bell), colour= quint_col,
                    size=1) + ylim(0,0.8) +
          geom_errorbar(data= input_df[which(input_df$drug=="SP" & input_df$study=="Bell_2008"),],
                        aes(x=T,y=N_I_quint/(N_I_quint+N_uninf),
                            ymin=  BinomCI(N_I_quint, N_I_quint+N_uninf,
                                           conf.level = 0.95,
                                           method = "clopper-pearson")[,2], 
                            ymax=  BinomCI(N_I_quint,N_I_quint+N_uninf,
                                           conf.level = 0.95,
                                           method = "clopper-pearson")[,3]),
                                           width=.2,                    # Width of the error bars
                            position=position_dodge(.9), color=quint_col) +             
          geom_point(data=input_df[which(input_df$drug=="SP"& input_df$study=="Bell_2008"),], aes(x=T, y=N_I_quint/(N_I_quint+N_uninf)), colour= quint_col, shape= quint_shape)+
        ylab("Proportion reinfected") + labs(title=" Bell et al, 2008 \n Blantyre, Malawi, SP Placebo") + xlab("Follow-up (days)") + theme(plot.title = element_text(size=9))
          
Bell_SP_AS<- ggplot() +  theme_bw() +
              geom_ribbon(data=new_pr_treated_I_quint_SP_AS_Bell,aes(x = T,
                                                                  ymin =low_treated_I_quint_SP_AS_Bell,
                                                                  ymax =high_treated_I_quint_SP_AS_Bell),
                          fill=c(alpha(quint_col,0.2)), group=1) +
              geom_line(data=new_pr_treated_I_quint_SP_AS_Bell,aes(x =T,y=med_treated_I_quint_SP_AS_Bell), colour= quint_col,
                        size=1) + ylim(0,0.8) +
              geom_errorbar(data= input_df[which(input_df$drug=="SPAS" & input_df$study=="Bell_2008"),],
                            aes(x=T,y=N_I_quint/(N_I_quint+N_uninf),
                                ymin=  BinomCI(N_I_quint, N_I_quint+N_uninf,
                                               conf.level = 0.95,
                                               method = "clopper-pearson")[,2],
                                ymax=  BinomCI(N_I_quint,N_I_quint+N_uninf,
                                               conf.level = 0.95,
                                               method = "clopper-pearson")[,3]),
                            width=.2,                    # Width of the error bars
                            position=position_dodge(.9), color=quint_col) +
              geom_point(data=input_df[which(input_df$drug=="SPAS"& input_df$study=="Bell_2008"),], aes(x=T, y=N_I_quint/(N_I_quint+N_uninf)), colour= quint_col, shape= quint_shape)+
              ylab("Proportion reinfected") + labs(title=" Bell et al, 2008 \n Blantyre, Malawi, SP-AS") + xlab("Follow-up (days)")+ theme(plot.title = element_text(size=9))


Bell_SP_CQ<- ggplot() +  theme_bw() +
  geom_ribbon(data=new_pr_treated_I_quint_SP_CQ_Bell,aes(x = T,
                                                         ymin =low_treated_I_quint_SP_CQ_Bell,
                                                         ymax =high_treated_I_quint_SP_CQ_Bell),
              fill=c(alpha(quint_col,0.2)), group=1) +
  geom_line(data=new_pr_treated_I_quint_SP_CQ_Bell,aes(x =T,y=med_treated_I_quint_SP_CQ_Bell), colour= quint_col,
            size=1) + ylim(0,0.8) +
  geom_errorbar(data= input_df[which(input_df$drug=="SPCQ" & input_df$study=="Bell_2008"),],
                aes(x=T,y=N_I_quint/(N_I_quint+N_uninf),
                    ymin=  BinomCI(N_I_quint, N_I_quint+N_uninf,
                                   conf.level = 0.95,
                                   method = "clopper-pearson")[,2],
                    ymax=  BinomCI(N_I_quint,N_I_quint+N_uninf,
                                   conf.level = 0.95,
                                   method = "clopper-pearson")[,3]),
                width=.2,                    # Width of the error bars
                position=position_dodge(.9), color=quint_col) +
  geom_point(data=input_df[which(input_df$drug=="SPCQ"& input_df$study=="Bell_2008"),], aes(x=T, y=N_I_quint/(N_I_quint+N_uninf)), colour= quint_col, shape= quint_shape)+
  ylab("Proportion reinfected") + labs(title=" Bell et al, 2008 \n Blantyre, Malawi, SP-CQ") + xlab("Follow-up (days)")+ theme(plot.title = element_text(size=9))


Bell_SP_AQ<- ggplot() +  theme_bw() +
  geom_ribbon(data=new_pr_treated_I_quint_SP_AQ_Bell,aes(x = T,
                                                         ymin =low_treated_I_quint_SP_AQ_Bell,
                                                         ymax =high_treated_I_quint_SP_AQ_Bell),
              fill=c(alpha(quint_col,0.2)), group=1) +
  geom_line(data=new_pr_treated_I_quint_SP_AQ_Bell,aes(x =T,y=med_treated_I_quint_SP_AQ_Bell), colour= quint_col,
            size=1) + ylim(0,0.8) +
  geom_errorbar(data= input_df[which(input_df$drug=="SPAQ" & input_df$study=="Bell_2008"),],
                aes(x=T,y=N_I_quint/(N_I_quint+N_uninf),
                    ymin=  BinomCI(N_I_quint, N_I_quint+N_uninf,
                                   conf.level = 0.95,
                                   method = "clopper-pearson")[,2],
                    ymax=  BinomCI(N_I_quint,N_I_quint+N_uninf,
                                   conf.level = 0.95,
                                   method = "clopper-pearson")[,3]),
                width=.2,                    # Width of the error bars
                position=position_dodge(.9), color=quint_col) +
  geom_point(data=input_df[which(input_df$drug=="SPAQ"& input_df$study=="Bell_2008"),], aes(x=T, y=N_I_quint/(N_I_quint+N_uninf)), colour= quint_col, shape= quint_shape)+
  ylab("Proportion reinfected") + labs(title=" Bell et al, 2008 \n Blantyre, Malawi, SP-AQ") + xlab("Follow-up (days)")+ theme(plot.title = element_text(size=9))


Gesase_SP<-ggplot() +  theme_bw() +
            geom_ribbon(data=new_pr_treated_I_sext_SP_Gesase,aes(x = T,
                                                    ymin =low_treated_I_sext_SP_Gesase,
                                                    ymax =high_treated_I_sext_SP_Gesase),
                        fill=c(alpha(sext_col,0.1)), group=1) +
            geom_ribbon(data=new_pr_treated_I_quint_SP_Gesase,aes(x = T,
                                                    ymin =low_treated_I_quint_SP_Gesase,
                                                    ymax =high_treated_I_quint_SP_Gesase),
                        fill=c(alpha(quint_col,0.1)), group=1) +
            geom_ribbon(data=new_pr_treated_I_undeterm_SP_Gesase,aes(x = T,
                                                           ymin =low_treated_I_undeterm_SP_Gesase,
                                                           ymax =high_treated_I_undeterm_SP_Gesase),
                        fill=c(alpha(undeterm_col,0.1)), group=1) + 
            geom_line(data=new_pr_treated_I_sext_SP_Gesase,aes(x =T,y=med_treated_I_sext_SP_Gesase,group=1), color=sext_col,size=1)+
            geom_line(data=new_pr_treated_I_quint_SP_Gesase,aes(x =T,y=med_treated_I_quint_SP_Gesase,group=1), color=quint_col,size=1)+
            geom_line(data=new_pr_treated_I_undeterm_SP_Gesase,aes(x =T,y=med_treated_I_undeterm_SP_Gesase,group=1),color=undeterm_col, size=1)+ 
            geom_point(data= input_df[which(input_df$drug=="SP" & input_df$study=="Gesase_2009"),], aes(x=T, y=N_I_sext/(N_I_sext+N_uninf+N_I_quint+ N_I_undeterm)), colour=sext_col, shape= sext_shape) +
            geom_point(data= input_df[which(input_df$drug=="SP" & input_df$study=="Gesase_2009"),], aes(x=T, y=N_I_quint/(N_I_sext+N_uninf+N_I_quint+ N_I_undeterm)), colour=quint_col, shape= quint_shape) +
            geom_point(data= input_df[which(input_df$drug=="SP" & input_df$study=="Gesase_2009"),], aes(x=T, y=N_I_undeterm/(N_I_sext+N_uninf+N_I_quint+ N_I_undeterm)), colour=undeterm_col, shape= undeterm_shape) +
             geom_errorbar(data= input_df[which(input_df$drug=="SP" & input_df$study=="Gesase_2009"),],aes(x=T,y=N_I_sext/(N_I_sext+N_uninf+N_I_quint+ N_I_undeterm),ymin=  BinomCI(N_I_sext, (N_I_sext+N_uninf+N_I_quint+ N_I_undeterm),
                                                                                                                      conf.level = 0.95,
                                                                                                                      method = "clopper-pearson")[,2], 
                                             ymax=  BinomCI(N_I_sext,(N_I_sext+N_uninf+N_I_quint+ N_I_undeterm),
                                                            conf.level = 0.95,
                                                            method = "clopper-pearson")[,3]),
                          width=.2,   color=c(alpha(sext_col,0.8)) ,                        # Width of the error bars
                          position=position_dodge(.9)) +  
            geom_errorbar(data= input_df[which(input_df$drug=="SP" & input_df$study=="Gesase_2009"),],aes(x=T,y=N_I_quint/(N_I_sext+N_uninf+N_I_quint+ N_I_undeterm),ymin=  BinomCI(N_I_quint, (N_I_sext+N_uninf+N_I_quint+ N_I_undeterm),
                                                                                                                       conf.level = 0.95,
                                                                                                                       method = "clopper-pearson")[,2], 
                                             ymax=  BinomCI(N_I_quint,(N_I_sext+N_uninf+N_I_quint+ N_I_undeterm),
                                                            conf.level = 0.95,
                                                            method = "clopper-pearson")[,3]),
                          width=.2,   color=c(alpha(quint_col,0.8)) ,                 # Width of the error bars fill=c(alpha("red",0.1))
                          position=position_dodge(.9)) +
            
            
            geom_errorbar(data= input_df[which(input_df$drug=="SP" & input_df$study=="Gesase_2009"),],aes(x=T,y=N_I_undeterm/(N_I_sext+N_uninf+N_I_quint+ N_I_undeterm),ymin=  BinomCI(N_I_undeterm, (N_I_sext+N_uninf+N_I_quint+ N_I_undeterm),
                                                                                                                          conf.level = 0.95,
                                                                                                                          method = "clopper-pearson")[,2], 
                                             ymax=  BinomCI(N_I_undeterm,(N_I_sext+N_uninf+N_I_quint+ N_I_undeterm),
                                                            conf.level = 0.95,
                                                            method = "clopper-pearson")[,3]),
                          width=.2,   color=c(alpha(undeterm_col,0.8)) ,                 # Width of the error bars fill=c(alpha("red",0.1))
                          position=position_dodge(.9)) +
            ylim(0,0.5) + xlim(0,28) +
            ylab("Proportion reinfected") + labs(title=" Gesase et al, 2009 \n Tanga, Tanzania, SP") + xlab("Follow-up (days)") + theme(plot.title = element_text(size=9))
 


#####################################


Nahum_SP<-ggplot() +  theme_bw() +
          geom_ribbon(data=new_pr_treated_I_quadr_SP_Nahum,aes(x = T,
                                                              ymin =low_treated_I_quadr_SP_Nahum,
                                                              ymax =high_treated_I_quadr_SP_Nahum),
                      fill=c(alpha(quadr_col,0.2)), group=1) +
          geom_line(data=new_pr_treated_I_quadr_SP_Nahum,aes(x =T,y=med_treated_I_quadr_SP_Nahum), colour= quadr_col,
                    size=1) + ylim(0,0.4) +
          geom_errorbar(data= input_df[which(input_df$drug=="SP" & input_df$study=="Nahum_2009"),],
                        aes(x=T,y=N_I_quadr/(N_I_quadr+N_uninf),
                            ymin=  BinomCI(N_I_quadr, N_I_quadr+N_uninf,
                                           conf.level = 0.95,
                                           method = "clopper-pearson")[,2], 
                            ymax=  BinomCI(N_I_quadr,N_I_quadr+N_uninf,
                                           conf.level = 0.95,
                                           method = "clopper-pearson")[,3]),
                        width=.2,                    # Width of the error bars
                        position=position_dodge(.9), color=quadr_col) +             
          geom_point(data=input_df[which(input_df$drug=="SP"& input_df$study=="Nahum_2009"),], aes(x=T, y=N_I_quadr/(N_I_quadr+N_uninf)), colour= quadr_col, shape= quadr_shape)+
          ylab("Proportion reinfected") + labs(title=" Nahum et al, 2009 \n Cotonou, Benin , SP") + xlab("Follow-up (days)") + theme(plot.title = element_text(size=9))

Nahum_SP_AS<- ggplot() +  theme_bw() +
          geom_ribbon(data=new_pr_treated_I_quadr_SP_AS_Nahum,aes(x = T,
                                                                 ymin =low_treated_I_quadr_SP_AS_Nahum,
                                                                 ymax =high_treated_I_quadr_SP_AS_Nahum),
                      fill=c(alpha(quadr_col,0.2)), group=1) +
          geom_line(data=new_pr_treated_I_quadr_SP_AS_Nahum,aes(x =T,y=med_treated_I_quadr_SP_AS_Nahum), colour= quadr_col,
                    size=1) + ylim(0,0.4) +
          geom_errorbar(data= input_df[which(input_df$drug=="SPAS" & input_df$study=="Nahum_2009"),],
                        aes(x=T,y=N_I_quadr/(N_I_quadr+N_uninf),
                            ymin=  BinomCI(N_I_quadr, N_I_quadr+N_uninf,
                                           conf.level = 0.95,
                                           method = "clopper-pearson")[,2],
                            ymax=  BinomCI(N_I_quadr,N_I_quadr+N_uninf,
                                           conf.level = 0.95,
                                           method = "clopper-pearson")[,3]),
                        width=.2,                    # Width of the error bars
                        position=position_dodge(.9), color=quadr_col) +
          geom_point(data=input_df[which(input_df$drug=="SPAS"& input_df$study=="Nahum_2009"),], aes(x=T, y=N_I_quadr/(N_I_quadr+N_uninf)), colour= quadr_col, shape= quadr_shape)+
          ylab("Proportion reinfected") + labs(title=" Nahum et al, 2009 \n  Cotonou, Benin, SP-AS") + xlab("Follow-up (days)")+ theme(plot.title = element_text(size=9))

Nahum_CQ<-ggplot() +  theme_bw() +
  geom_ribbon(data=new_pr_treated_I_quadr_CQ_Nahum,aes(x = T,
                                                       ymin =low_treated_I_quadr_CQ_Nahum,
                                                       ymax =high_treated_I_quadr_CQ_Nahum),
              fill=c(alpha(quadr_col,0.2)), group=1) +
  geom_line(data=new_pr_treated_I_quadr_CQ_Nahum,aes(x =T,y=med_treated_I_quadr_CQ_Nahum), colour= quadr_col,
            size=1) + ylim(0,0.4) +
  geom_errorbar(data= input_df[which(input_df$drug=="CQ" & input_df$study=="Nahum_2009"),],
                aes(x=T,y=N_I_quadr/(N_I_quadr+N_uninf),
                    ymin=  BinomCI(N_I_quadr, N_I_quadr+N_uninf,
                                   conf.level = 0.95,
                                   method = "clopper-pearson")[,2], 
                    ymax=  BinomCI(N_I_quadr,N_I_quadr+N_uninf,
                                   conf.level = 0.95,
                                   method = "clopper-pearson")[,3]),
                width=.2,                    # Width of the error bars
                position=position_dodge(.9), color=quadr_col) +             
  geom_point(data=input_df[which(input_df$drug=="CQ"& input_df$study=="Nahum_2009"),], aes(x=T, y=N_I_quadr/(N_I_quadr+N_uninf)), colour= quadr_col, shape= quadr_shape)+
  ylab("Proportion reinfected") + labs(title=" Nahum et al, 2009 \n Cotonou, Benin, CQ ") + xlab("Follow-up (days)") + theme(plot.title = element_text(size=9))

#####################################

Allen_Magude_SP<-ggplot() +  theme_bw() +
  geom_ribbon(data=new_pr_treated_I_total_SP_Allen_Magude,aes(x = T,
                                                      ymin =low_treated_I_total_SP_Allen_Magude,
                                                      ymax =high_treated_I_total_SP_Allen_Magude),
              fill=c(alpha(total_col,0.2)), group=1) +
  geom_line(data=new_pr_treated_I_total_SP_Allen_Magude,aes(x =T,y=med_treated_I_total_SP_Allen_Magude), colour= total_col,
            size=1) + ylim(0,0.4) +
  geom_errorbar(data= input_df[which(input_df$drug=="SP" & input_df$study=="Allen_2009_EKDTF"& input_df$site=="Magude"),],
                aes(x=T,y=N_I_total/(N_I_total+N_uninf),
                    ymin=  BinomCI(N_I_total, N_I_total+N_uninf,
                                   conf.level = 0.95,
                                   method = "clopper-pearson")[,2], 
                    ymax=  BinomCI(N_I_total,N_I_total+N_uninf,
                                   conf.level = 0.95,
                                   method = "clopper-pearson")[,3]),
                width=.2,                    # Width of the error bars
                position=position_dodge(.9), color=total_col) +             
  geom_point(data=input_df[which(input_df$drug=="SP"& input_df$study=="Allen_2009_EKDTF" & input_df$site=="Magude"),], aes(x=T, y=N_I_total/(N_I_total+N_uninf)), colour= total_col, shape= total_shape)+
  ylab("Proportion reinfected") + labs(title=" Allen et al, 2009 \n Magude, Mozambique, SP") + xlab("Follow-up (days)") + theme(plot.title = element_text(size=9))

Allen_Magude_SP_AS<- ggplot() +  theme_bw() +
  geom_ribbon(data=new_pr_treated_I_total_SP_AS_Allen_Magude,aes(x = T,
                                                         ymin =low_treated_I_total_SP_AS_Allen_Magude,
                                                         ymax =high_treated_I_total_SP_AS_Allen_Magude),
              fill=c(alpha(total_col,0.2)), group=1) +
  geom_line(data=new_pr_treated_I_total_SP_AS_Allen_Magude,aes(x =T,y=med_treated_I_total_SP_AS_Allen_Magude), colour= total_col,
            size=1) + ylim(0,0.4) +
  geom_errorbar(data= input_df[which(input_df$drug=="SPAS" & input_df$study== "Allen_2009_EKDTF"& input_df$site=="Magude"),],
                aes(x=T,y=N_I_total/(N_I_total+N_uninf),
                    ymin=  BinomCI(N_I_total, N_I_total+N_uninf,
                                   conf.level = 0.95,
                                   method = "clopper-pearson")[,2],
                    ymax=  BinomCI(N_I_total,N_I_total+N_uninf,
                                   conf.level = 0.95,
                                   method = "clopper-pearson")[,3]),
                width=.2,                    # Width of the error bars
                position=position_dodge(.9), color=total_col) +
  geom_point(data=input_df[which(input_df$drug=="SPAS"& input_df$study== "Allen_2009_EKDTF"& input_df$site=="Magude"),], aes(x=T, y=N_I_total/(N_I_total+N_uninf)), colour= total_col, shape= total_shape)+
  ylab("Proportion reinfected") + labs(title=" Allen et al, 2009 \n Magude, Mozambique, SP-AS") + xlab("Follow-up (days)")+ theme(plot.title = element_text(size=9))

#####################################

Allen_Boane_SP<-ggplot() +  theme_bw() +
  geom_ribbon(data=new_pr_treated_I_total_SP_Allen_Boane,aes(x = T,
                                                      ymin =low_treated_I_total_SP_Allen_Boane,
                                                      ymax =high_treated_I_total_SP_Allen_Boane),
              fill=c(alpha(total_col,0.2)), group=1) +
  geom_line(data=new_pr_treated_I_total_SP_Allen_Boane,aes(x =T,y=med_treated_I_total_SP_Allen_Boane), colour= total_col,
            size=1) + ylim(0,0.4) +
  geom_errorbar(data= input_df[which(input_df$drug=="SP" & input_df$study=="Allen_2009_EKDTF"& input_df$site=="Boane"),],
                aes(x=T,y=N_I_total/(N_I_total+N_uninf),
                    ymin=  BinomCI(N_I_total, N_I_total+N_uninf,
                                   conf.level = 0.95,
                                   method = "clopper-pearson")[,2], 
                    ymax=  BinomCI(N_I_total,N_I_total+N_uninf,
                                   conf.level = 0.95,
                                   method = "clopper-pearson")[,3]),
                width=.2,                    # Width of the error bars
                position=position_dodge(.9), color=total_col) +             
  geom_point(data=input_df[which(input_df$drug=="SP"& input_df$study=="Allen_2009_EKDTF" & input_df$site=="Boane"),], aes(x=T, y=N_I_total/(N_I_total+N_uninf)), colour= total_col, shape= total_shape)+
  ylab("Proportion reinfected") + labs(title=" Allen et al, 2009 \n Boane, Mozambique, SP") + xlab("Follow-up (days)") + theme(plot.title = element_text(size=9))

Allen_Boane_SP_AS<- ggplot() +  theme_bw() +
  geom_ribbon(data=new_pr_treated_I_total_SP_AS_Allen_Boane,aes(x = T,
                                                         ymin =low_treated_I_total_SP_AS_Allen_Boane,
                                                         ymax =high_treated_I_total_SP_AS_Allen_Boane),
              fill=c(alpha(total_col,0.4)), group=1) +
  geom_line(data=new_pr_treated_I_total_SP_AS_Allen_Boane,aes(x =T,y=med_treated_I_total_SP_AS_Allen_Boane), colour= total_col,
            size=1) + ylim(0,0.4) +
  geom_errorbar(data= input_df[which(input_df$drug=="SPAS" & input_df$study== "Allen_2009_EKDTF"& input_df$site=="Boane"),],
                aes(x=T,y=N_I_total/(N_I_total+N_uninf),
                    ymin=  BinomCI(N_I_total, N_I_total+N_uninf,
                                   conf.level = 0.95,
                                   method = "clopper-pearson")[,2],
                    ymax=  BinomCI(N_I_total,N_I_total+N_uninf,
                                   conf.level = 0.95,
                                   method = "clopper-pearson")[,3]),
                width=.2,                    # Width of the error bars
                position=position_dodge(.9), color=total_col) +
  geom_point(data=input_df[which(input_df$drug=="SPAS"& input_df$study== "Allen_2009_EKDTF"& input_df$site=="Boane"),], aes(x=T, y=N_I_total/(N_I_total+N_uninf)), colour= total_col, shape= total_shape)+
  ylab("Proportion reinfected") + labs(title=" Allen et al, 2009 \n Boane, Mozambique, SP-AS") + xlab("Follow-up (days)")+ theme(plot.title = element_text(size=9))

#####################################

Allen_Namaacha_SP<-ggplot() +  theme_bw() +
  geom_ribbon(data=new_pr_treated_I_total_SP_Allen_Namaacha,aes(x = T,
                                                                 ymin =low_treated_I_total_SP_Allen_Namaacha,
                                                                 ymax =high_treated_I_total_SP_Allen_Namaacha),
              fill=c(alpha(total_col,0.2)), group=1) +
  geom_line(data=new_pr_treated_I_total_SP_Allen_Namaacha,aes(x =T,y=med_treated_I_total_SP_Allen_Namaacha), colour= total_col,
            size=1) + ylim(0,0.3) +
  geom_errorbar(data= input_df[which(input_df$drug=="SP" & input_df$study=="Allen_2009_EKDTF"& input_df$site=="Namaacha"),],
                aes(x=T,y=N_I_total/(N_I_total+N_uninf),
                    ymin=  BinomCI(N_I_total, N_I_total+N_uninf,
                                   conf.level = 0.95,
                                   method = "clopper-pearson")[,2], 
                    ymax=  BinomCI(N_I_total,N_I_total+N_uninf,
                                   conf.level = 0.95,
                                   method = "clopper-pearson")[,3]),
                width=.2,                    # Width of the error bars
                position=position_dodge(.9), color=total_col) +             
  geom_point(data=input_df[which(input_df$drug=="SP"& input_df$study=="Allen_2009_EKDTF" & input_df$site=="Namaacha"),], aes(x=T, y=N_I_total/(N_I_total+N_uninf)), colour= total_col, shape= total_shape)+
  ylab("Proportion reinfected") + labs(title=" Allen et al, 2009 \n Namaacha, Mozambique, SP") + xlab("Follow-up (days)") + theme(plot.title = element_text(size=9))

Allen_Namaacha_SP_AS<- ggplot() +  theme_bw() +
  geom_ribbon(data=new_pr_treated_I_total_SP_AS_Allen_Namaacha,aes(x = T,
                                                                    ymin =low_treated_I_total_SP_AS_Allen_Namaacha,
                                                                    ymax =high_treated_I_total_SP_AS_Allen_Namaacha),
              fill=c(alpha(total_col,0.2)), group=1) +
  geom_line(data=new_pr_treated_I_total_SP_AS_Allen_Namaacha,aes(x =T,y=med_treated_I_total_SP_AS_Allen_Namaacha), colour= total_col,
            size=1) + ylim(0,0.3) +
  geom_errorbar(data= input_df[which(input_df$drug=="SPAS" & input_df$study== "Allen_2009_EKDTF"& input_df$site=="Namaacha"),],
                aes(x=T,y=N_I_total/(N_I_total+N_uninf),
                    ymin=  BinomCI(N_I_total, N_I_total+N_uninf,
                                   conf.level = 0.95,
                                   method = "clopper-pearson")[,2],
                    ymax=  BinomCI(N_I_total,N_I_total+N_uninf,
                                   conf.level = 0.95,
                                   method = "clopper-pearson")[,3]),
                width=.2,                    # Width of the error bars
                position=position_dodge(.9), color=total_col) +
  geom_point(data=input_df[which(input_df$drug=="SPAS"& input_df$study== "Allen_2009_EKDTF"& input_df$site=="Namaacha"),], aes(x=T, y=N_I_total/(N_I_total+N_uninf)), colour= total_col, shape= total_shape)+
  ylab("Proportion reinfected") + labs(title=" Allen et al, 2009 \n Namaacha,  Mozambique, SP-AS") + xlab("Follow-up (days)")+ theme(plot.title = element_text(size=9))

#####################################

Allen_Catuane_SP<-ggplot() +  theme_bw() +
  geom_ribbon(data=new_pr_treated_I_total_SP_Allen_Catuane,aes(x = T,
                                                                 ymin =low_treated_I_total_SP_Allen_Catuane,
                                                                 ymax =high_treated_I_total_SP_Allen_Catuane),
              fill=c(alpha(total_col,0.2)), group=1) +
  geom_line(data=new_pr_treated_I_total_SP_Allen_Catuane,aes(x =T,y=med_treated_I_total_SP_Allen_Catuane), colour= total_col,
            size=1) + ylim(0,0.3) +
  geom_errorbar(data= input_df[which(input_df$drug=="SP" & input_df$study=="Allen_2009_EKDTF"& input_df$site=="Catuane"),],
                aes(x=T,y=N_I_total/(N_I_total+N_uninf),
                    ymin=  BinomCI(N_I_total, N_I_total+N_uninf,
                                   conf.level = 0.95,
                                   method = "clopper-pearson")[,2], 
                    ymax=  BinomCI(N_I_total,N_I_total+N_uninf,
                                   conf.level = 0.95,
                                   method = "clopper-pearson")[,3]),
                width=.2,                    # Width of the error bars
                position=position_dodge(.9), color=total_col) +             
  geom_point(data=input_df[which(input_df$drug=="SP"& input_df$study=="Allen_2009_EKDTF" & input_df$site=="Catuane"),], aes(x=T, y=N_I_total/(N_I_total+N_uninf)), colour= total_col, shape= total_shape)+
  ylab("Proportion reinfected") + labs(title=" Allen et al, 2009 \n Catuane, Mozambique, SP") + xlab("Follow-up (days)") + theme(plot.title = element_text(size=9))

Allen_Catuane_SP_AS<- ggplot() +  theme_bw() +
  geom_ribbon(data=new_pr_treated_I_total_SP_AS_Allen_Catuane,aes(x = T,
                                                                    ymin =low_treated_I_total_SP_AS_Allen_Catuane,
                                                                    ymax =high_treated_I_total_SP_AS_Allen_Catuane),
              fill=c(alpha(total_col,0.2)), group=1) +
  geom_line(data=new_pr_treated_I_total_SP_AS_Allen_Catuane,aes(x =T,y=med_treated_I_total_SP_AS_Allen_Catuane), colour= total_col,
            size=1) + ylim(0,0.3) +
  geom_errorbar(data= input_df[which(input_df$drug=="SPAS" & input_df$study== "Allen_2009_EKDTF"& input_df$site=="Catuane"),],
                aes(x=T,y=N_I_total/(N_I_total+N_uninf),
                    ymin=  BinomCI(N_I_total, N_I_total+N_uninf,
                                   conf.level = 0.95,
                                   method = "clopper-pearson")[,2],
                    ymax=  BinomCI(N_I_total,N_I_total+N_uninf,
                                   conf.level = 0.95,
                                   method = "clopper-pearson")[,3]),
                width=.2,                    # Width of the error bars
                position=position_dodge(.9), color=total_col) +
  geom_point(data=input_df[which(input_df$drug=="SPAS"& input_df$study== "Allen_2009_EKDTF"& input_df$site=="Catuane"),], aes(x=T, y=N_I_total/(N_I_total+N_uninf)), colour= total_col, shape= total_shape)+
  ylab("Proportion reinfected") + labs(title=" Allen et al, 2009 \n Catuane, Mozambique, SP-AS") + xlab("Follow-up (days)")+ theme(plot.title = element_text(size=9))

#####################################
RHXNJ_SP<-ggplot() +  theme_bw() +
          geom_ribbon(data=new_pr_treated_I_total_SP_RHXNJ,aes(x = T,
                                                                   ymin =low_treated_I_total_SP_RHXNJ,
                                                                   ymax =high_treated_I_total_SP_RHXNJ),
                      fill=c(alpha(total_col,0.2)), group=1) +
          geom_line(data=new_pr_treated_I_total_SP_RHXNJ,aes(x =T,y=med_treated_I_total_SP_RHXNJ), colour= total_col, size=1) + 
          geom_ribbon(data=new_pr_treated_I_quint_SP_RHXNJ,aes(x = T,
                                                               ymin =low_treated_I_quint_SP_RHXNJ,
                                                               ymax =high_treated_I_quint_SP_RHXNJ),
                      fill=c(alpha(quint_col,0.2)), group=1) +
          geom_line(data=new_pr_treated_I_quint_SP_RHXNJ,aes(x =T,y=med_treated_I_quint_SP_RHXNJ), colour= quint_col, size=1)  + 
        
          geom_errorbar(data= input_df[which(input_df$drug=="SP" & input_df$study=="Barnes_2006_RHXNJ"),],
                        aes(x=T,y=N_I_total/(N_I_total+N_uninf),
                            ymin=  BinomCI(N_I_total, N_I_total+N_uninf,
                                           conf.level = 0.95,
                                           method = "clopper-pearson")[,2], 
                            ymax=  BinomCI(N_I_total,N_I_total+N_uninf,
                                           conf.level = 0.95,
                                           method = "clopper-pearson")[,3]),
                        width=.2,                    # Width of the error bars
                        position=position_dodge(.9), color=total_col) +             
          geom_point(data=input_df[which(input_df$drug=="SP"& input_df$study=="Barnes_2006_RHXNJ"),], aes(x=T, y=N_I_total/(N_I_total+N_uninf)), colour= total_col, shape= total_shape)+
          
          geom_errorbar(data= input_df[which(input_df$drug=="SP" & input_df$study=="Barnes_2006_RHXNJ"),],
                        aes(x=T,y=N_I_quint/(N_I_quint+N_uninf),
                            ymin=  BinomCI(N_I_quint, N_I_quint+N_uninf,
                                           conf.level = 0.95,
                                           method = "clopper-pearson")[,2], 
                            ymax=  BinomCI(N_I_quint,N_I_quint+N_uninf,
                                           conf.level = 0.95,
                                           method = "clopper-pearson")[,3]),
                        width=.2,                    # Width of the error bars
                        position=position_dodge(.9), color=quint_col) +             
          geom_point(data=input_df[which(input_df$drug=="SP"& input_df$study=="Barnes_2006_RHXNJ"),], aes(x=T, y=N_I_quint/(N_I_quint+N_uninf)), colour= quint_col, shape= quint_shape)+
          ylab("Proportion reinfected") + labs(title="Barnes et al, 2006 (RHXNJ) \n Namaacha, Mozambique, SP") + xlab("Follow-up (days)") + ylim(0,0.2) + theme(plot.title = element_text(size=9))


##########################################################


RZENT_SP<-ggplot() +  theme_bw() +
  geom_ribbon(data=new_pr_treated_I_total_SP_RZENT,aes(x = T,
                                                       ymin =low_treated_I_total_SP_RZENT,
                                                       ymax =high_treated_I_total_SP_RZENT),
              fill=c(alpha(total_col,0.2)), group=1) +
  geom_line(data=new_pr_treated_I_total_SP_RZENT,aes(x =T,y=med_treated_I_total_SP_RZENT), colour= total_col, size=1) + 
  
  geom_errorbar(data= input_df[which(input_df$drug=="SP" & input_df$study=="Barnes_2006_RZENT"),],
                aes(x=T,y=N_I_total/(N_I_total+N_uninf),
                    ymin=  BinomCI(N_I_total, N_I_total+N_uninf,
                                   conf.level = 0.95,
                                   method = "clopper-pearson")[,2], 
                    ymax=  BinomCI(N_I_total,N_I_total+N_uninf,
                                   conf.level = 0.95,
                                   method = "clopper-pearson")[,3]),
                width=.2,                    # Width of the error bars
                position=position_dodge(.9), color=total_col) +             
  geom_point(data=input_df[which(input_df$drug=="SP"& input_df$study=="Barnes_2006_RZENT"),], aes(x=T, y=N_I_total/(N_I_total+N_uninf)), colour= total_col, shape= total_shape)+
    ylab("Proportion reinfected") + labs(title="Barnes et al, 2006 (RZENT) \n Bela Vista 2002, Mozambique, SP") + xlab("Follow-up (days)") + ylim(0,0.4) + theme(plot.title = element_text(size=9))

##########################################################

#
NMMSB_SP<-ggplot() +  theme_bw() +
          geom_ribbon(data=new_pr_treated_I_total_SP_NMMSB,aes(x = T,
                                                               ymin =low_treated_I_total_SP_NMMSB,
                                                               ymax =high_treated_I_total_SP_NMMSB),
                      fill=c(alpha(total_col,0.2)), group=1) +
          geom_line(data=new_pr_treated_I_total_SP_NMMSB,aes(x =T,y=med_treated_I_total_SP_NMMSB), colour= total_col, size=1) + 
          geom_ribbon(data=new_pr_treated_I_tripl_SP_NMMSB,aes(x = T,
                                                               ymin =low_treated_I_tripl_SP_NMMSB,
                                                               ymax =high_treated_I_tripl_SP_NMMSB),
                      fill=c(alpha(tripl_col,0.2)), group=1) +
          geom_line(data=new_pr_treated_I_tripl_SP_NMMSB,aes(x =T,y=med_treated_I_tripl_SP_NMMSB), colour= tripl_col, size=1) +
          
          geom_errorbar(data= input_df[which(input_df$drug=="SP" & input_df$study=="Barnes_2006_NMMSB"),],
                        aes(x=T,y=N_I_total/(N_I_total+N_uninf),
                            ymin=  BinomCI(N_I_total, N_I_total+N_uninf,
                                           conf.level = 0.95,
                                           method = "clopper-pearson")[,2], 
                            ymax=  BinomCI(N_I_total,N_I_total+N_uninf,
                                           conf.level = 0.95,
                                           method = "clopper-pearson")[,3]),
                        width=.2,                    # Width of the error bars
                        position=position_dodge(.9), color=total_col) +             
          geom_point(data=input_df[which(input_df$drug=="SP"& input_df$study=="Barnes_2006_NMMSB"),], aes(x=T, y=N_I_total/(N_I_total+N_uninf)), colour= total_col, shape= total_shape)+
  geom_errorbar(data= input_df[which(input_df$drug=="SP" & input_df$study=="Barnes_2006_NMMSB"),],
                aes(x=T,y=N_I_tripl/(N_I_tripl+N_uninf),
                    ymin=  BinomCI(N_I_tripl, N_I_tripl+N_uninf,
                                   conf.level = 0.95,
                                   method = "clopper-pearson")[,2], 
                    ymax=  BinomCI(N_I_tripl,N_I_tripl+N_uninf,
                                   conf.level = 0.95,
                                   method = "clopper-pearson")[,3]),
                width=.2,                    # Width of the error bars
                position=position_dodge(.9), color=tripl_col) +             
  geom_point(data=input_df[which(input_df$drug=="SP"& input_df$study=="Barnes_2006_NMMSB"),], aes(x=T, y=N_I_tripl/(N_I_tripl+N_uninf)), colour= tripl_col, shape= tripl_shape)+
          ylab("Proportion reinfected") + labs(title="Barnes et al, 2006 (NMMSB) \n Bela Vista 2003, Mozambique, SP") + xlab("Follow-up (days)") + ylim(0,0.3) + theme(plot.title = element_text(size=9))

##########################################################

PEADD_SP<-ggplot() +  theme_bw() +
  geom_ribbon(data=new_pr_treated_I_total_SP_PEADD,aes(x = T,
                                                       ymin =low_treated_I_total_SP_PEADD,
                                                       ymax =high_treated_I_total_SP_PEADD),
              fill=c(alpha(total_col,0.2)), group=1) +
  geom_line(data=new_pr_treated_I_total_SP_PEADD,aes(x =T,y=med_treated_I_total_SP_PEADD), colour= total_col, size=1) + 
  
  geom_errorbar(data= input_df[which(input_df$drug=="SP" & input_df$study=="Barnes_2008_Mabuza_2005_PEADD"),],
                aes(x=T,y=N_I_total/(N_I_total+N_uninf),
                    ymin=  BinomCI(N_I_total, N_I_total+N_uninf,
                                   conf.level = 0.95,
                                   method = "clopper-pearson")[,2], 
                    ymax=  BinomCI(N_I_total,N_I_total+N_uninf,
                                   conf.level = 0.95,
                                   method = "clopper-pearson")[,3]),
                width=.2,                    # Width of the error bars
                position=position_dodge(.9), color=total_col) +             
  geom_point(data=input_df[which(input_df$drug=="SP"& input_df$study=="Barnes_2008_Mabuza_2005_PEADD"),], aes(x=T, y=N_I_total/(N_I_total+N_uninf)), colour= total_col, shape= total_shape)+
  ylab("Proportion reinfected") + labs(title="Barnes et al, 2008 (PEADD) \n Mpumalanga, South Africa, SP") + xlab("Follow-up (days)") + ylim(0,0.1) + theme(plot.title = element_text(size=9))

##########################################################

KZN_SP<-ggplot() +  theme_bw() +
  geom_ribbon(data=new_pr_treated_I_quint_SP_KZN,aes(x = T,
                                                       ymin =low_treated_I_quint_SP_KZN,
                                                       ymax =high_treated_I_quint_SP_KZN),
              fill=c(alpha(quint_col,0.2)), group=1) +
  geom_line(data=new_pr_treated_I_quint_SP_KZN,aes(x =T,y=med_treated_I_quint_SP_KZN), colour= quint_col, size=1) + 
  
  geom_errorbar(data= input_df[which(input_df$drug=="SP" & input_df$study=="KZN"),],
                aes(x=T,y=N_I_undeterm/(N_I_undeterm+N_uninf),
                    ymin=  BinomCI(N_I_undeterm, N_I_undeterm+N_uninf,
                                   conf.level = 0.95,
                                   method = "clopper-pearson")[,2], 
                    ymax=  BinomCI(N_I_undeterm,N_I_undeterm+N_uninf,
                                   conf.level = 0.95,
                                   method = "clopper-pearson")[,3]),
                width=.2,                    # Width of the error bars
                position=position_dodge(.9), color=quint_col) +             
  geom_point(data=input_df[which(input_df$drug=="SP"& input_df$study=="KZN"),], aes(x=T, y=N_I_undeterm/(N_I_undeterm+N_uninf)), colour= quint_col , shape= quint_shape)+
  ylab("Proportion reinfected") + labs(title="Bredenkamp et al., 2001, (KZN) \n KwaZulu-Natal, South Africa, SP") + xlab("Follow-up (days)") + ylim(0,0.7) + theme(plot.title = element_text(size=9))
KZN_SP


########################################################################################################################################

########### combining all plots together 

plot_grid(Bell_SP,Bell_SP_AS, Gesase_SP, Nahum_SP, Nahum_SP_AS,KZN_SP, 
          Allen_Magude_SP, Allen_Magude_SP_AS, Allen_Boane_SP, Allen_Boane_SP_AS,Allen_Namaacha_SP, Allen_Namaacha_SP_AS,
          Allen_Catuane_SP, Allen_Catuane_SP_AS, RHXNJ_SP, RZENT_SP, NMMSB_SP,PEADD_SP, ncol=6)


plot_grid(Bell_SP_AQ,Bell_SP_CQ, Nahum_CQ, ncol=1)

pdf(file = "fits_SP_SPAS_wide.pdf",   
    width = 15, # in inches
    height = 8) 

plot_grid(Bell_SP,Bell_SP_AS, Gesase_SP, 
          Nahum_SP, Nahum_SP_AS, Allen_Magude_SP, 
          Allen_Magude_SP_AS, Allen_Boane_SP, Allen_Boane_SP_AS,
          Allen_Namaacha_SP, Allen_Namaacha_SP_AS, Allen_Catuane_SP, 
          Allen_Catuane_SP_AS, RHXNJ_SP, RZENT_SP,
          NMMSB_SP,PEADD_SP,KZN_SP, ncol=6, scale = 0.9)

dev.off()



#using tiff() and dev.off
tiff('fits_SP_SPAS.tiff', units="in", 
     width=8, height=13, res=600, compression = 'lzw')
plot_grid(Bell_SP,Bell_SP_AS, Gesase_SP, 
          Nahum_SP, Nahum_SP_AS, Allen_Magude_SP, 
          Allen_Magude_SP_AS, Allen_Boane_SP, Allen_Boane_SP_AS,
          Allen_Namaacha_SP, Allen_Namaacha_SP_AS, Allen_Catuane_SP, 
          Allen_Catuane_SP_AS, RHXNJ_SP, RZENT_SP,
          NMMSB_SP,PEADD_SP,KZN_SP, ncol=3, scale = 0.9)
dev.off()



pdf(file = "fits_SP_SPAS.pdf",   # The directory you want to save the file in
    width = 8, # The width of the plot in inches
    height = 13) # The height of the plot in inches

plot_grid(Bell_SP,Bell_SP_AS, Gesase_SP, 
          Nahum_SP, Nahum_SP_AS, Allen_Magude_SP, 
          Allen_Magude_SP_AS, Allen_Boane_SP, Allen_Boane_SP_AS,
          Allen_Namaacha_SP, Allen_Namaacha_SP_AS, Allen_Catuane_SP, 
          Allen_Catuane_SP_AS, RHXNJ_SP, RZENT_SP,
          NMMSB_SP,PEADD_SP,KZN_SP, ncol=3, scale = 0.9)

dev.off()


pdf(file = "fits_nonSPSPAS.pdf",   # The directory you want to save the file in
    width = 3, # The width of the plot in inches
    height = 8) # The height of the plot in inches

plot_grid(Bell_SP_AQ,Bell_SP_CQ, 
          Nahum_CQ, ncol=1, scale = 0.9)

dev.off()
###################################################################################################################################


########### frequency of resistance (observed day 0 vs model posterior)

freq_day0_df<-read.csv("data/day0_frequencies.csv")  ##FREQUENCY ON DAY0 DATA
freq_day0_df$genotype<-"Quintuple"
freq_day0_df$observed<-freq_day0_df$quintuple_day0/(freq_day0_df$quintuple_day0 +freq_day0_df$triple_day0)
freq_day0_df$genotype[which(freq_day0_df$Study=="Gesase2009")]<-"Sextuple"
freq_day0_df$observed[which(freq_day0_df$Study=="Gesase2009")]<-freq_day0_df$sextuple_day0[which(freq_day0_df$Study=="Gesase2009")]/
                                                                (freq_day0_df$quintuple_day0[which(freq_day0_df$Study=="Gesase2009")] +freq_day0_df$sextuple_day0[which(freq_day0_df$Study=="Gesase2009")])

freq_day0_df$pred_low<-NA
freq_day0_df$pred<-NA
freq_day0_df$pred_high<-NA

freq_day0_df[which(freq_day0_df$Study=="Gesase2009"),9:11]<- quantile(params$freq_sext_Gesase, probs = c(0.025,0.5,0.975))
freq_day0_df[which(freq_day0_df$Study=="Allen2009_Magude"),9:11]<- quantile(params$freq_quint_Allen_Magude, probs = c(0.025,0.5,0.975))
freq_day0_df[which(freq_day0_df$Study=="Allen2009_Boane"),9:11]<- quantile(params$freq_quint_Allen_Boane, probs = c(0.025,0.5,0.975))
freq_day0_df[which(freq_day0_df$Study=="Allen2009_Namaacha"),9:11]<- quantile(params$freq_quint_Allen_Namaacha, probs = c(0.025,0.5,0.975))
freq_day0_df[which(freq_day0_df$Study== "Allen2009_Catuane"),9:11]<- quantile(params$freq_quint_Allen_Catuane, probs = c(0.025,0.5,0.975))
freq_day0_df[which(freq_day0_df$Study=="Barnes2006_RHXNJ"),9:11]<- quantile(params$freq_quint_RHXNJ, probs = c(0.025,0.5,0.975))
freq_day0_df[which(freq_day0_df$Study=="Barnes2006_RZENT"),9:11]<- quantile(params$freq_quint_RZENT, probs = c(0.025,0.5,0.975))
freq_day0_df[which(freq_day0_df$Study=="Barnes2006_NMMSB"),9:11]<- quantile(params$freq_quint_NMMSB, probs = c(0.025,0.5,0.975))
freq_day0_df[which(freq_day0_df$Study=="Barnes2008_Mabuza2005_PEADD"),9:11]<- quantile(params$freq_quint_PEADD, probs = c(0.025,0.5,0.975))


freq_day0_df$Study<- c("Allen 2009, Magude","Allen 2009, Boane","Allen 2009, Namaacha","Allen 2009, Catuane","Barnes 2008,Mabuza 2005(PEADD)",
                       "Barnes 2006 (RHXNJ)", "Barnes 2006 (RZENT)", "Barnes 2006 (NMMSB)","Gesase 2009")  

ggplot(freq_day0_df, aes(x=Study, y=pred))+ theme_bw() + 
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust=1))+  
  geom_errorbar(aes(ymin=pred_low, ymax=pred_high, color=genotype), width=.2) +
  geom_point(aes(x=Study, y=pred, color=genotype, shape="Predicted"), size=3) +
  geom_point(aes(x=Study, y=observed, shape="Observed"), color="black", size=3)+
  ylab("Genotype frequency") +   xlab("")  +
  scale_colour_manual(values = c("Quintuple" = "brown2","Sextuple" = "darkred"))+ 
   scale_shape_manual(values = c("Observed" = 17, "Predicted"= 19)) 


#############################################################################################################################################
##for SP and SPAS

#### generating protective efficacy curves:


#######    Triple
percentiles_tripl<-data.frame(time=seq(0,63))
percentiles_tripl$perc_0.025<-NA
percentiles_tripl$perc_0.5<-NA
percentiles_tripl$perc_0.975<-NA
percentiles_tripl$genotype<-"Triple"


for (r in 0:63) { 
  PE_tripl<- exp(-(r/params$lambda_tripl_SP_AS)^params$w_tripl_SP_AS)
  percentiles_tripl$perc_0.025[r+1]<-quantile(PE_tripl, probs = c(0.025))
  percentiles_tripl$perc_0.5[r+1]<-quantile(PE_tripl, probs = c(0.5))
  percentiles_tripl$perc_0.975[r+1]<-quantile(PE_tripl,probs = c(0.975))
}
########
#######    Quadruple
percentiles_quadr<-data.frame(time=seq(0,63))
percentiles_quadr$perc_0.025<-NA
percentiles_quadr$perc_0.5<-NA
percentiles_quadr$perc_0.975<-NA
percentiles_quadr$genotype<-"Quadruple"


for (r in 0:63) { 
  PE_quadr<- exp(-(r/params$lambda_quadr_SP_AS)^params$w_quadr_SP_AS)
  percentiles_quadr$perc_0.025[r+1]<-quantile(PE_quadr, probs = c(0.025))
  percentiles_quadr$perc_0.5[r+1]<-quantile(PE_quadr, probs = c(0.5))
  percentiles_quadr$perc_0.975[r+1]<-quantile(PE_quadr,probs = c(0.975))
}
########
#######    Quintuple
percentiles_quint<-data.frame(time=seq(0,63))
percentiles_quint$perc_0.025<-NA
percentiles_quint$perc_0.5<-NA
percentiles_quint$perc_0.975<-NA
percentiles_quint$genotype<-"Quintuple"


for (r in 0:63) { 
  PE_quint<- exp(-(r/params$lambda_quint_SP_AS)^params$w_quint_SP_AS)
  percentiles_quint$perc_0.025[r+1]<-quantile(PE_quint, probs = c(0.025))
  percentiles_quint$perc_0.5[r+1]<-quantile(PE_quint, probs = c(0.5))
  percentiles_quint$perc_0.975[r+1]<-quantile(PE_quint,probs = c(0.975))
}
########
#######    Sextuple
percentiles_sext<-data.frame(time=seq(0,63))
percentiles_sext$perc_0.025<-NA
percentiles_sext$perc_0.5<-NA
percentiles_sext$perc_0.975<-NA
percentiles_sext$genotype<-"Sextuple"


for (r in 0:63) { 
  PE_sext<- exp(-(r/params$lambda_sext_SP)^params$w_sext_SP)
  percentiles_sext$perc_0.025[r+1]<-quantile(PE_sext, probs = c(0.025))
  percentiles_sext$perc_0.5[r+1]<-quantile(PE_sext, probs = c(0.5))
  percentiles_sext$perc_0.975[r+1]<-quantile(PE_sext,probs = c(0.975))
}
########

percentiles <-rbind(percentiles_tripl, percentiles_quadr,percentiles_quint, percentiles_sext)

med_mean_dur_prot_tripl_SP_AS<- median(params$lambda_tripl_SP_AS* gamma(1+(1/params$w_tripl_SP_AS)))
med_mean_dur_prot_quadr_SP_AS<- median(params$lambda_quadr_SP_AS* gamma(1+(1/params$w_quadr_SP_AS)))
med_mean_dur_prot_quint_SP_AS<- median(params$lambda_quint_SP_AS* gamma(1+(1/params$w_quint_SP_AS)))
med_mean_dur_prot_sext_SP<- median(params$lambda_sext_SP* gamma(1+(1/params$w_sext_SP)))

med_mean_dur_prot_quint_SP_AQ<- median(params$lambda_quint_SP_AQ* gamma(1+(1/params$w_quint_SP_AQ)))
med_mean_dur_prot_quint_SP_CQ<- median(params$lambda_quint_SP_CQ* gamma(1+(1/params$w_quint_SP_CQ)))
med_mean_dur_prot_quadr_CQ<- median(params$lambda_quadr_CQ* gamma(1+(1/params$w_quadr_CQ)))


plot_PE_tripl<- ggplot(percentiles[which(percentiles$genotype=="Triple"),]) +  
                theme_bw() +
                geom_ribbon(aes(x = time, ymin =perc_0.025,ymax =perc_0.975),
                            fill=c(alpha(tripl_col,0.2)), group=1) +
                geom_line(aes(x =time,y=perc_0.5), colour= tripl_col, size=1)+
                geom_vline(xintercept=med_mean_dur_prot_tripl_SP_AS, linetype="dashed")+
                ylab("Protective efficacy") + xlab("Days since treatment") + labs(title = expression(italic("dhps") ~ " A K A (Sulfadoxine-susceptible)"))


plot_PE_tripl <- ggplot(percentiles[which(percentiles$genotype == "Triple"),]) +  
                theme_bw() +
                geom_ribbon(aes(x = time, ymin = perc_0.025, ymax = perc_0.975),
                            fill = c(alpha(tripl_col, 0.2)), group = 1) +
                geom_line(aes(x = time, y = perc_0.5), colour = tripl_col, size = 1) +
                geom_vline(xintercept = med_mean_dur_prot_tripl_SP_AS, linetype = "dashed") +
                ylab("Protective efficacy") + 
                xlab("Days since treatment") + 
                labs(title = expression(italic("dhps") ~ " A K A (Sulfadoxine-susceptible)")) +
                annotate("text", x = med_mean_dur_prot_tripl_SP_AS, y = max(percentiles$perc_0.5, na.rm = TRUE) * 0.9, 
                         label = paste("", format(round(med_mean_dur_prot_tripl_SP_AS, digits = 1), nsmall = 1), "\n days"), vjust = 0.2, hjust = -0.2)





plot_PE_quadr<- ggplot(percentiles[which(percentiles$genotype=="Quadruple"),]) +  
                theme_bw() +
                geom_ribbon(aes(x = time, ymin =perc_0.025,ymax =perc_0.975),
                            fill=c(alpha(quadr_col,0.2)), group=1) +
                geom_line(aes(x =time,y=perc_0.5), colour= quadr_col, size=1)+
                geom_vline(xintercept=med_mean_dur_prot_quadr_SP_AS, linetype="dashed")+
                ylab("Protective efficacy") + xlab("Days since treatment") + labs(title = expression(italic("dhps") ~  bold(underline("G")) ~ "K A"))+
                annotate("text", x = med_mean_dur_prot_quadr_SP_AS, y = max(percentiles$perc_0.5, na.rm = TRUE) * 0.9, 
                label = paste("", format(round(med_mean_dur_prot_quadr_SP_AS, digits = 1), nsmall = 1), "\n days"), vjust = 0.2, hjust = -0.2)


plot_PE_quint<- ggplot(percentiles[which(percentiles$genotype=="Quintuple"),]) +  
                theme_bw() +
                geom_ribbon(aes(x = time, ymin =perc_0.025,ymax =perc_0.975),
                            fill=c(alpha(quint_col,0.2)), group=1) +
                geom_line(aes(x =time,y=perc_0.5), colour= quint_col, size=1)+
                geom_vline(xintercept=med_mean_dur_prot_quint_SP_AS, linetype="dashed")+
                ylab("Protective efficacy") + xlab("Days since treatment") + labs(title = expression(italic("dhps") ~  bold(underline("G E")) ~ "A"))+
  annotate("text", x = med_mean_dur_prot_quint_SP_AS, y = max(percentiles$perc_0.5, na.rm = TRUE) * 0.9, 
           label = paste("", format(round(med_mean_dur_prot_quint_SP_AS, digits = 1), nsmall = 1), "\n days"), vjust = 0.2, hjust = -0.2)
              


plot_PE_sext<- ggplot(percentiles[which(percentiles$genotype=="Sextuple"),]) +  
                theme_bw() +
                geom_ribbon(aes(x = time, ymin =perc_0.025,ymax =perc_0.975),
                            fill=c(alpha(sext_col,0.2)), group=1) +
                geom_line(aes(x =time,y=perc_0.5), colour= sext_col, size=1)+
                geom_vline(xintercept=med_mean_dur_prot_sext_SP, linetype="dashed")+
                ylab("Protective efficacy") + xlab("Days since treatment") +  labs(title = expression(italic("dhps") ~  bold(underline(" G E G"))))+
  annotate("text", x = med_mean_dur_prot_sext_SP, y = max(percentiles$perc_0.5, na.rm = TRUE) * 0.9, 
           label = paste("", format(round(med_mean_dur_prot_sext_SP, digits = 1), nsmall = 1), "\n days"), vjust = 0.2, hjust = -0.2)

pdf(file = "PEprofiles_2by2.pdf",   # The directory you want to save the file in
    width = 8, # The width of the plot in inches
    height = 7) # The height of the plot in inches

plot_grid(plot_PE_tripl, plot_PE_quadr, plot_PE_quint, plot_PE_sext, ncol=2)

dev.off()

ggplot() +  
  theme_bw() +
  geom_ribbon(data=percentiles[which(percentiles$genotype=="Triple"),], aes(x = time, ymin =perc_0.025,ymax =perc_0.975),
              fill=c(alpha(tripl_col,0.2)), group=1) +
  geom_line(data=percentiles[which(percentiles$genotype=="Triple"),],aes(x =time,y=perc_0.5), colour= tripl_col, size=1)+
  geom_ribbon(data=percentiles[which(percentiles$genotype=="Quadruple"),], aes(x = time, ymin =perc_0.025,ymax =perc_0.975),
              fill=c(alpha(quadr_col,0.2)), group=1) +
  geom_line(data=percentiles[which(percentiles$genotype=="Quadruple"),],aes(x =time,y=perc_0.5), colour= quadr_col, size=1)+
  geom_ribbon(data=percentiles[which(percentiles$genotype=="Quintuple"),], aes(x = time, ymin =perc_0.025,ymax =perc_0.975),
              fill=c(alpha(quint_col,0.2)), group=1) +
  geom_line(data=percentiles[which(percentiles$genotype=="Quintuple"),],aes(x =time,y=perc_0.5), colour= quint_col, size=1)+
  geom_ribbon(data=percentiles[which(percentiles$genotype=="Sextuple"),], aes(x = time, ymin =perc_0.025,ymax =perc_0.975),
              fill=c(alpha(sext_col,0.2)), group=1) +
  geom_line(data=percentiles[which(percentiles$genotype=="Sextuple"),],aes(x =time,y=perc_0.5), colour= sext_col, size=1)+
  ylab("Protective efficacy") + xlab("Days since SP treatment")



ggplot() +  theme_bw() +
  geom_line(data=percentiles[which(percentiles$genotype=="Triple"),],aes(x =time,y=perc_0.5), colour= tripl_col, size=1)+
  geom_line(data=percentiles[which(percentiles$genotype=="Quadruple"),],aes(x =time,y=perc_0.5), colour= quadr_col, size=1)+
  geom_line(data=percentiles[which(percentiles$genotype=="Quintuple"),],aes(x =time,y=perc_0.5), colour= quint_col, size=1)+
  geom_line(data=percentiles[which(percentiles$genotype=="Sextuple"),],aes(x =time,y=perc_0.5), colour= sext_col, size=1)+
  ylab("Protective efficacy") + xlab("Days since SP treatment")+
  scale_color_manual(values=c(  tripl_col,quadr_col,quint_col,sext_col))
  
ggplot() +  theme_bw() +
  geom_line(data=percentiles[which(percentiles$genotype=="Triple"),],aes(x =time,y=perc_0.5, colour= tripl_col), size=1)+
  geom_line(data=percentiles[which(percentiles$genotype=="Quadruple"),],aes(x =time,y=perc_0.5, colour= quadr_col), size=1)+
  geom_line(data=percentiles[which(percentiles$genotype=="Quintuple"),],aes(x =time,y=perc_0.5, colour= quint_col), size=1)+
  geom_line(data=percentiles[which(percentiles$genotype=="Sextuple"),],aes(x =time,y=perc_0.5, colour= sext_col), size=1)+
  ylab("Protective efficacy") + xlab("Days since SP treatment")+
                     
  scale_color_manual(values=c(tripl_col,quadr_col,quint_col,sext_col),
                     name="Haplotypes",labels=c("_AKAA", "_GKAA", "_GEAA","_GEGA" ))



##################################################################################################

###Non-SP arms.

##########
percentiles_SP_AQ<-data.frame(time=seq(0,63))
percentiles_SP_AQ$perc_0.025<-NA
percentiles_SP_AQ$perc_0.5<-NA
percentiles_SP_AQ$perc_0.975<-NA


for (r in 0:63) { 
  PE_SP_AQ<- exp(-(r/params$lambda_quint_SP_AQ)^params$w_quint_SP_AQ)
  percentiles_SP_AQ$perc_0.025[r+1]<-quantile(PE_SP_AQ, probs = c(0.025))
  percentiles_SP_AQ$perc_0.5[r+1]<-quantile(PE_SP_AQ, probs = c(0.5))
  percentiles_SP_AQ$perc_0.975[r+1]<-quantile(PE_SP_AQ,probs = c(0.975))
}
#####
percentiles_SP_CQ<-data.frame(time=seq(0,63))
percentiles_SP_CQ$perc_0.025<-NA
percentiles_SP_CQ$perc_0.5<-NA
percentiles_SP_CQ$perc_0.975<-NA


for (r in 0:63) { 
  PE_SP_CQ<- exp(-(r/params$lambda_quint_SP_CQ)^params$w_quint_SP_CQ)
  percentiles_SP_CQ$perc_0.025[r+1]<-quantile(PE_SP_CQ, probs = c(0.025))
  percentiles_SP_CQ$perc_0.5[r+1]<-quantile(PE_SP_CQ, probs = c(0.5))
  percentiles_SP_CQ$perc_0.975[r+1]<-quantile(PE_SP_CQ,probs = c(0.975))
}

#####
percentiles_CQ<-data.frame(time=seq(0,63))
percentiles_CQ$perc_0.025<-NA
percentiles_CQ$perc_0.5<-NA
percentiles_CQ$perc_0.975<-NA


for (r in 0:63) { 
  PE_CQ<- exp(-(r/params$lambda_quadr_CQ)^params$w_quadr_CQ)
  percentiles_CQ$perc_0.025[r+1]<-quantile(PE_CQ, probs = c(0.025))
  percentiles_CQ$perc_0.5[r+1]<-quantile(PE_CQ, probs = c(0.5))
  percentiles_CQ$perc_0.975[r+1]<-quantile(PE_CQ,probs = c(0.975))
}

percentiles_SP_CQ$drug <-"SPCQ"
percentiles_SP_AQ$drug <-"SPAQ"
percentiles_CQ$drug <-"CQ"




plot_PE_SPAQ<- ggplot(data=percentiles_SP_AQ) +  
  theme_bw() +
  geom_ribbon(aes(x = time, ymin =perc_0.025,ymax =perc_0.975),
              fill=c(alpha(quint_col,0.2)), group=1) +
  geom_line(aes(x =time,y=perc_0.5), colour= quint_col, size=1)+
  geom_vline(xintercept=med_mean_dur_prot_quint_SP_AQ, linetype="dashed")+
  ylab("Protective efficacy") + xlab("Days since treatment") + labs(title="SPAQ")


plot_PE_SPCQ<-ggplot(data=percentiles_SP_CQ) +  
  theme_bw() +
  geom_ribbon(aes(x = time, ymin =perc_0.025,ymax =perc_0.975),
              fill=c(alpha(quint_col,0.2)), group=1) +
  geom_line(aes(x =time,y=perc_0.5), colour= quint_col, size=1)+
  geom_vline(xintercept=med_mean_dur_prot_quint_SP_CQ, linetype="dashed")+
  ylab("Protective efficacy") + xlab("Days since treatment") + labs(title="SPCQ")

plot_PE_CQ<-ggplot(data=percentiles_CQ) +  
  theme_bw() +
  geom_ribbon(aes(x = time, ymin =perc_0.025,ymax =perc_0.975),
              fill=c(alpha(quadr_col,0.2)), group=1) +
  geom_line(aes(x=time,y=perc_0.5), colour= quadr_col, size=1)+
  geom_vline(xintercept=med_mean_dur_prot_quadr_CQ, linetype="dashed")+
  ylab("Protective efficacy") + xlab("Days since treatment") + labs(title="CQ")


pdf(file = "PE_nonSPSPAS.pdf",   # The directory you want to save the file in
    width = 3, # The width of the plot in inches
    height = 8) # The height of the plot in inches

plot_grid(plot_PE_SPAQ,plot_PE_SPCQ, 
          plot_PE_CQ, ncol=1, scale = 0.9)

dev.off()

