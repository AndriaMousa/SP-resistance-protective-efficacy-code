

### install packages

#### load packages

# library(matrixStats)
# library(gdata)
library(ggplot2)
# library(cowplot)
library(rstan)
# library(bayesplot)
library(dplyr)
# library(DescTools)

###################################################################

##read in data

input_df<- read.csv("data/combined_data.csv")  ### REINFECTION DATA
freq_day0_df<-read.csv("data/day0_frequencies.csv")  ##FREQUENCY ON DAY0 DATA


##################################################################
### Store relevant outcome data for each study to be used by the model:

### data subset
input_df_SP_Bell<-input_df %>% filter(study=="Bell_2008") %>% filter(drug=="SP")
## number of time points 
N_obs_Bell<-nrow(input_df_SP_Bell)  
## outcome data matrix for SP group (rows=time point, columns= outcomes)
## in the case of the Bell study there are two outcomes: new infections with dhps GEA ie "quintuple" and number remaining uninfected
N_outcome_SP_Bell<-as.matrix(cbind(input_df_SP_Bell$N_I_quint_new[2:N_obs_Bell],input_df_SP_Bell$N_uninf[2:N_obs_Bell])) 
## as above but for SPAS group and so on..
input_df_SP_AS_Bell<-input_df %>% filter(study=="Bell_2008")  %>% filter(drug=="SPAS") 
N_outcome_SP_AS_Bell<-as.matrix(cbind(input_df_SP_AS_Bell$N_I_quint_new[2:N_obs_Bell],input_df_SP_AS_Bell$N_uninf[2:N_obs_Bell]))
input_df_SP_CQ_Bell<-input_df %>% filter(study=="Bell_2008")  %>% filter(drug=="SPCQ") 
N_outcome_SP_CQ_Bell<-as.matrix(cbind(input_df_SP_CQ_Bell$N_I_quint_new[2:N_obs_Bell],input_df_SP_CQ_Bell$N_uninf[2:N_obs_Bell]))
input_df_SP_AQ_Bell<-input_df %>% filter(study=="Bell_2008")  %>% filter(drug=="SPAQ") 
N_outcome_SP_AQ_Bell<-as.matrix(cbind(input_df_SP_AQ_Bell$N_I_quint_new[2:N_obs_Bell],input_df_SP_AQ_Bell$N_uninf[2:N_obs_Bell]))

##################################################################
input_df_SP_Gesase<-input_df %>% filter(study=="Gesase_2009") 
N_obs_Gesase<-nrow(input_df_SP_Gesase)
## in the case of the Gesase study there are four outcomes: new infections with dhps GEA ie "quintuple", new infections with dhps GEG ie "sextuple", new infections with undetermined dhps genotype, and number remaining uninfected
N_outcome_SP_Gesase<-as.matrix(cbind(input_df_SP_Gesase$N_I_quint_new[2:N_obs_Gesase],
                                     input_df_SP_Gesase$N_I_sext_new[2:N_obs_Gesase],
                                     input_df_SP_Gesase$N_I_undeterm_new[2:N_obs_Gesase],
                                     input_df_SP_Gesase$N_uninf[2:N_obs_Gesase]))
sext_day0_Gesase <- freq_day0_df$sextuple_day0[which(freq_day0_df$Study=="Gesase2009")] ##number with dhps GEG among determined and unmixed samples in the 3 codons of interest (numerator)
denomin_day0_Gesase<- freq_day0_df$quintuple_day0[which(freq_day0_df$Study=="Gesase2009")]+  freq_day0_df$sextuple_day0[which(freq_day0_df$Study=="Gesase2009")] # number of determined and unmixed samples in the 3 codons of interest (denominator)

######################################################

input_df_SP_Nahum<-input_df %>% filter(study=="Nahum_2009") %>% filter(drug=="SP")
N_obs_Nahum<-nrow(input_df_SP_Nahum)
N_outcome_SP_Nahum<-as.matrix(cbind(input_df_SP_Nahum$N_I_quadr_new[2:N_obs_Nahum],input_df_SP_Nahum$N_uninf[2:N_obs_Nahum]))
input_df_SP_AS_Nahum<-input_df %>% filter(study=="Nahum_2009")  %>% filter(drug=="SPAS") 
N_outcome_SP_AS_Nahum<-as.matrix(cbind(input_df_SP_AS_Nahum$N_I_quadr_new[2:N_obs_Nahum],input_df_SP_AS_Nahum$N_uninf[2:N_obs_Nahum]))
input_df_CQ_Nahum<-input_df %>% filter(study=="Nahum_2009")  %>% filter(drug=="CQ") 
N_outcome_CQ_Nahum<-as.matrix(cbind(input_df_CQ_Nahum$N_I_quadr_new[2:N_obs_Nahum],input_df_CQ_Nahum$N_uninf[2:N_obs_Nahum]))


#####################################################

input_df_SP_Allen_Magude<-input_df %>% filter(study=="Allen_2009_EKDTF")  %>% filter(drug=="SP") %>% filter(site=="Magude")
N_obs_Allen_Magude<-nrow(input_df_SP_Allen_Magude)
N_outcome_SP_Allen_Magude<-as.matrix(cbind(input_df_SP_Allen_Magude$N_I_undeterm_new[2:N_obs_Allen_Magude],
                                    input_df_SP_Allen_Magude$N_uninf[2:N_obs_Allen_Magude]))

input_df_SP_AS_Allen_Magude<-input_df %>% filter(study=="Allen_2009_EKDTF")  %>% filter(drug=="SPAS")%>% filter(site=="Magude")
N_outcome_SP_AS_Allen_Magude<-as.matrix(cbind(input_df_SP_AS_Allen_Magude$N_I_undeterm_new[2:N_obs_Allen_Magude],
                                    input_df_SP_AS_Allen_Magude$N_uninf[2:N_obs_Allen_Magude]))

quint_day0_Allen_Magude <- freq_day0_df$quintuple_day0[which(freq_day0_df$Study=="Allen2009_Magude")]
denomin_day0_Allen_Magude<- freq_day0_df$quintuple_day0[which(freq_day0_df$Study=="Allen2009_Magude")]+  freq_day0_df$triple_day0[which(freq_day0_df$Study=="Allen2009_Magude")]


######################################################

#####################################################

input_df_SP_Allen_Boane<-input_df %>% filter(study=="Allen_2009_EKDTF")  %>% filter(drug=="SP") %>% filter(site=="Boane")
N_obs_Allen_Boane<-nrow(input_df_SP_Allen_Boane)
N_outcome_SP_Allen_Boane<-as.matrix(cbind(input_df_SP_Allen_Boane$N_I_undeterm_new[2:N_obs_Allen_Boane],
                                           input_df_SP_Allen_Boane$N_uninf[2:N_obs_Allen_Boane]))

input_df_SP_AS_Allen_Boane<-input_df %>% filter(study=="Allen_2009_EKDTF")  %>% filter(drug=="SPAS")%>% filter(site=="Boane")
N_outcome_SP_AS_Allen_Boane<-as.matrix(cbind(input_df_SP_AS_Allen_Boane$N_I_undeterm_new[2:N_obs_Allen_Boane],
                                              input_df_SP_AS_Allen_Boane$N_uninf[2:N_obs_Allen_Boane]))

quint_day0_Allen_Boane <- freq_day0_df$quintuple_day0[which(freq_day0_df$Study=="Allen2009_Boane")]
denomin_day0_Allen_Boane<- freq_day0_df$quintuple_day0[which(freq_day0_df$Study=="Allen2009_Boane")]+  freq_day0_df$triple_day0[which(freq_day0_df$Study=="Allen2009_Boane")]


######################################################

#####################################################

input_df_SP_Allen_Namaacha<-input_df %>% filter(study=="Allen_2009_EKDTF")  %>% filter(drug=="SP") %>% filter(site=="Namaacha")
N_obs_Allen_Namaacha<-nrow(input_df_SP_Allen_Namaacha)
N_outcome_SP_Allen_Namaacha<-as.matrix(cbind(input_df_SP_Allen_Namaacha$N_I_undeterm_new[2:N_obs_Allen_Namaacha],
                                           input_df_SP_Allen_Namaacha$N_uninf[2:N_obs_Allen_Namaacha]))

input_df_SP_AS_Allen_Namaacha<-input_df %>% filter(study=="Allen_2009_EKDTF")  %>% filter(drug=="SPAS")%>% filter(site=="Namaacha")
N_outcome_SP_AS_Allen_Namaacha<-as.matrix(cbind(input_df_SP_AS_Allen_Namaacha$N_I_undeterm_new[2:N_obs_Allen_Namaacha],
                                              input_df_SP_AS_Allen_Namaacha$N_uninf[2:N_obs_Allen_Namaacha]))

quint_day0_Allen_Namaacha <- freq_day0_df$quintuple_day0[which(freq_day0_df$Study=="Allen2009_Namaacha")]
denomin_day0_Allen_Namaacha<- freq_day0_df$quintuple_day0[which(freq_day0_df$Study=="Allen2009_Namaacha")]+  freq_day0_df$triple_day0[which(freq_day0_df$Study=="Allen2009_Namaacha")]


######################################################

#####################################################

input_df_SP_Allen_Catuane<-input_df %>% filter(study=="Allen_2009_EKDTF")  %>% filter(drug=="SP") %>% filter(site=="Catuane")
N_obs_Allen_Catuane<-nrow(input_df_SP_Allen_Catuane)
N_outcome_SP_Allen_Catuane<-as.matrix(cbind(input_df_SP_Allen_Catuane$N_I_undeterm_new[2:N_obs_Allen_Catuane],
                                           input_df_SP_Allen_Catuane$N_uninf[2:N_obs_Allen_Catuane]))

input_df_SP_AS_Allen_Catuane<-input_df %>% filter(study=="Allen_2009_EKDTF")  %>% filter(drug=="SPAS")%>% filter(site=="Catuane")
N_outcome_SP_AS_Allen_Catuane<-as.matrix(cbind(input_df_SP_AS_Allen_Catuane$N_I_undeterm_new[2:N_obs_Allen_Catuane],
                                              input_df_SP_AS_Allen_Catuane$N_uninf[2:N_obs_Allen_Catuane]))

quint_day0_Allen_Catuane <- freq_day0_df$quintuple_day0[which(freq_day0_df$Study=="Allen2009_Catuane")]
denomin_day0_Allen_Catuane<- freq_day0_df$quintuple_day0[which(freq_day0_df$Study=="Allen2009_Catuane")]+  freq_day0_df$triple_day0[which(freq_day0_df$Study=="Allen2009_Catuane")]
##########################################################

input_df_SP_RHXNJ<- input_df%>% filter(study=="Barnes_2006_RHXNJ") 
N_obs_RHXNJ<-nrow(input_df_SP_RHXNJ)

N_outcome_SP_RHXNJ<-as.matrix(cbind(input_df_SP_RHXNJ$N_I_undeterm_new[2:N_obs_RHXNJ],input_df_SP_RHXNJ$N_uninf[2:N_obs_RHXNJ]))
quint_day0_RHXNJ <- freq_day0_df$quintuple_day0[which(freq_day0_df$Study=="Barnes2006_RHXNJ")]
denomin_day0_RHXNJ<- freq_day0_df$quintuple_day0[which(freq_day0_df$Study=="Barnes2006_RHXNJ")]+  freq_day0_df$triple_day0[which(freq_day0_df$Study=="Barnes2006_RHXNJ")]
##########################################################


input_df_SP_RZENT<- input_df%>% filter(study=="Barnes_2006_RZENT") 
N_obs_RZENT<-nrow(input_df_SP_RZENT)
N_outcome_SP_RZENT<-as.matrix(cbind(input_df_SP_RZENT$N_I_undeterm_new[2:N_obs_RZENT],input_df_SP_RZENT$N_uninf[2:N_obs_RZENT]))
quint_day0_RZENT <- freq_day0_df$quintuple_day0[which(freq_day0_df$Study=="Barnes2006_RZENT")]
denomin_day0_RZENT<- freq_day0_df$quintuple_day0[which(freq_day0_df$Study=="Barnes2006_RZENT")]+  freq_day0_df$triple_day0[which(freq_day0_df$Study=="Barnes2006_RZENT")]

######################################################
input_df_SP_NMMSB<- input_df%>% filter(study=="Barnes_2006_NMMSB") 
N_obs_NMMSB<-nrow(input_df_SP_NMMSB)
N_outcome_SP_NMMSB<-as.matrix(cbind(input_df_SP_NMMSB$N_I_undeterm_new[2:N_obs_NMMSB],input_df_SP_NMMSB$N_uninf[2:N_obs_NMMSB]))
quint_day0_NMMSB <- freq_day0_df$quintuple_day0[which(freq_day0_df$Study=="Barnes2006_NMMSB")]
denomin_day0_NMMSB<- freq_day0_df$quintuple_day0[which(freq_day0_df$Study=="Barnes2006_NMMSB")]+  freq_day0_df$triple_day0[which(freq_day0_df$Study=="Barnes2006_NMMSB")]

######################################################

######################################################
input_df_SP_PEADD<- input_df%>% filter(study=="Barnes_2008_Mabuza_2005_PEADD") 
N_obs_PEADD<-nrow(input_df_SP_PEADD)
N_outcome_SP_PEADD<-as.matrix(cbind(input_df_SP_PEADD$N_I_undeterm_new[2:N_obs_PEADD],input_df_SP_PEADD$N_uninf[2:N_obs_PEADD]))
quint_day0_PEADD <- freq_day0_df$quintuple_day0[which(freq_day0_df$Study=="Barnes2008_Mabuza2005_PEADD")]
denomin_day0_PEADD<- freq_day0_df$quintuple_day0[which(freq_day0_df$Study=="Barnes2008_Mabuza2005_PEADD")]+  freq_day0_df$triple_day0[which(freq_day0_df$Study=="Barnes2008_Mabuza2005_PEADD")]

######################################################
##############################
input_df_SP_KZN<- input_df%>% filter(study=="KZN") 
N_obs_KZN<-nrow(input_df_SP_KZN)
### here we assume that all the undetermined ones are quintuple based on earlier data where quint was 90%
N_outcome_SP_KZN<-as.matrix(cbind(input_df_SP_KZN$N_I_undeterm_new[2:N_obs_KZN],input_df_SP_KZN$N_uninf[2:N_obs_KZN]))
######################################################

##set.seed(4354768)
set.seed(44768)

dt=0.5   ## time step to be used in deterministic model

endTime_Bell=42   ##length of followup
N_Bell<-endTime_Bell/dt+1 # time steps for running the model. +1 to allow for time 0

endTime_Gesase=28
N_Gesase<-endTime_Gesase/dt+1 

endTime_Nahum=90
N_Nahum<-endTime_Nahum/dt+1 

endTime_Allen_Magude=42
N_Allen_Magude<-endTime_Allen_Magude/dt+1 

endTime_Allen_Boane=42
N_Allen_Boane<-endTime_Allen_Boane/dt+1 

endTime_Allen_Namaacha=42
N_Allen_Namaacha<-endTime_Allen_Namaacha/dt+1 

endTime_Allen_Catuane=42
N_Allen_Catuane<-endTime_Allen_Catuane/dt+1

endTime_RHXNJ=42
N_RHXNJ<-endTime_RHXNJ/dt+1 

endTime_RZENT=42
N_RZENT<-endTime_RZENT/dt+1

endTime_NMMSB=42
N_NMMSB<-endTime_NMMSB/dt+1 

endTime_PEADD=42
N_PEADD<-endTime_PEADD/dt+1 

endTime_KZN=42
N_KZN<-endTime_KZN/dt+1 


rstan_options(auto_write = TRUE)



#stan data list model inputs                                               

stan_data <- list( 
                   N_obs_Bell = N_obs_Bell,                        ## number of observed time points
                   T_Bell = input_df_SP_Bell$T,                                ## time point (eg. day 0, day 2 etc)
                   row_model_Bell = (input_df_SP_Bell$T/dt)+1,
                   N_outcome_SP_Bell=N_outcome_SP_Bell,
                   N_outcome_SP_AS_Bell=N_outcome_SP_AS_Bell,
                   N_outcome_SP_CQ_Bell=N_outcome_SP_CQ_Bell,
                   N_outcome_SP_AQ_Bell=N_outcome_SP_AQ_Bell,
                   N_Bell=N_Bell,
                   
                   N_obs_Gesase = nrow(input_df_SP_Gesase),
                   T_Gesase = input_df_SP_Gesase$T,
                   row_model_Gesase = (input_df_SP_Gesase$T/dt)+1,
                   N_outcome_SP_Gesase=N_outcome_SP_Gesase,
                   N_Gesase=N_Gesase,
                   sext_day0_Gesase = sext_day0_Gesase,
                   denomin_day0_Gesase =denomin_day0_Gesase,
                    
                   N_obs_Nahum = N_obs_Nahum,
                   T_Nahum = input_df_SP_Nahum$T,
                   row_model_Nahum = (input_df_SP_Nahum$T/dt)+1,
                   N_outcome_SP_Nahum=N_outcome_SP_Nahum,
                   N_outcome_SP_AS_Nahum=N_outcome_SP_AS_Nahum,
                   N_outcome_CQ_Nahum=N_outcome_CQ_Nahum,
                   N_Nahum=N_Nahum,

                   T_Allen_Magude = input_df_SP_Allen_Magude$T,
                   row_model_Allen_Magude = (input_df_SP_Allen_Magude$T/dt)+1,
                   N_outcome_SP_Allen_Magude=N_outcome_SP_Allen_Magude,
                   N_outcome_SP_AS_Allen_Magude=N_outcome_SP_AS_Allen_Magude,
                   N_Allen_Magude=N_Allen_Magude,
                   quint_day0_Allen_Magude = quint_day0_Allen_Magude,
                   denomin_day0_Allen_Magude =denomin_day0_Allen_Magude,
                   N_obs_Allen_Magude = N_obs_Allen_Magude,
                   
                   T_Allen_Boane = input_df_SP_Allen_Boane$T,
                   row_model_Allen_Boane = (input_df_SP_Allen_Boane$T/dt)+1,
                   N_outcome_SP_Allen_Boane=N_outcome_SP_Allen_Boane,
                   N_outcome_SP_AS_Allen_Boane=N_outcome_SP_AS_Allen_Boane,
                   N_Allen_Boane=N_Allen_Boane,
                   quint_day0_Allen_Boane = quint_day0_Allen_Boane,
                   denomin_day0_Allen_Boane =denomin_day0_Allen_Boane,
                   N_obs_Allen_Boane = N_obs_Allen_Boane,

                   T_Allen_Namaacha = input_df_SP_Allen_Namaacha$T,
                   row_model_Allen_Namaacha = (input_df_SP_Allen_Namaacha$T/dt)+1,
                   N_outcome_SP_Allen_Namaacha=N_outcome_SP_Allen_Namaacha,
                   N_outcome_SP_AS_Allen_Namaacha=N_outcome_SP_AS_Allen_Namaacha,
                   N_Allen_Namaacha=N_Allen_Namaacha,
                   quint_day0_Allen_Namaacha = quint_day0_Allen_Namaacha,
                   denomin_day0_Allen_Namaacha =denomin_day0_Allen_Namaacha,
                   N_obs_Allen_Namaacha = N_obs_Allen_Namaacha,
                   
                   T_Allen_Catuane = input_df_SP_Allen_Catuane$T,
                   row_model_Allen_Catuane = (input_df_SP_Allen_Catuane$T/dt)+1,
                   N_outcome_SP_Allen_Catuane=N_outcome_SP_Allen_Catuane,
                   N_outcome_SP_AS_Allen_Catuane=N_outcome_SP_AS_Allen_Catuane,
                   N_Allen_Catuane=N_Allen_Catuane,
                   quint_day0_Allen_Catuane = quint_day0_Allen_Catuane,
                   denomin_day0_Allen_Catuane =denomin_day0_Allen_Catuane,
                   N_obs_Allen_Catuane = N_obs_Allen_Catuane,

                   N_obs_RHXNJ = N_obs_RHXNJ,
                   T_RHXNJ = input_df_SP_RHXNJ$T,                                
                   row_model_RHXNJ = (input_df_SP_RHXNJ$T/dt)+1,
                   N_outcome_SP_RHXNJ=N_outcome_SP_RHXNJ,
                   N_RHXNJ=N_RHXNJ,
                   quint_day0_RHXNJ = quint_day0_RHXNJ,
                   denomin_day0_RHXNJ =denomin_day0_RHXNJ,
                   
                   N_obs_RZENT = N_obs_RZENT,                        
                   T_RZENT = input_df_SP_RZENT$T,                                
                   row_model_RZENT = (input_df_SP_RZENT$T/dt)+1,
                   N_outcome_SP_RZENT=N_outcome_SP_RZENT,
                   N_RZENT=N_RZENT,
                   quint_day0_RZENT = quint_day0_RZENT,
                   denomin_day0_RZENT =denomin_day0_RZENT,
                   
                   N_obs_NMMSB = N_obs_NMMSB,                       
                   T_NMMSB = input_df_SP_NMMSB$T,                                
                   row_model_NMMSB = (input_df_SP_NMMSB$T/dt)+1,
                   N_outcome_SP_NMMSB=N_outcome_SP_NMMSB,
                   N_NMMSB=N_NMMSB,
                   quint_day0_NMMSB = quint_day0_NMMSB,
                   denomin_day0_NMMSB =denomin_day0_NMMSB,
                   
                   N_obs_PEADD = N_obs_PEADD,
                   T_PEADD = input_df_SP_PEADD$T,
                   row_model_PEADD = (input_df_SP_PEADD$T/dt)+1,
                   N_outcome_SP_PEADD=N_outcome_SP_PEADD,
                   N_PEADD=N_PEADD,
                   quint_day0_PEADD = quint_day0_PEADD,
                   denomin_day0_PEADD =denomin_day0_PEADD,
                   
                   N_obs_KZN = N_obs_KZN,                       
                   T_KZN = input_df_SP_KZN$T,                              
                   row_model_KZN = (input_df_SP_KZN$T/dt)+1,
                   N_outcome_SP_KZN=N_outcome_SP_KZN,
                   N_KZN=N_KZN,
                   
                   dt=dt)
stan_data

### the stan model code below may take a few minutes (or up to 1 hour) to run. For a quicker run you could try a lower number of iterations 

model<- stan("deterministic_combined_all.stan",
             data = stan_data,
             chains = 4, 
             iter = 10000,
             control = list(adapt_delta = 0.99, stepsize = 0.01, max_treedepth = 15))


#saveRDS(model, "model_all_combined_10000iters.RData")

model<-readRDS("model_all_combined_10000iters.RData") 

params<-rstan::extract( model)


### list of parameters estimated in the model

par_list<-c("inc_Bell" ,                 "inc_Gesase" ,               "inc_Nahum"    ,             "inc_Allen_Magude"     ,     "inc_Allen_Boane"  ,         "inc_Allen_Namaacha" ,      
            "inc_Allen_Catuane",         "inc_RHXNJ"   ,              "inc_RZENT"   ,              "inc_NMMSB"      ,           "inc_PEADD"    ,             "inc_KZN"        ,          
            "freq_sext_Gesase" ,         "prob_determ_Gesase" ,       "freq_quint_Allen_Magude",   "freq_quint_Allen_Boane"  ,  "freq_quint_Allen_Namaacha", "freq_quint_Allen_Catuane" ,
            "freq_quint_RHXNJ" ,         "freq_quint_RZENT" ,         "freq_quint_NMMSB" ,         "freq_quint_PEADD" ,         "w_quadr_SP"    ,            "w_quint_SP"  ,             
            "w_sext_SP"    ,             "w_tripl_SP"    ,            "w_tripl_SP_AS"   ,          "w_quadr_SP_AS"    ,         "w_quint_SP_AS"   ,          "w_quint_SP_CQ" ,           
            "w_quint_SP_AQ"   ,          "w_quadr_CQ"    ,            "lambda_tripl_SP" ,          "lambda_tripl_SP_AS" ,       "lambda_quadr_SP" ,          "lambda_quint_SP"  ,        
            "lambda_sext_SP"   ,         "lambda_quint_SP_AS" ,       "lambda_quint_SP_CQ" ,       "lambda_quint_SP_AQ"  ,      "lambda_quadr_SP_AS"   ,     "lambda_quadr_CQ" )


##summarizing estimated parameters
print(summary(model,pars = par_list))$summary

print(model,pars = par_list)

####extracting ESS_bulk

for (p in par_list) {
  print(p)
  eval(parse(text=(paste0("temp<-matrix(params$",p,", ncol=4)"))))
  print(ess_bulk(temp))
}


for (p in par_list) {
  print(p)
  eval(parse(text=(paste0("temp<-matrix(params$",p,", ncol=4)"))))
  print(ess_tail(temp))
}


for (p in par_list) {
  print(p)
  eval(parse(text=(paste0("temp<-matrix(params$",p,", ncol=4)"))))
  print(Rhat(temp))
}


## additional diagnostics e.g., traceplots and correlation plots (not presented in the manuscript):

trace_plot_parms<-mcmc_trace(model,
                             pars = par_list,
                             facet_args = list(nrow = 7, ncol=6))+  theme(legend.position = 'none')


mcmc_pairs(model, pars = c("inc_Allen_Catuane", "lambda_quint_SP", "w_quint_SP"))
mcmc_pairs(model, pars = c("inc_RHXNJ" , "lambda_quint_SP", "w_quint_SP"))
mcmc_pairs(model, pars = c("inc_RZENT"  , "lambda_quint_SP", "w_quint_SP"))
mcmc_pairs(model, pars = c("inc_NMMSB", "lambda_quint_SP", "w_quint_SP"))
mcmc_pairs(model, pars = c("inc_PEADD" , "lambda_quint_SP", "w_quint_SP"))
mcmc_pairs(model, pars = c( "inc_KZN"     , "lambda_quint_SP", "w_quint_SP"))
mcmc_pairs(model, pars = c("inc_Gesase"  , "lambda_quint_SP", "w_quint_SP"))



#### medians and credible intervals of estimated parameters

quantile(params$inc_Bell,   probs = c(0.025,0.5,0.975))
quantile(params$inc_Gesase, probs = c(0.025,0.5,0.975))
quantile(params$inc_Nahum, probs = c(0.025,0.5,0.975))
quantile(params$inc_Allen_Magude,  probs = c(0.025,0.5,0.975))
quantile(params$inc_Allen_Boane,  probs = c(0.025,0.5,0.975))
quantile(params$inc_Allen_Namaacha,  probs = c(0.025,0.5,0.975))
quantile(params$inc_Allen_Catuane,  probs = c(0.025,0.5,0.975))
quantile(params$inc_RHXNJ,  probs = c(0.025,0.5,0.975))
quantile(params$inc_RZENT,  probs = c(0.025,0.5,0.975))
quantile(params$inc_NMMSB,  probs = c(0.025,0.5,0.975))
quantile(params$inc_PEADD,  probs = c(0.025,0.5,0.975))
quantile(params$inc_KZN,    probs = c(0.025,0.5,0.975))   

quantile(params$freq_sext_Gesase, probs = c(0.025,0.5,0.975))
quantile(params$freq_quint_Allen_Magude, probs = c(0.025,0.5,0.975))
quantile(params$freq_quint_Allen_Boane, probs = c(0.025,0.5,0.975))
quantile(params$freq_quint_Allen_Namaacha, probs = c(0.025,0.5,0.975))
quantile(params$freq_quint_Allen_Catuane, probs = c(0.025,0.5,0.975))
quantile(params$freq_quint_RHXNJ, probs = c(0.025,0.5,0.975))
quantile(params$freq_quint_RZENT, probs = c(0.025,0.5,0.975))
quantile(params$freq_quint_NMMSB, probs = c(0.025,0.5,0.975))
quantile(params$freq_quint_PEADD, probs = c(0.025,0.5,0.975))

quantile(params$lambda_tripl_SP, probs = c(0.025,0.5,0.975))
quantile(params$w_tripl_SP, probs = c(0.025,0.5,0.975))
quantile(params$lambda_quint_SP, probs = c(0.025,0.5,0.975))
quantile(params$w_quint_SP, probs = c(0.025,0.5,0.975))

quantile(params$lambda_sext_SP, probs = c(0.025,0.5,0.975))
quantile(params$w_sext_SP, probs = c(0.025,0.5,0.975))

quantile(params$lambda_tripl_SP_AS, probs = c(0.025,0.5,0.975))
quantile(params$w_tripl_SP_AS, probs = c(0.025,0.5,0.975))
quantile(params$lambda_quint_SP_AS, probs = c(0.025,0.5,0.975))
quantile(params$w_quint_SP_AS, probs = c(0.025,0.5,0.975))

quantile(params$lambda_quint_SP_CQ, probs = c(0.025,0.5,0.975))
quantile(params$w_quint_SP_CQ, probs = c(0.025,0.5,0.975))
quantile(params$lambda_quint_SP_AQ, probs = c(0.025,0.5,0.975))
quantile(params$w_quint_SP_AQ, probs = c(0.025,0.5,0.975))

quantile(params$lambda_quadr_SP, probs = c(0.025,0.5,0.975))
quantile(params$lambda_quadr_SP_AS, probs = c(0.025,0.5,0.975))
quantile(params$lambda_quadr_CQ, probs = c(0.025,0.5,0.975))




#### Duration of protection (mean of Weibull curve)

dur_prot_tripl_SP<-gamma(1+(1/params$w_tripl_SP)) * params$lambda_tripl_SP
dur_prot_quadr_SP<-gamma(1+(1/params$w_quadr_SP)) * params$lambda_quadr_SP
dur_prot_quint_SP<-gamma(1+(1/params$w_quint_SP)) * params$lambda_quint_SP
dur_prot_sext_SP<-gamma(1+(1/params$w_sext_SP)) * params$lambda_sext_SP
dur_prot_tripl_SP_AS<-gamma(1+(1/params$w_tripl_SP_AS)) * params$lambda_tripl_SP_AS
dur_prot_tripl_SP_AS<-gamma(1+(1/params$w_tripl_SP_AS)) * params$lambda_tripl_SP_AS
dur_prot_quadr_SP_AS<-gamma(1+(1/params$w_quadr_SP_AS)) * params$lambda_quadr_SP_AS
dur_prot_quadr_CQ<-gamma(1+(1/params$w_quadr_CQ)) * params$lambda_quadr_CQ
dur_prot_quint_SP_AS<-gamma(1+(1/params$w_quint_SP_AS)) * params$lambda_quint_SP_AS
dur_prot_quint_SP_CQ<-gamma(1+(1/params$w_quint_SP_CQ)) * params$lambda_quint_SP_CQ
dur_prot_quint_SP_AQ<-gamma(1+(1/params$w_quint_SP_AQ)) * params$lambda_quint_SP_AQ


### for each drug and genotype, summarizing posterior distribution of mean duration of protection (median and credible intervals)

#SP
#triple:
quantile(dur_prot_tripl_SP, probs=c(0.025,0.5,0.975))
#quadruple:
quantile(dur_prot_quadr_SP, probs=c(0.025,0.5,0.975))
#quintuple:
quantile(dur_prot_quint_SP, probs=c(0.025,0.5,0.975))
#sextuple
quantile(dur_prot_sext_SP, probs=c(0.025,0.5,0.975))
#
#

#SPAS
#triple:
quantile(dur_prot_tripl_SP_AS, probs=c(0.025,0.5,0.975))
#quadruple:
quantile(dur_prot_quadr_SP_AS, probs=c(0.025,0.5,0.975))
#quintuple:
quantile(dur_prot_quint_SP_AS, probs=c(0.025,0.5,0.975))
#
#
#
#nonSP/SPAS drugs
quantile(dur_prot_quint_SP_CQ, probs=c(0.025,0.5,0.975))
quantile(dur_prot_quint_SP_AQ, probs=c(0.025,0.5,0.975))
quantile(dur_prot_quadr_CQ, probs=c(0.025,0.5,0.975))




