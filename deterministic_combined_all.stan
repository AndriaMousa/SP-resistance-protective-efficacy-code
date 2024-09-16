
// The input data 
data {
  
    real dt;                         /// time step  

  //Bell study
  int N_obs_Bell;                  //total rows (number of time points observed)
  int <lower=0> T_Bell[N_obs_Bell];     //time point (observed)
  int row_model_Bell[N_obs_Bell];  // row of model output that will correspond to time point T in data (pre computed)
  int <lower=0> N_Bell;            ///number of time pts for the model
  int N_outcome_SP_Bell[(N_obs_Bell-1),2];     // matrix that stores the outcome (columns) over time (rows). The outcome is number of new infections by genotype and number remaining uninfected at each time point.
  int N_outcome_SP_AS_Bell[(N_obs_Bell-1),2];
  int N_outcome_SP_CQ_Bell[(N_obs_Bell-1),2];
  int N_outcome_SP_AQ_Bell[(N_obs_Bell-1),2];

  //Gesase study
  int N_obs_Gesase;
  int <lower=0> T_Gesase[N_obs_Gesase];
  int row_model_Gesase[N_obs_Gesase];
  int <lower=0> N_Gesase;
  int N_outcome_SP_Gesase[(N_obs_Gesase-1),4];
  int<lower=0> sext_day0_Gesase ;
  int<lower=0> denomin_day0_Gesase ;

  //Nahum study
  int N_obs_Nahum;
  int <lower=0> T_Nahum[N_obs_Nahum];
  int row_model_Nahum[N_obs_Nahum];
  int <lower=0> N_Nahum;
  int N_outcome_SP_Nahum[(N_obs_Nahum-1),2];
  int N_outcome_SP_AS_Nahum[(N_obs_Nahum-1),2];
  int N_outcome_CQ_Nahum[(N_obs_Nahum-1),2];

  ///Allen_Magude
  int N_obs_Allen_Magude;
  int <lower=0> T_Allen_Magude[N_obs_Allen_Magude];
  int row_model_Allen_Magude[N_obs_Allen_Magude];
  int <lower=0> N_Allen_Magude;
  int N_outcome_SP_Allen_Magude[(N_obs_Allen_Magude-1),2];
  int N_outcome_SP_AS_Allen_Magude[(N_obs_Allen_Magude-1),2];
  int<lower=0> quint_day0_Allen_Magude ;
  int<lower=0> denomin_day0_Allen_Magude ;

  ///Allen_Boane
  int N_obs_Allen_Boane;
  int <lower=0> T_Allen_Boane[N_obs_Allen_Boane];
  int row_model_Allen_Boane[N_obs_Allen_Boane];
  int <lower=0> N_Allen_Boane;
  int N_outcome_SP_Allen_Boane[(N_obs_Allen_Boane-1),2];
  int N_outcome_SP_AS_Allen_Boane[(N_obs_Allen_Boane-1),2];
  int<lower=0> quint_day0_Allen_Boane ;
  int<lower=0> denomin_day0_Allen_Boane ;

  ///Allen_Namaacha
  int N_obs_Allen_Namaacha;
  int <lower=0> T_Allen_Namaacha[N_obs_Allen_Namaacha];
  int row_model_Allen_Namaacha[N_obs_Allen_Namaacha];
  int <lower=0> N_Allen_Namaacha;
  int N_outcome_SP_Allen_Namaacha[(N_obs_Allen_Namaacha-1),2];
  int N_outcome_SP_AS_Allen_Namaacha[(N_obs_Allen_Namaacha-1),2];
  int<lower=0> quint_day0_Allen_Namaacha ;
  int<lower=0> denomin_day0_Allen_Namaacha ;

  ///Allen_Catuane
  int N_obs_Allen_Catuane;
  int <lower=0> T_Allen_Catuane[N_obs_Allen_Catuane];
  int row_model_Allen_Catuane[N_obs_Allen_Catuane];
  int <lower=0> N_Allen_Catuane;
  int N_outcome_SP_Allen_Catuane[(N_obs_Allen_Catuane-1),2];
  int N_outcome_SP_AS_Allen_Catuane[(N_obs_Allen_Catuane-1),2];
  int<lower=0> quint_day0_Allen_Catuane ;
  int<lower=0> denomin_day0_Allen_Catuane ;

  ///RHXNJ (Barnes 2006 - Namaacha Mozambique 2002 study)
   int N_obs_RHXNJ;
   int <lower=0> T_RHXNJ[N_obs_RHXNJ];
   int row_model_RHXNJ[N_obs_RHXNJ];
   int <lower=0> N_RHXNJ;
   int N_outcome_SP_RHXNJ[(N_obs_RHXNJ-1),2];
   int<lower=0> quint_day0_RHXNJ ;
   int<lower=0> denomin_day0_RHXNJ ;

  ///RZENT (Barnes 2006 - Bela Vista Mozambique 2002 study)
   int N_obs_RZENT;
   int <lower=0> T_RZENT[N_obs_RZENT];
   int row_model_RZENT[N_obs_RZENT];
   int <lower=0> N_RZENT;
   int N_outcome_SP_RZENT[(N_obs_RZENT-1),2];
   int<lower=0> quint_day0_RZENT ;
   int<lower=0> denomin_day0_RZENT ;

  ///NMMSB (Barnes 2006 - Bela Vista Mozambique 2003 study)
   int N_obs_NMMSB;
   int <lower=0> T_NMMSB[N_obs_NMMSB];
   int row_model_NMMSB[N_obs_NMMSB];
   int <lower=0> N_NMMSB;
   int N_outcome_SP_NMMSB[(N_obs_NMMSB-1),2];
   int<lower=0> quint_day0_NMMSB ;
   int<lower=0> denomin_day0_NMMSB ;

  ///PEADD (Barnes 2008 - Mpumalanga South Africa 2002)
  int N_obs_PEADD;
  int <lower=0> T_PEADD[N_obs_PEADD];
  int row_model_PEADD[N_obs_PEADD];
  int <lower=0> N_PEADD;
  int N_outcome_SP_PEADD[(N_obs_PEADD-1),2];
  int<lower=0> quint_day0_PEADD ;
  int<lower=0> denomin_day0_PEADD ;

  //// KZN (Bredenkamp et al., 2001)
  int N_obs_KZN;
  int <lower=0> T_KZN[N_obs_KZN];
  int row_model_KZN[N_obs_KZN];
  int <lower=0> N_KZN;
  int N_outcome_SP_KZN[(N_obs_KZN-1),2];

}



// Model parameters 

parameters {
  
 //parameters that vary by study or are specific to a study:
  
  //background incidence (varies by study)
  
  real<lower=0> inc_Bell;
  real<lower=0> inc_Gesase;
  real<lower=0> inc_Nahum;
  real<lower=0> inc_Allen_Magude;
  real<lower=0> inc_Allen_Boane;
  real<lower=0> inc_Allen_Namaacha;
  real<lower=0> inc_Allen_Catuane;
  real<lower=0> inc_RHXNJ;
  real<lower=0> inc_RZENT;
  real<lower=0> inc_NMMSB;
  real<lower=0> inc_PEADD;
  real<lower=0> inc_KZN;
 
  ////Other

  real<lower=0, upper=1> freq_sext_Gesase; /// frequency of resistant parasite  (sextuple refers to dhps 437G-540E-581G)
  real<lower=0, upper=1> prob_determ_Gesase; // probability of determining the dhps genotype of a new infection
  real<lower=0, upper=1> freq_quint_Allen_Magude; 
  real<lower=0, upper=1> freq_quint_Allen_Boane;
  real<lower=0, upper=1> freq_quint_Allen_Namaacha;
  real<lower=0, upper=1> freq_quint_Allen_Catuane;
  real<lower=0, upper=1> freq_quint_RHXNJ;
  real<lower=0, upper=1> freq_quint_RZENT;
  real<lower=0, upper=1> freq_quint_NMMSB;
  real<lower=0, upper=1> freq_quint_PEADD;

  
  ///universal parameters
  
 //shape parameters of Weibull curve
 real<lower=0.0001> w_quadr_SP;
 real<lower=0.0001> w_quint_SP;
 real<lower=0.0001> w_sext_SP;
 real<lower=0.0001> w_tripl_SP;
 real<lower=0.0001> w_tripl_SP_AS;
 real<lower=0.0001> w_quadr_SP_AS;
 real<lower=0.0001> w_quint_SP_AS;
 real<lower=0.0001> w_quint_SP_CQ;
 real<lower=0.0001> w_quint_SP_AQ;
 real<lower=0.0001> w_quadr_CQ;

///scale parameters of Weibull curve
  real<lower=0.0001> lambda_tripl_SP;
  real<lower=0.0001> lambda_tripl_SP_AS;
  real<lower=0.0001> lambda_quadr_SP;
  real<lower=0.0001> lambda_quint_SP;
  real<lower=0.0001> lambda_sext_SP;
  real<lower=0.0001> lambda_quint_SP_AS;
  real<lower=0.0001> lambda_quint_SP_CQ;
  real<lower=0.0001> lambda_quint_SP_AQ;
  real<lower=0.0001> lambda_quadr_SP_AS;
  real<lower=0.0001> lambda_quadr_CQ;
}

///transformed parameters

transformed parameters {

real time_Bell[N_Bell];
real time_Gesase[N_Gesase];
real time_Nahum[N_Nahum];
real time_Allen_Magude[N_Allen_Magude];
real time_Allen_Boane[N_Allen_Boane];
real time_Allen_Namaacha[N_Allen_Namaacha];
real time_Allen_Catuane[N_Allen_Catuane];
real time_RHXNJ[N_RHXNJ];
real time_RZENT[N_RZENT];
real time_NMMSB[N_NMMSB];
real time_PEADD[N_PEADD];
real time_KZN[N_KZN];

  /////Bell (annotated with an example)
  real<lower=0, upper=1> pred_treated_I_quint_SP_Bell[N_Bell];     // predicted total proportion infected with dhps GEA by time t (cumulative)
  real<lower=0, upper=1> pred_treated_uninf_SP_Bell[N_Bell];   // predicted proportion not infected by time t (and are at risk in the next time step)
  real<lower=0, upper=1> pred_treated_I_quint_new_SP_Bell[N_Bell]; // predicted proportion of new infections with dhps GEA between the interval t and t-1
  real<lower=0, upper=1> p_protect_quint_SP_Bell[N_Bell];  // Protective efficacy at each time pt against dhps GEA
  real<lower=0, upper=1> pred_treated_I_quint_SP_AS_Bell[N_Bell];     
  real<lower=0, upper=1> pred_treated_uninf_SP_AS_Bell[N_Bell];  
  real<lower=0, upper=1> pred_treated_I_quint_new_SP_AS_Bell[N_Bell]; 
  real<lower=0, upper=1> p_protect_quint_SP_AS_Bell[N_Bell];  
  real<lower=0, upper=1> pred_treated_I_quint_SP_CQ_Bell[N_Bell];   
  real<lower=0, upper=1> pred_treated_uninf_SP_CQ_Bell[N_Bell];   
  real<lower=0, upper=1> pred_treated_I_quint_new_SP_CQ_Bell[N_Bell]; 
  real<lower=0, upper=1> p_protect_quint_SP_CQ_Bell[N_Bell];  
  real<lower=0, upper=1> pred_treated_I_quint_SP_AQ_Bell[N_Bell];    
  real<lower=0, upper=1> pred_treated_uninf_SP_AQ_Bell[N_Bell];   
  real<lower=0, upper=1> pred_treated_I_quint_new_SP_AQ_Bell[N_Bell]; 
  real<lower=0, upper=1> p_protect_quint_SP_AQ_Bell[N_Bell];  
  real <lower=0, upper=1> prob_inf_Bell;  // Probability of being infected at each time point in the absensce of treatment in the setting of the study (depends on force of infection) 

  //// Gesase
  real<lower=0, upper=1> pred_treated_I_sext_SP_Gesase[N_Gesase];
  real<lower=0, upper=1> pred_treated_I_quint_SP_Gesase[N_Gesase];
  real<lower=0, upper=1> pred_treated_uninf_SP_Gesase[N_Gesase];
  real<lower=0, upper=1> pred_treated_I_sext_new_SP_Gesase[N_Gesase];
  real<lower=0, upper=1> pred_treated_I_quint_new_SP_Gesase[N_Gesase];
  real<lower=0, upper=1> pred_treated_I_undeterm_new_SP_Gesase[N_Gesase];
  real<lower=0, upper=1> pred_treated_I_undeterm_SP_Gesase[N_Gesase];
  real<lower=0, upper=1> p_protect_sext_SP_Gesase[N_Gesase];
  real<lower=0, upper=1> p_protect_quint_SP_Gesase[N_Gesase];
  real <lower=0, upper=1> prob_inf_Gesase;  

/////Nahum
  real<lower=0, upper=1> pred_treated_I_quadr_SP_Nahum[N_Nahum];    
  real<lower=0, upper=1> pred_treated_uninf_SP_Nahum[N_Nahum];   
  real<lower=0, upper=1> pred_treated_I_quadr_new_SP_Nahum[N_Nahum]; 
  real<lower=0, upper=1> p_protect_quadr_SP_Nahum[N_Nahum];  
  real<lower=0, upper=1> pred_treated_I_quadr_SP_AS_Nahum[N_Nahum];   
  real<lower=0, upper=1> pred_treated_uninf_SP_AS_Nahum[N_Nahum];  
  real<lower=0, upper=1> pred_treated_I_quadr_new_SP_AS_Nahum[N_Nahum]; 
  real<lower=0, upper=1> p_protect_quadr_SP_AS_Nahum[N_Nahum]; 
  real<lower=0, upper=1> pred_treated_I_quadr_CQ_Nahum[N_Nahum];   
  real<lower=0, upper=1> pred_treated_uninf_CQ_Nahum[N_Nahum]; 
  real<lower=0, upper=1> pred_treated_I_quadr_new_CQ_Nahum[N_Nahum];
  real<lower=0, upper=1> p_protect_quadr_CQ_Nahum[N_Nahum];  
  real <lower=0, upper=1> prob_inf_Nahum; 

  /////Allen_Magude
  real<lower=0, upper=1> pred_treated_I_quint_SP_Allen_Magude[N_Allen_Magude];     
  real<lower=0, upper=1> pred_treated_uninf_SP_Allen_Magude[N_Allen_Magude];   
  real<lower=0, upper=1> pred_treated_I_quint_new_SP_Allen_Magude[N_Allen_Magude]; 
  real<lower=0, upper=1> p_protect_quint_SP_Allen_Magude[N_Allen_Magude];  
  real<lower=0, upper=1> pred_treated_I_tripl_SP_Allen_Magude[N_Allen_Magude];     
  real<lower=0, upper=1> pred_treated_I_tripl_new_SP_Allen_Magude[N_Allen_Magude];
  real<lower=0, upper=1> p_protect_tripl_SP_Allen_Magude[N_Allen_Magude]; 
  real<lower=0, upper=1> pred_treated_I_quint_SP_AS_Allen_Magude[N_Allen_Magude];   
  real<lower=0, upper=1> pred_treated_uninf_SP_AS_Allen_Magude[N_Allen_Magude]; 
  real<lower=0, upper=1> pred_treated_I_quint_new_SP_AS_Allen_Magude[N_Allen_Magude]; 
  real<lower=0, upper=1> p_protect_quint_SP_AS_Allen_Magude[N_Allen_Magude];  
  real<lower=0, upper=1> pred_treated_I_tripl_SP_AS_Allen_Magude[N_Allen_Magude];     
  real<lower=0, upper=1> pred_treated_I_tripl_new_SP_AS_Allen_Magude[N_Allen_Magude];
  real<lower=0, upper=1> p_protect_tripl_SP_AS_Allen_Magude[N_Allen_Magude]; 
  real <lower=0, upper=1> prob_inf_Allen_Magude; 

  /////Allen_Boane
  real<lower=0, upper=1> pred_treated_I_quint_SP_Allen_Boane[N_Allen_Boane];     
  real<lower=0, upper=1> pred_treated_uninf_SP_Allen_Boane[N_Allen_Boane];   
  real<lower=0, upper=1> pred_treated_I_quint_new_SP_Allen_Boane[N_Allen_Boane]; 
  real<lower=0, upper=1> p_protect_quint_SP_Allen_Boane[N_Allen_Boane];  
  real<lower=0, upper=1> pred_treated_I_tripl_SP_Allen_Boane[N_Allen_Boane];    
  real<lower=0, upper=1> pred_treated_I_tripl_new_SP_Allen_Boane[N_Allen_Boane];
  real<lower=0, upper=1> p_protect_tripl_SP_Allen_Boane[N_Allen_Boane]; 
  real<lower=0, upper=1> pred_treated_I_quint_SP_AS_Allen_Boane[N_Allen_Boane];   
  real<lower=0, upper=1> pred_treated_uninf_SP_AS_Allen_Boane[N_Allen_Boane];  
  real<lower=0, upper=1> pred_treated_I_quint_new_SP_AS_Allen_Boane[N_Allen_Boane]; 
  real<lower=0, upper=1> p_protect_quint_SP_AS_Allen_Boane[N_Allen_Boane]; 
  real<lower=0, upper=1> pred_treated_I_tripl_SP_AS_Allen_Boane[N_Allen_Boane];    
  real<lower=0, upper=1> pred_treated_I_tripl_new_SP_AS_Allen_Boane[N_Allen_Boane]; 
  real<lower=0, upper=1> p_protect_tripl_SP_AS_Allen_Boane[N_Allen_Boane]; 
  real <lower=0, upper=1> prob_inf_Allen_Boane; 

  /////Allen_Namaacha
  real<lower=0, upper=1> pred_treated_I_quint_SP_Allen_Namaacha[N_Allen_Namaacha];  
  real<lower=0, upper=1> pred_treated_uninf_SP_Allen_Namaacha[N_Allen_Namaacha]; 
  real<lower=0, upper=1> pred_treated_I_quint_new_SP_Allen_Namaacha[N_Allen_Namaacha]; 
  real<lower=0, upper=1> p_protect_quint_SP_Allen_Namaacha[N_Allen_Namaacha]; 
  real<lower=0, upper=1> pred_treated_I_tripl_SP_Allen_Namaacha[N_Allen_Namaacha];    
  real<lower=0, upper=1> pred_treated_I_tripl_new_SP_Allen_Namaacha[N_Allen_Namaacha];
  real<lower=0, upper=1> p_protect_tripl_SP_Allen_Namaacha[N_Allen_Namaacha]; 
  real<lower=0, upper=1> pred_treated_I_quint_SP_AS_Allen_Namaacha[N_Allen_Namaacha]; 
  real<lower=0, upper=1> pred_treated_uninf_SP_AS_Allen_Namaacha[N_Allen_Namaacha]; 
  real<lower=0, upper=1> pred_treated_I_quint_new_SP_AS_Allen_Namaacha[N_Allen_Namaacha]; 
  real<lower=0, upper=1> p_protect_quint_SP_AS_Allen_Namaacha[N_Allen_Namaacha];
  real<lower=0, upper=1> pred_treated_I_tripl_SP_AS_Allen_Namaacha[N_Allen_Namaacha];   
  real<lower=0, upper=1> pred_treated_I_tripl_new_SP_AS_Allen_Namaacha[N_Allen_Namaacha]; 
  real<lower=0, upper=1> p_protect_tripl_SP_AS_Allen_Namaacha[N_Allen_Namaacha]; 
  real <lower=0, upper=1> prob_inf_Allen_Namaacha; 

  /////Allen_Catuane
  real<lower=0, upper=1> pred_treated_I_quint_SP_Allen_Catuane[N_Allen_Catuane];
  real<lower=0, upper=1> pred_treated_uninf_SP_Allen_Catuane[N_Allen_Catuane]; 
  real<lower=0, upper=1> pred_treated_I_quint_new_SP_Allen_Catuane[N_Allen_Catuane]; 
  real<lower=0, upper=1> p_protect_quint_SP_Allen_Catuane[N_Allen_Catuane]; 
  real<lower=0, upper=1> pred_treated_I_tripl_SP_Allen_Catuane[N_Allen_Catuane];  
  real<lower=0, upper=1> pred_treated_I_tripl_new_SP_Allen_Catuane[N_Allen_Catuane];
  real<lower=0, upper=1> p_protect_tripl_SP_Allen_Catuane[N_Allen_Catuane]; 
  real<lower=0, upper=1> pred_treated_I_quint_SP_AS_Allen_Catuane[N_Allen_Catuane]; 
  real<lower=0, upper=1> pred_treated_uninf_SP_AS_Allen_Catuane[N_Allen_Catuane]; 
  real<lower=0, upper=1> pred_treated_I_quint_new_SP_AS_Allen_Catuane[N_Allen_Catuane]; 
  real<lower=0, upper=1> p_protect_quint_SP_AS_Allen_Catuane[N_Allen_Catuane];
  real<lower=0, upper=1> pred_treated_I_tripl_SP_AS_Allen_Catuane[N_Allen_Catuane];  
  real<lower=0, upper=1> pred_treated_I_tripl_new_SP_AS_Allen_Catuane[N_Allen_Catuane]; 
  real<lower=0, upper=1> p_protect_tripl_SP_AS_Allen_Catuane[N_Allen_Catuane];  
  real <lower=0, upper=1> prob_inf_Allen_Catuane;  

  ///RHXNJ
  real<lower=0, upper=1> pred_treated_I_quint_SP_RHXNJ[N_RHXNJ]; 
  real<lower=0, upper=1> pred_treated_uninf_SP_RHXNJ[N_RHXNJ]; 
  real<lower=0, upper=1> pred_treated_I_quint_new_SP_RHXNJ[N_RHXNJ];
  real<lower=0, upper=1> p_protect_quint_SP_RHXNJ[N_RHXNJ];  
  real<lower=0, upper=1> pred_treated_I_tripl_SP_RHXNJ[N_RHXNJ];  
  real<lower=0, upper=1> pred_treated_I_tripl_new_SP_RHXNJ[N_RHXNJ]; 
  real<lower=0, upper=1> p_protect_tripl_SP_RHXNJ[N_RHXNJ];
  real <lower=0, upper=1> prob_inf_RHXNJ; 

  ///RZENT
  real<lower=0, upper=1> pred_treated_I_quint_SP_RZENT[N_RZENT];   
  real<lower=0, upper=1> pred_treated_uninf_SP_RZENT[N_RZENT];   
  real<lower=0, upper=1> pred_treated_I_quint_new_SP_RZENT[N_RZENT];
  real<lower=0, upper=1> p_protect_quint_SP_RZENT[N_RZENT]; 
  real<lower=0, upper=1> pred_treated_I_tripl_SP_RZENT[N_RZENT];    
  real<lower=0, upper=1> pred_treated_I_tripl_new_SP_RZENT[N_RZENT]; 
  real<lower=0, upper=1> p_protect_tripl_SP_RZENT[N_RZENT];  
  real <lower=0, upper=1> prob_inf_RZENT;  

  ///NMMSB
  real<lower=0, upper=1> pred_treated_I_quint_SP_NMMSB[N_NMMSB];  
  real<lower=0, upper=1> pred_treated_uninf_SP_NMMSB[N_NMMSB]; 
  real<lower=0, upper=1> pred_treated_I_quint_new_SP_NMMSB[N_NMMSB]; 
  real<lower=0, upper=1> p_protect_quint_SP_NMMSB[N_NMMSB]; 
  real<lower=0, upper=1> pred_treated_I_tripl_SP_NMMSB[N_NMMSB];    
  real<lower=0, upper=1> pred_treated_I_tripl_new_SP_NMMSB[N_NMMSB]; 
  real<lower=0, upper=1> p_protect_tripl_SP_NMMSB[N_NMMSB];  
  real <lower=0, upper=1> prob_inf_NMMSB;  


 ///PEADD
  real<lower=0, upper=1> pred_treated_I_quint_SP_PEADD[N_PEADD];    
  real<lower=0, upper=1> pred_treated_uninf_SP_PEADD[N_PEADD];  
  real<lower=0, upper=1> pred_treated_I_quint_new_SP_PEADD[N_PEADD]; 
  real<lower=0, upper=1> p_protect_quint_SP_PEADD[N_PEADD];  
  real<lower=0, upper=1> pred_treated_I_tripl_SP_PEADD[N_PEADD];   
  real<lower=0, upper=1> pred_treated_I_tripl_new_SP_PEADD[N_PEADD]; 
  real<lower=0, upper=1> p_protect_tripl_SP_PEADD[N_PEADD]; 
  real <lower=0, upper=1> prob_inf_PEADD; 

   /////KZN
  real<lower=0, upper=1> pred_treated_I_quint_SP_KZN[N_KZN];     
  real<lower=0, upper=1> pred_treated_uninf_SP_KZN[N_KZN];  
  real<lower=0, upper=1> pred_treated_I_quint_new_SP_KZN[N_KZN];
  real<lower=0, upper=1> p_protect_quint_SP_KZN[N_KZN];  
  real <lower=0, upper=1> prob_inf_KZN; 


  //probability of infection at each time step in the absence of treatment (assumed to be constant during the study followup) 
  /// UNITS of inc_Bell (and so on) are in: "per person per year" 
  
  prob_inf_Bell=   1-exp(-(inc_Bell/365)*dt) ; 
  prob_inf_Gesase= 1-exp(-(inc_Gesase/365)*dt) ; 
  prob_inf_Nahum=  1-exp(-(inc_Nahum/365)*dt) ; 
  prob_inf_Allen_Magude=  1-exp(-(inc_Allen_Magude/365)*dt) ; 
  prob_inf_Allen_Boane=  1-exp(-(inc_Allen_Boane/365)*dt) ; 
  prob_inf_Allen_Namaacha=  1-exp(-(inc_Allen_Namaacha/365)*dt) ; 
  prob_inf_Allen_Catuane=  1-exp(-(inc_Allen_Catuane/365)*dt) ; 
  prob_inf_RHXNJ=  1-exp(-(inc_RHXNJ/365)*dt) ; 
  prob_inf_RZENT=  1-exp(-(inc_RZENT/365)*dt) ; 
  prob_inf_NMMSB=  1-exp(-(inc_NMMSB/365)*dt) ; 
  prob_inf_PEADD=  1-exp(-(inc_PEADD/365)*dt) ; 
  prob_inf_KZN=    1-exp(-(inc_KZN/365)*dt) ;  

// Bell
  // everyone is susceptible in the first time point
  pred_treated_uninf_SP_Bell[1]=1;
  pred_treated_uninf_SP_AS_Bell[1]=1;
  pred_treated_uninf_SP_CQ_Bell[1]=1;
  pred_treated_uninf_SP_AQ_Bell[1]=1;

  // nobody is infected in the first time point
  pred_treated_I_quint_SP_Bell[1]=0;
  pred_treated_I_quint_new_SP_Bell[1]=0;
  p_protect_quint_SP_Bell[1]=1;
  pred_treated_I_quint_SP_AS_Bell[1]=0;
  pred_treated_I_quint_new_SP_AS_Bell[1]=0;
  p_protect_quint_SP_AS_Bell[1]=1;
  pred_treated_I_quint_SP_CQ_Bell[1]=0;
  pred_treated_I_quint_new_SP_CQ_Bell[1]=0;
  p_protect_quint_SP_CQ_Bell[1]=1;
  pred_treated_I_quint_SP_AQ_Bell[1]=0;
  pred_treated_I_quint_new_SP_AQ_Bell[1]=0;
  p_protect_quint_SP_AQ_Bell[1]=1;

   time_Bell[1]=0;

  for(i in 2:N_Bell) {  /// loop through the time points

    time_Bell[i]=time_Bell[i-1]+dt;

    //protection against each strain, evaluated for each time step
    p_protect_quint_SP_Bell[i]= exp(-((time_Bell[i])/lambda_quint_SP)^w_quint_SP);   // probability of drug protection against genotype (here dhps GEA) following treatment with SP (this is independent of incidence)
    pred_treated_I_quint_new_SP_Bell[i]=  pred_treated_uninf_SP_Bell[i-1]*prob_inf_Bell*(1-p_protect_quint_SP_Bell[i]);     // proportion of new infections with genotype between time t and t-1
    pred_treated_I_quint_SP_Bell[i]= pred_treated_I_quint_SP_Bell[i-1]+ pred_treated_I_quint_new_SP_Bell[i];     // proportion of total cumulative infections with with genotype by time t
    pred_treated_uninf_SP_Bell[i]= pred_treated_uninf_SP_Bell[i-1] -pred_treated_I_quint_new_SP_Bell[i] ;      // proportion remaining uninfected (and still at risk) at time t.

    p_protect_quint_SP_AS_Bell[i]= exp(-((time_Bell[i])/lambda_quint_SP_AS)^w_quint_SP_AS);
    pred_treated_I_quint_new_SP_AS_Bell[i]=  pred_treated_uninf_SP_AS_Bell[i-1]*prob_inf_Bell*(1-p_protect_quint_SP_AS_Bell[i]);     
    pred_treated_I_quint_SP_AS_Bell[i]= pred_treated_I_quint_SP_AS_Bell[i-1]+ pred_treated_I_quint_new_SP_AS_Bell[i];    
    pred_treated_uninf_SP_AS_Bell[i]= pred_treated_uninf_SP_AS_Bell[i-1] -pred_treated_I_quint_new_SP_AS_Bell[i] ;

    p_protect_quint_SP_CQ_Bell[i]= exp(-((time_Bell[i])/lambda_quint_SP_CQ)^w_quint_SP_CQ);
    pred_treated_I_quint_new_SP_CQ_Bell[i]=  pred_treated_uninf_SP_CQ_Bell[i-1]*prob_inf_Bell*(1-p_protect_quint_SP_CQ_Bell[i]);     
    pred_treated_I_quint_SP_CQ_Bell[i]= pred_treated_I_quint_SP_CQ_Bell[i-1]+ pred_treated_I_quint_new_SP_CQ_Bell[i];     
    pred_treated_uninf_SP_CQ_Bell[i]= pred_treated_uninf_SP_CQ_Bell[i-1] -pred_treated_I_quint_new_SP_CQ_Bell[i] ;

    p_protect_quint_SP_AQ_Bell[i]= exp(-((time_Bell[i])/lambda_quint_SP_AQ)^w_quint_SP_AQ);
    pred_treated_I_quint_new_SP_AQ_Bell[i]=  pred_treated_uninf_SP_AQ_Bell[i-1]*prob_inf_Bell*(1-p_protect_quint_SP_AQ_Bell[i]);    
    pred_treated_I_quint_SP_AQ_Bell[i]= pred_treated_I_quint_SP_AQ_Bell[i-1]+ pred_treated_I_quint_new_SP_AQ_Bell[i];     
    pred_treated_uninf_SP_AQ_Bell[i]= pred_treated_uninf_SP_AQ_Bell[i-1] -pred_treated_I_quint_new_SP_AQ_Bell[i] ;

    }

//Gesase
 // everyone is susceptible in the first time point

  pred_treated_uninf_SP_Gesase[1]=1;

  // nobody is infected in the first time point

  pred_treated_I_quint_SP_Gesase[1]=0;
  pred_treated_I_sext_SP_Gesase[1]=0;
  pred_treated_I_quint_new_SP_Gesase[1]=0;
  pred_treated_I_sext_new_SP_Gesase[1]=0;
  pred_treated_I_undeterm_new_SP_Gesase[1]=0;
  pred_treated_I_undeterm_SP_Gesase[1]=0;
   p_protect_quint_SP_Gesase[1]=1;
   p_protect_sext_SP_Gesase[1]=1;

   time_Gesase[1]=0;

 for(i in 2:N_Gesase) {

    time_Gesase[i]=time_Gesase[i-1]+dt;

    //protection against each strain, evaluated for each time step
    p_protect_sext_SP_Gesase [i]= exp(-((time_Gesase[i])/lambda_sext_SP)^w_sext_SP);
    p_protect_quint_SP_Gesase [i]= exp(-((time_Gesase[i])/lambda_quint_SP)^w_quint_SP);

    pred_treated_I_sext_new_SP_Gesase[i]=  (pred_treated_uninf_SP_Gesase[i-1]*prob_inf_Gesase*(freq_sext_Gesase)*(1-p_protect_sext_SP_Gesase[i]))*prob_determ_Gesase;  // proportion of new infections with dhps GEG between time t and t-1
    pred_treated_I_quint_new_SP_Gesase[i]=  (pred_treated_uninf_SP_Gesase[i-1]*prob_inf_Gesase*(1-freq_sext_Gesase)*(1-p_protect_quint_SP_Gesase[i]))*prob_determ_Gesase;     // proportion of new infections with dhps GEA between time t and t-1
    pred_treated_I_undeterm_new_SP_Gesase[i]= ((pred_treated_uninf_SP_Gesase[i-1]*prob_inf_Gesase*(freq_sext_Gesase)*(1-p_protect_sext_SP_Gesase[i])) + (pred_treated_uninf_SP_Gesase[i-1]*prob_inf_Gesase*(1-freq_sext_Gesase)*(1-p_protect_quint_SP_Gesase[i])))*(1-prob_determ_Gesase);  // proportion of new infections with an undetermined dhps genotype between time t and t-1

    pred_treated_I_sext_SP_Gesase[i]= pred_treated_I_sext_SP_Gesase[i-1]+ pred_treated_I_sext_new_SP_Gesase[i];  // proportion of total cumulative infections with dhps GEG  by time t
    pred_treated_I_quint_SP_Gesase[i]= pred_treated_I_quint_SP_Gesase[i-1]+ pred_treated_I_quint_new_SP_Gesase[i];     // proportion of total cumulative infections with dhps GEA  by time t
    pred_treated_uninf_SP_Gesase[i]=pred_treated_uninf_SP_Gesase[i-1] -  pred_treated_I_sext_new_SP_Gesase[i] - pred_treated_I_quint_new_SP_Gesase[i] - pred_treated_I_undeterm_new_SP_Gesase[i] ; // proportion without an infection by time t

    pred_treated_I_undeterm_SP_Gesase[i]=pred_treated_I_undeterm_SP_Gesase[i-1] + pred_treated_I_undeterm_new_SP_Gesase[i];  // proportion of total cumulative infections with undetermined dhps genotype  by time t
    }

//Nahum
  // everyone is susceptible in the first time point

  pred_treated_uninf_SP_Nahum[1]=1;
  pred_treated_uninf_SP_AS_Nahum[1]=1;
  pred_treated_uninf_CQ_Nahum[1]=1;

  // nobody is infected in the first time point

  pred_treated_I_quadr_SP_Nahum[1]=0;
  pred_treated_I_quadr_new_SP_Nahum[1]=0;
  p_protect_quadr_SP_Nahum[1]=1;

  pred_treated_I_quadr_SP_AS_Nahum[1]=0;
  pred_treated_I_quadr_new_SP_AS_Nahum[1]=0;
  p_protect_quadr_SP_AS_Nahum[1]=1;

  pred_treated_I_quadr_CQ_Nahum[1]=0;
  pred_treated_I_quadr_new_CQ_Nahum[1]=0;
  p_protect_quadr_CQ_Nahum[1]=1;

   time_Nahum[1]=0;

  for(i in 2:N_Nahum) {

    time_Nahum[i]=time_Nahum[i-1]+dt;

    //protection against each strain, evaluated for each time step
    p_protect_quadr_SP_Nahum[i]= exp(-((time_Nahum[i])/lambda_quadr_SP)^w_quadr_SP);
    pred_treated_I_quadr_new_SP_Nahum[i]=  pred_treated_uninf_SP_Nahum[i-1]*prob_inf_Nahum*(1-p_protect_quadr_SP_Nahum[i]);     
    pred_treated_I_quadr_SP_Nahum[i]= pred_treated_I_quadr_SP_Nahum[i-1]+ pred_treated_I_quadr_new_SP_Nahum[i];   
    pred_treated_uninf_SP_Nahum[i]= pred_treated_uninf_SP_Nahum[i-1] -pred_treated_I_quadr_new_SP_Nahum[i] ;

    p_protect_quadr_SP_AS_Nahum[i]= exp(-((time_Nahum[i])/lambda_quadr_SP_AS)^w_quadr_SP_AS);
    pred_treated_I_quadr_new_SP_AS_Nahum[i]=  pred_treated_uninf_SP_AS_Nahum[i-1]*prob_inf_Nahum*(1-p_protect_quadr_SP_AS_Nahum[i]);    
    pred_treated_I_quadr_SP_AS_Nahum[i]= pred_treated_I_quadr_SP_AS_Nahum[i-1]+ pred_treated_I_quadr_new_SP_AS_Nahum[i];  
    pred_treated_uninf_SP_AS_Nahum[i]= pred_treated_uninf_SP_AS_Nahum[i-1] -pred_treated_I_quadr_new_SP_AS_Nahum[i] ;

    p_protect_quadr_CQ_Nahum[i]= exp(-((time_Nahum[i])/lambda_quadr_CQ)^w_quadr_CQ);
    pred_treated_I_quadr_new_CQ_Nahum[i]=  pred_treated_uninf_CQ_Nahum[i-1]*prob_inf_Nahum*(1-p_protect_quadr_CQ_Nahum[i]);  
    pred_treated_I_quadr_CQ_Nahum[i]= pred_treated_I_quadr_CQ_Nahum[i-1]+ pred_treated_I_quadr_new_CQ_Nahum[i];   
    pred_treated_uninf_CQ_Nahum[i]= pred_treated_uninf_CQ_Nahum[i-1] -pred_treated_I_quadr_new_CQ_Nahum[i] ;
    }


   //////Allen_Magude
   // everyone is susceptible in the first time point

pred_treated_uninf_SP_Allen_Magude[1]=1;
pred_treated_uninf_SP_AS_Allen_Magude[1]=1;


// nobody is infected in the first time point
pred_treated_I_quint_SP_Allen_Magude[1]=0;
pred_treated_I_quint_new_SP_Allen_Magude[1]=0;
p_protect_quint_SP_Allen_Magude[1]=1;
pred_treated_I_quint_SP_AS_Allen_Magude[1]=0;
pred_treated_I_quint_new_SP_AS_Allen_Magude[1]=0;
p_protect_quint_SP_AS_Allen_Magude[1]=1;
pred_treated_I_tripl_SP_Allen_Magude[1]=0;
pred_treated_I_tripl_new_SP_Allen_Magude[1]=0;
p_protect_tripl_SP_Allen_Magude[1]=1;
pred_treated_I_tripl_SP_AS_Allen_Magude[1]=0;
pred_treated_I_tripl_new_SP_AS_Allen_Magude[1]=0;
p_protect_tripl_SP_AS_Allen_Magude[1]=1;

 time_Allen_Magude[1]=0;

for(i in 2:N_Allen_Magude) {

  time_Allen_Magude[i]=time_Allen_Magude[i-1]+dt;

  //protection against each strain, evaluated for each time step
  p_protect_quint_SP_Allen_Magude[i]= exp(-((time_Allen_Magude[i])/lambda_quint_SP)^w_quint_SP);
  p_protect_tripl_SP_Allen_Magude[i]= exp(-((time_Allen_Magude[i])/lambda_tripl_SP)^w_tripl_SP);

  pred_treated_I_quint_new_SP_Allen_Magude[i]=  pred_treated_uninf_SP_Allen_Magude[i-1]*(freq_quint_Allen_Magude)*prob_inf_Allen_Magude*(1-p_protect_quint_SP_Allen_Magude[i]);    
  pred_treated_I_tripl_new_SP_Allen_Magude[i]=  pred_treated_uninf_SP_Allen_Magude[i-1]*(1-freq_quint_Allen_Magude)*prob_inf_Allen_Magude*(1-p_protect_tripl_SP_Allen_Magude[i]);

  pred_treated_I_quint_SP_Allen_Magude[i]= pred_treated_I_quint_SP_Allen_Magude[i-1]+ pred_treated_I_quint_new_SP_Allen_Magude[i];    
  pred_treated_I_tripl_SP_Allen_Magude[i]= pred_treated_I_tripl_SP_Allen_Magude[i-1]+ pred_treated_I_tripl_new_SP_Allen_Magude[i];    

  pred_treated_uninf_SP_Allen_Magude[i]= pred_treated_uninf_SP_Allen_Magude[i-1] -pred_treated_I_quint_new_SP_Allen_Magude[i] - pred_treated_I_tripl_new_SP_Allen_Magude[i];

   //protection against each strain, evaluated for each time step
  p_protect_quint_SP_AS_Allen_Magude[i]= exp(-((time_Allen_Magude[i])/lambda_quint_SP_AS)^w_quint_SP_AS);
  p_protect_tripl_SP_AS_Allen_Magude[i]= exp(-((time_Allen_Magude[i])/lambda_tripl_SP_AS)^w_tripl_SP_AS);

  pred_treated_I_quint_new_SP_AS_Allen_Magude[i]=  pred_treated_uninf_SP_AS_Allen_Magude[i-1]*(freq_quint_Allen_Magude)*prob_inf_Allen_Magude*(1-p_protect_quint_SP_AS_Allen_Magude[i]);     
  pred_treated_I_tripl_new_SP_AS_Allen_Magude[i]=  pred_treated_uninf_SP_AS_Allen_Magude[i-1]*(1-freq_quint_Allen_Magude)*prob_inf_Allen_Magude*(1-p_protect_tripl_SP_AS_Allen_Magude[i]);

  pred_treated_I_quint_SP_AS_Allen_Magude[i]= pred_treated_I_quint_SP_AS_Allen_Magude[i-1]+ pred_treated_I_quint_new_SP_AS_Allen_Magude[i];    
  pred_treated_I_tripl_SP_AS_Allen_Magude[i]= pred_treated_I_tripl_SP_AS_Allen_Magude[i-1]+ pred_treated_I_tripl_new_SP_AS_Allen_Magude[i];    

  pred_treated_uninf_SP_AS_Allen_Magude[i]= pred_treated_uninf_SP_AS_Allen_Magude[i-1] -pred_treated_I_quint_new_SP_AS_Allen_Magude[i] - pred_treated_I_tripl_new_SP_AS_Allen_Magude[i];
  }

    //////Allen_Boane
    // everyone is susceptible in the first time point

 pred_treated_uninf_SP_Allen_Boane[1]=1;
 pred_treated_uninf_SP_AS_Allen_Boane[1]=1;

 // nobody is infected in the first time point
 pred_treated_I_quint_SP_Allen_Boane[1]=0;
 pred_treated_I_quint_new_SP_Allen_Boane[1]=0;
 p_protect_quint_SP_Allen_Boane[1]=1;
 pred_treated_I_quint_SP_AS_Allen_Boane[1]=0;
 pred_treated_I_quint_new_SP_AS_Allen_Boane[1]=0;
 p_protect_quint_SP_AS_Allen_Boane[1]=1;
 pred_treated_I_tripl_SP_Allen_Boane[1]=0;
 pred_treated_I_tripl_new_SP_Allen_Boane[1]=0;
 p_protect_tripl_SP_Allen_Boane[1]=1;
 pred_treated_I_tripl_SP_AS_Allen_Boane[1]=0;
 pred_treated_I_tripl_new_SP_AS_Allen_Boane[1]=0;
 p_protect_tripl_SP_AS_Allen_Boane[1]=1;

  time_Allen_Boane[1]=0;

 for(i in 2:N_Allen_Boane) {

   time_Allen_Boane[i]=time_Allen_Boane[i-1]+dt;

   //protection against each strain, evaluated for each time step
   p_protect_quint_SP_Allen_Boane[i]= exp(-((time_Allen_Boane[i])/lambda_quint_SP)^w_quint_SP);
   p_protect_tripl_SP_Allen_Boane[i]= exp(-((time_Allen_Boane[i])/lambda_tripl_SP)^w_tripl_SP);

   pred_treated_I_quint_new_SP_Allen_Boane[i]=  pred_treated_uninf_SP_Allen_Boane[i-1]*(freq_quint_Allen_Boane)*prob_inf_Allen_Boane*(1-p_protect_quint_SP_Allen_Boane[i]);     
   pred_treated_I_tripl_new_SP_Allen_Boane[i]=  pred_treated_uninf_SP_Allen_Boane[i-1]*(1-freq_quint_Allen_Boane)*prob_inf_Allen_Boane*(1-p_protect_tripl_SP_Allen_Boane[i]);

   pred_treated_I_quint_SP_Allen_Boane[i]= pred_treated_I_quint_SP_Allen_Boane[i-1]+ pred_treated_I_quint_new_SP_Allen_Boane[i];     
   pred_treated_I_tripl_SP_Allen_Boane[i]= pred_treated_I_tripl_SP_Allen_Boane[i-1]+ pred_treated_I_tripl_new_SP_Allen_Boane[i];  

   pred_treated_uninf_SP_Allen_Boane[i]= pred_treated_uninf_SP_Allen_Boane[i-1] -pred_treated_I_quint_new_SP_Allen_Boane[i] - pred_treated_I_tripl_new_SP_Allen_Boane[i];

    //protection against each strain, evaluated for each time step
   p_protect_quint_SP_AS_Allen_Boane[i]= exp(-((time_Allen_Boane[i])/lambda_quint_SP_AS)^w_quint_SP_AS);
   p_protect_tripl_SP_AS_Allen_Boane[i]= exp(-((time_Allen_Boane[i])/lambda_tripl_SP_AS)^w_tripl_SP_AS);

   pred_treated_I_quint_new_SP_AS_Allen_Boane[i]=  pred_treated_uninf_SP_AS_Allen_Boane[i-1]*(freq_quint_Allen_Boane)*prob_inf_Allen_Boane*(1-p_protect_quint_SP_AS_Allen_Boane[i]);     
   pred_treated_I_tripl_new_SP_AS_Allen_Boane[i]=  pred_treated_uninf_SP_AS_Allen_Boane[i-1]*(1-freq_quint_Allen_Boane)*prob_inf_Allen_Boane*(1-p_protect_tripl_SP_AS_Allen_Boane[i]);

   pred_treated_I_quint_SP_AS_Allen_Boane[i]= pred_treated_I_quint_SP_AS_Allen_Boane[i-1]+ pred_treated_I_quint_new_SP_AS_Allen_Boane[i];   
   pred_treated_I_tripl_SP_AS_Allen_Boane[i]= pred_treated_I_tripl_SP_AS_Allen_Boane[i-1]+ pred_treated_I_tripl_new_SP_AS_Allen_Boane[i];   

   pred_treated_uninf_SP_AS_Allen_Boane[i]= pred_treated_uninf_SP_AS_Allen_Boane[i-1] -pred_treated_I_quint_new_SP_AS_Allen_Boane[i] - pred_treated_I_tripl_new_SP_AS_Allen_Boane[i];
   }

    //////Allen_Namaacha
    // everyone is susceptible in the first time point

 pred_treated_uninf_SP_Allen_Namaacha[1]=1;
 pred_treated_uninf_SP_AS_Allen_Namaacha[1]=1;

 // nobody is infected in the first time point

 pred_treated_I_quint_SP_Allen_Namaacha[1]=0;
 pred_treated_I_quint_new_SP_Allen_Namaacha[1]=0;
 p_protect_quint_SP_Allen_Namaacha[1]=1;

 pred_treated_I_quint_SP_AS_Allen_Namaacha[1]=0;
 pred_treated_I_quint_new_SP_AS_Allen_Namaacha[1]=0;
 p_protect_quint_SP_AS_Allen_Namaacha[1]=1;

 pred_treated_I_tripl_SP_Allen_Namaacha[1]=0;
 pred_treated_I_tripl_new_SP_Allen_Namaacha[1]=0;
 p_protect_tripl_SP_Allen_Namaacha[1]=1;

 pred_treated_I_tripl_SP_AS_Allen_Namaacha[1]=0;
 pred_treated_I_tripl_new_SP_AS_Allen_Namaacha[1]=0;
 p_protect_tripl_SP_AS_Allen_Namaacha[1]=1;

  time_Allen_Namaacha[1]=0;

 for(i in 2:N_Allen_Namaacha) {
   time_Allen_Namaacha[i]=time_Allen_Namaacha[i-1]+dt;

   //protection against each strain, evaluated for each time step
   p_protect_quint_SP_Allen_Namaacha[i]= exp(-((time_Allen_Namaacha[i])/lambda_quint_SP)^w_quint_SP);
   p_protect_tripl_SP_Allen_Namaacha[i]= exp(-((time_Allen_Namaacha[i])/lambda_tripl_SP)^w_tripl_SP);

   pred_treated_I_quint_new_SP_Allen_Namaacha[i]=  pred_treated_uninf_SP_Allen_Namaacha[i-1]*(freq_quint_Allen_Namaacha)*prob_inf_Allen_Namaacha*(1-p_protect_quint_SP_Allen_Namaacha[i]);   
   pred_treated_I_tripl_new_SP_Allen_Namaacha[i]=  pred_treated_uninf_SP_Allen_Namaacha[i-1]*(1-freq_quint_Allen_Namaacha)*prob_inf_Allen_Namaacha*(1-p_protect_tripl_SP_Allen_Namaacha[i]);

   pred_treated_I_quint_SP_Allen_Namaacha[i]= pred_treated_I_quint_SP_Allen_Namaacha[i-1]+ pred_treated_I_quint_new_SP_Allen_Namaacha[i];    
   pred_treated_I_tripl_SP_Allen_Namaacha[i]= pred_treated_I_tripl_SP_Allen_Namaacha[i-1]+ pred_treated_I_tripl_new_SP_Allen_Namaacha[i];   

   pred_treated_uninf_SP_Allen_Namaacha[i]= pred_treated_uninf_SP_Allen_Namaacha[i-1] -pred_treated_I_quint_new_SP_Allen_Namaacha[i] - pred_treated_I_tripl_new_SP_Allen_Namaacha[i];

    //protection against each strain, evaluated for each time step
   p_protect_quint_SP_AS_Allen_Namaacha[i]= exp(-((time_Allen_Namaacha[i])/lambda_quint_SP_AS)^w_quint_SP_AS);
   p_protect_tripl_SP_AS_Allen_Namaacha[i]= exp(-((time_Allen_Namaacha[i])/lambda_tripl_SP_AS)^w_tripl_SP_AS);

   pred_treated_I_quint_new_SP_AS_Allen_Namaacha[i]=  pred_treated_uninf_SP_AS_Allen_Namaacha[i-1]*(freq_quint_Allen_Namaacha)*prob_inf_Allen_Namaacha*(1-p_protect_quint_SP_AS_Allen_Namaacha[i]);   
   pred_treated_I_tripl_new_SP_AS_Allen_Namaacha[i]=  pred_treated_uninf_SP_AS_Allen_Namaacha[i-1]*(1-freq_quint_Allen_Namaacha)*prob_inf_Allen_Namaacha*(1-p_protect_tripl_SP_AS_Allen_Namaacha[i]);

   pred_treated_I_quint_SP_AS_Allen_Namaacha[i]= pred_treated_I_quint_SP_AS_Allen_Namaacha[i-1]+ pred_treated_I_quint_new_SP_AS_Allen_Namaacha[i];     
   pred_treated_I_tripl_SP_AS_Allen_Namaacha[i]= pred_treated_I_tripl_SP_AS_Allen_Namaacha[i-1]+ pred_treated_I_tripl_new_SP_AS_Allen_Namaacha[i];    

   pred_treated_uninf_SP_AS_Allen_Namaacha[i]= pred_treated_uninf_SP_AS_Allen_Namaacha[i-1] -pred_treated_I_quint_new_SP_AS_Allen_Namaacha[i] - pred_treated_I_tripl_new_SP_AS_Allen_Namaacha[i];
   }

    //////Allen_Catuane
    // everyone is susceptible in the first time point

 pred_treated_uninf_SP_Allen_Catuane[1]=1;
 pred_treated_uninf_SP_AS_Allen_Catuane[1]=1;

 // nobody is infected in the first time point

 pred_treated_I_quint_SP_Allen_Catuane[1]=0;
 pred_treated_I_quint_new_SP_Allen_Catuane[1]=0;
 p_protect_quint_SP_Allen_Catuane[1]=1;

 pred_treated_I_quint_SP_AS_Allen_Catuane[1]=0;
 pred_treated_I_quint_new_SP_AS_Allen_Catuane[1]=0;
 p_protect_quint_SP_AS_Allen_Catuane[1]=1;

 pred_treated_I_tripl_SP_Allen_Catuane[1]=0;
 pred_treated_I_tripl_new_SP_Allen_Catuane[1]=0;
 p_protect_tripl_SP_Allen_Catuane[1]=1;

 pred_treated_I_tripl_SP_AS_Allen_Catuane[1]=0;
 pred_treated_I_tripl_new_SP_AS_Allen_Catuane[1]=0;
 p_protect_tripl_SP_AS_Allen_Catuane[1]=1;

  time_Allen_Catuane[1]=0;

 for(i in 2:N_Allen_Catuane) {

   time_Allen_Catuane[i]=time_Allen_Catuane[i-1]+dt;

   //protection against each strain, evaluated for each time step
   p_protect_quint_SP_Allen_Catuane[i]= exp(-((time_Allen_Catuane[i])/lambda_quint_SP)^w_quint_SP);
   p_protect_tripl_SP_Allen_Catuane[i]= exp(-((time_Allen_Catuane[i])/lambda_tripl_SP)^w_tripl_SP);

   pred_treated_I_quint_new_SP_Allen_Catuane[i]=  pred_treated_uninf_SP_Allen_Catuane[i-1]*(freq_quint_Allen_Catuane)*prob_inf_Allen_Catuane*(1-p_protect_quint_SP_Allen_Catuane[i]);     
   pred_treated_I_tripl_new_SP_Allen_Catuane[i]=  pred_treated_uninf_SP_Allen_Catuane[i-1]*(1-freq_quint_Allen_Catuane)*prob_inf_Allen_Catuane*(1-p_protect_tripl_SP_Allen_Catuane[i]);

   pred_treated_I_quint_SP_Allen_Catuane[i]= pred_treated_I_quint_SP_Allen_Catuane[i-1]+ pred_treated_I_quint_new_SP_Allen_Catuane[i];    
   pred_treated_I_tripl_SP_Allen_Catuane[i]= pred_treated_I_tripl_SP_Allen_Catuane[i-1]+ pred_treated_I_tripl_new_SP_Allen_Catuane[i];    

   pred_treated_uninf_SP_Allen_Catuane[i]= pred_treated_uninf_SP_Allen_Catuane[i-1] -pred_treated_I_quint_new_SP_Allen_Catuane[i] - pred_treated_I_tripl_new_SP_Allen_Catuane[i];

    //protection against each strain, evaluated for each time step
   p_protect_quint_SP_AS_Allen_Catuane[i]= exp(-((time_Allen_Catuane[i])/lambda_quint_SP_AS)^w_quint_SP_AS);
   p_protect_tripl_SP_AS_Allen_Catuane[i]= exp(-((time_Allen_Catuane[i])/lambda_tripl_SP_AS)^w_tripl_SP_AS);

   pred_treated_I_quint_new_SP_AS_Allen_Catuane[i]=  pred_treated_uninf_SP_AS_Allen_Catuane[i-1]*(freq_quint_Allen_Catuane)*prob_inf_Allen_Catuane*(1-p_protect_quint_SP_AS_Allen_Catuane[i]);    
   pred_treated_I_tripl_new_SP_AS_Allen_Catuane[i]=  pred_treated_uninf_SP_AS_Allen_Catuane[i-1]*(1-freq_quint_Allen_Catuane)*prob_inf_Allen_Catuane*(1-p_protect_tripl_SP_AS_Allen_Catuane[i]);

   pred_treated_I_quint_SP_AS_Allen_Catuane[i]= pred_treated_I_quint_SP_AS_Allen_Catuane[i-1]+ pred_treated_I_quint_new_SP_AS_Allen_Catuane[i];    
   pred_treated_I_tripl_SP_AS_Allen_Catuane[i]= pred_treated_I_tripl_SP_AS_Allen_Catuane[i-1]+ pred_treated_I_tripl_new_SP_AS_Allen_Catuane[i];    

   pred_treated_uninf_SP_AS_Allen_Catuane[i]= pred_treated_uninf_SP_AS_Allen_Catuane[i-1] -pred_treated_I_quint_new_SP_AS_Allen_Catuane[i] - pred_treated_I_tripl_new_SP_AS_Allen_Catuane[i];

   }

//RHXNJ
  // everyone is susceptible in the first time point

  pred_treated_uninf_SP_RHXNJ[1]=1;

  // nobody is infected in the first time point

  pred_treated_I_quint_SP_RHXNJ[1]=0;
  pred_treated_I_quint_new_SP_RHXNJ[1]=0;
  p_protect_quint_SP_RHXNJ[1]=1;

  pred_treated_I_tripl_SP_RHXNJ[1]=0;
  pred_treated_I_tripl_new_SP_RHXNJ[1]=0;
  p_protect_tripl_SP_RHXNJ[1]=1;

   time_RHXNJ[1]=0;

  for(i in 2:N_RHXNJ) {
    time_RHXNJ[i]=time_RHXNJ[i-1]+dt;
    p_protect_quint_SP_RHXNJ[i]= exp(-((time_RHXNJ[i])/lambda_quint_SP)^w_quint_SP);
    p_protect_tripl_SP_RHXNJ[i]= exp(-((time_RHXNJ[i])/lambda_tripl_SP)^w_tripl_SP);
    pred_treated_I_quint_new_SP_RHXNJ[i]=  pred_treated_uninf_SP_RHXNJ[i-1]*(freq_quint_RHXNJ)*prob_inf_RHXNJ*(1-p_protect_quint_SP_RHXNJ[i]);   
    pred_treated_I_tripl_new_SP_RHXNJ[i]=  pred_treated_uninf_SP_RHXNJ[i-1]*(1-freq_quint_RHXNJ)*prob_inf_RHXNJ*(1-p_protect_tripl_SP_RHXNJ[i]);
    pred_treated_I_quint_SP_RHXNJ[i]= pred_treated_I_quint_SP_RHXNJ[i-1]+ pred_treated_I_quint_new_SP_RHXNJ[i];    
    pred_treated_I_tripl_SP_RHXNJ[i]= pred_treated_I_tripl_SP_RHXNJ[i-1]+ pred_treated_I_tripl_new_SP_RHXNJ[i];    
    pred_treated_uninf_SP_RHXNJ[i]= pred_treated_uninf_SP_RHXNJ[i-1] -pred_treated_I_quint_new_SP_RHXNJ[i] - pred_treated_I_tripl_new_SP_RHXNJ[i];

    }

       // everyone is susceptible in the first time point
  pred_treated_uninf_SP_RZENT[1]=1;
  // nobody is infected in the first time point
  pred_treated_I_quint_SP_RZENT[1]=0;
  pred_treated_I_quint_new_SP_RZENT[1]=0;
  p_protect_quint_SP_RZENT[1]=1;
  pred_treated_I_tripl_SP_RZENT[1]=0;
  pred_treated_I_tripl_new_SP_RZENT[1]=0;
  p_protect_tripl_SP_RZENT[1]=1;
   time_RZENT[1]=0;

  for(i in 2:N_RZENT) {

    time_RZENT[i]=time_RZENT[i-1]+dt;
    p_protect_quint_SP_RZENT[i]= exp(-((time_RZENT[i])/lambda_quint_SP)^w_quint_SP);
    p_protect_tripl_SP_RZENT[i]= exp(-((time_RZENT[i])/lambda_tripl_SP)^w_tripl_SP);
    pred_treated_I_quint_new_SP_RZENT[i]=  pred_treated_uninf_SP_RZENT[i-1]*(freq_quint_RZENT)*prob_inf_RZENT*(1-p_protect_quint_SP_RZENT[i]); 
    pred_treated_I_tripl_new_SP_RZENT[i]=  pred_treated_uninf_SP_RZENT[i-1]*(1-freq_quint_RZENT)*prob_inf_RZENT*(1-p_protect_tripl_SP_RZENT[i]);
    pred_treated_I_quint_SP_RZENT[i]= pred_treated_I_quint_SP_RZENT[i-1]+ pred_treated_I_quint_new_SP_RZENT[i];   
    pred_treated_I_tripl_SP_RZENT[i]= pred_treated_I_tripl_SP_RZENT[i-1]+ pred_treated_I_tripl_new_SP_RZENT[i];     
    pred_treated_uninf_SP_RZENT[i]= pred_treated_uninf_SP_RZENT[i-1] -pred_treated_I_quint_new_SP_RZENT[i] - pred_treated_I_tripl_new_SP_RZENT[i];
    }

//NMMSB
      // everyone is susceptible in the first time point
  pred_treated_uninf_SP_NMMSB[1]=1;
  // nobody is infected in the first time point
  pred_treated_I_quint_SP_NMMSB[1]=0;
  pred_treated_I_quint_new_SP_NMMSB[1]=0;
  p_protect_quint_SP_NMMSB[1]=1;
  pred_treated_I_tripl_SP_NMMSB[1]=0;
  pred_treated_I_tripl_new_SP_NMMSB[1]=0;
  p_protect_tripl_SP_NMMSB[1]=1;
   time_NMMSB[1]=0;

  for(i in 2:N_NMMSB) {

    time_NMMSB[i]=time_NMMSB[i-1]+dt;
    p_protect_quint_SP_NMMSB[i]= exp(-((time_NMMSB[i])/lambda_quint_SP)^w_quint_SP);
    p_protect_tripl_SP_NMMSB[i]= exp(-((time_NMMSB[i])/lambda_tripl_SP)^w_tripl_SP);
    pred_treated_I_quint_new_SP_NMMSB[i]=  pred_treated_uninf_SP_NMMSB[i-1]*(freq_quint_NMMSB)*prob_inf_NMMSB*(1-p_protect_quint_SP_NMMSB[i]);     
    pred_treated_I_tripl_new_SP_NMMSB[i]=  pred_treated_uninf_SP_NMMSB[i-1]*(1-freq_quint_NMMSB)*prob_inf_NMMSB*(1-p_protect_tripl_SP_NMMSB[i]);
    pred_treated_I_quint_SP_NMMSB[i]= pred_treated_I_quint_SP_NMMSB[i-1]+ pred_treated_I_quint_new_SP_NMMSB[i];   
    pred_treated_I_tripl_SP_NMMSB[i]= pred_treated_I_tripl_SP_NMMSB[i-1]+ pred_treated_I_tripl_new_SP_NMMSB[i];     
    pred_treated_uninf_SP_NMMSB[i]= pred_treated_uninf_SP_NMMSB[i-1] -pred_treated_I_quint_new_SP_NMMSB[i] - pred_treated_I_tripl_new_SP_NMMSB[i];
    }

//PEADD
   // everyone is susceptible in the first time point
  pred_treated_uninf_SP_PEADD[1]=1;
  // nobody is infected in the first time point
  pred_treated_I_quint_SP_PEADD[1]=0;
  pred_treated_I_quint_new_SP_PEADD[1]=0;
  p_protect_quint_SP_PEADD[1]=1;
  pred_treated_I_tripl_SP_PEADD[1]=0;
  pred_treated_I_tripl_new_SP_PEADD[1]=0;
  p_protect_tripl_SP_PEADD[1]=1;
   time_PEADD[1]=0;

  for(i in 2:N_PEADD) {
    time_PEADD[i]=time_PEADD[i-1]+dt;
    p_protect_quint_SP_PEADD[i]= exp(-((time_PEADD[i])/lambda_quint_SP)^w_quint_SP);
    p_protect_tripl_SP_PEADD[i]= exp(-((time_PEADD[i])/lambda_tripl_SP)^w_tripl_SP);
    pred_treated_I_quint_new_SP_PEADD[i]=  pred_treated_uninf_SP_PEADD[i-1]*(freq_quint_PEADD)*prob_inf_PEADD*(1-p_protect_quint_SP_PEADD[i]);    
    pred_treated_I_tripl_new_SP_PEADD[i]=  pred_treated_uninf_SP_PEADD[i-1]*(1-freq_quint_PEADD)*prob_inf_PEADD*(1-p_protect_tripl_SP_PEADD[i]);
    pred_treated_I_quint_SP_PEADD[i]= pred_treated_I_quint_SP_PEADD[i-1]+ pred_treated_I_quint_new_SP_PEADD[i];   
    pred_treated_I_tripl_SP_PEADD[i]= pred_treated_I_tripl_SP_PEADD[i-1]+ pred_treated_I_tripl_new_SP_PEADD[i];  
    pred_treated_uninf_SP_PEADD[i]= pred_treated_uninf_SP_PEADD[i-1] -pred_treated_I_quint_new_SP_PEADD[i] - pred_treated_I_tripl_new_SP_PEADD[i];
    }

////KZN
  // everyone is susceptible in the first time point
  pred_treated_uninf_SP_KZN[1]=1;
  // nobody is infected in the first time point
  pred_treated_I_quint_SP_KZN[1]=0;
  pred_treated_I_quint_new_SP_KZN[1]=0;
  p_protect_quint_SP_KZN[1]=1;

   time_KZN[1]=0;

  for(i in 2:N_KZN) {
    time_KZN[i]=time_KZN[i-1]+dt;
    p_protect_quint_SP_KZN[i]= exp(-((time_KZN[i])/lambda_quint_SP)^w_quint_SP);
    pred_treated_I_quint_new_SP_KZN[i]=  pred_treated_uninf_SP_KZN[i-1]*prob_inf_KZN*(1-p_protect_quint_SP_KZN[i]);    
    pred_treated_I_quint_SP_KZN[i]= pred_treated_I_quint_SP_KZN[i-1]+ pred_treated_I_quint_new_SP_KZN[i];   
    pred_treated_uninf_SP_KZN[i]= pred_treated_uninf_SP_KZN[i-1] -pred_treated_I_quint_new_SP_KZN[i] ;
    }

}


// The model to be estimated. 

model{ 
  
  // intermediate variables for computing probability of infection between this time point and the previous one in each row of data.
  
matrix[(N_obs_Bell-1),2] probabilities_multi_SP_Bell;  //  rows=number of time points, columns=number of outcomes ( for Bell study: number of new infections with dhps GEA and number remaining uninfected, so 2 outcomes)
matrix[(N_obs_Bell-1),2] probabilities_multi_SP_AS_Bell;  
matrix[(N_obs_Bell-1),2] probabilities_multi_SP_CQ_Bell;  
matrix[(N_obs_Bell-1),2] probabilities_multi_SP_AQ_Bell; 

matrix[(N_obs_Gesase-1),4] probabilities_multi_SP_Gesase; //  rows=number of time points, columns=number of outcomes ( for Gesase study: number of new infections with dhps GEA, with dhps GEG, with undetermined dhps genotype, and and number remaining uninfected, so 4 outcomes)

matrix[(N_obs_Nahum-1),2] probabilities_multi_SP_Nahum;
matrix[(N_obs_Nahum-1),2] probabilities_multi_SP_AS_Nahum;
matrix[(N_obs_Nahum-1),2] probabilities_multi_CQ_Nahum;

matrix[(N_obs_Allen_Magude-1),2] probabilities_multi_SP_Allen_Magude;
matrix[(N_obs_Allen_Magude-1),2] probabilities_multi_SP_AS_Allen_Magude;

matrix[(N_obs_Allen_Boane-1),2] probabilities_multi_SP_Allen_Boane;
matrix[(N_obs_Allen_Boane-1),2] probabilities_multi_SP_AS_Allen_Boane;

matrix[(N_obs_Allen_Namaacha-1),2] probabilities_multi_SP_Allen_Namaacha;
matrix[(N_obs_Allen_Namaacha-1),2] probabilities_multi_SP_AS_Allen_Namaacha;

matrix[(N_obs_Allen_Catuane-1),2] probabilities_multi_SP_Allen_Catuane;
matrix[(N_obs_Allen_Catuane-1),2] probabilities_multi_SP_AS_Allen_Catuane;

matrix[(N_obs_RHXNJ-1),2] probabilities_multi_SP_RHXNJ;

matrix[(N_obs_RZENT-1),2] probabilities_multi_SP_RZENT;

matrix[(N_obs_NMMSB-1),2] probabilities_multi_SP_NMMSB;

matrix[(N_obs_PEADD-1),2] probabilities_multi_SP_PEADD;

matrix[(N_obs_KZN-1),2] probabilities_multi_SP_KZN;

// 

///////////// use model block to declare priors &  likelihood 

//semi-informative incidence priors

inc_Bell    ~ gamma(4.80,0.98);
inc_Gesase   ~ gamma(30,1)  ;
inc_Nahum   ~ gamma(3.20 , 0.80);
inc_Allen_Magude    ~ gamma(60.55,3.48);
inc_Allen_Boane    ~ gamma(17.67,1.88);
inc_Allen_Namaacha    ~ gamma(0.72,0.38);
inc_Allen_Catuane    ~ gamma(0.10,0.14);
inc_RHXNJ    ~ gamma(0.72,0.038);
inc_RZENT    ~ gamma(44.40,2.98);
inc_NMMSB    ~ gamma(25.09,2.24);
inc_PEADD    ~ gamma(0.10,0.14);
inc_KZN    ~ gamma(0.10,0.14) ;

//relatively uniformative priors for protection parameters (constant for all genotypes and drugs)

lambda_tripl_SP ~ gamma(7,0.25); 
w_tripl_SP      ~ gamma(4,0.8);

lambda_tripl_SP_AS ~ gamma(7,0.25); 
w_tripl_SP_AS      ~ gamma(4,0.8);

lambda_quadr_SP ~  gamma(7,0.25); 
w_quadr_SP      ~ gamma(4,0.8);

lambda_quint_SP ~  gamma(7,0.25); 
w_quint_SP      ~ gamma(4,0.8);

lambda_sext_SP  ~  gamma(7,0.25); 
w_sext_SP ~ gamma(4,0.8);

lambda_quint_SP_AS ~ gamma(7,0.25); 
w_quint_SP_AS      ~ gamma(4,0.8);

lambda_quadr_SP_AS ~ gamma(7,0.25); 
w_quadr_SP_AS      ~ gamma(4,0.8);

lambda_quint_SP_CQ ~ gamma(7,0.25); 
w_quint_SP_CQ      ~ gamma(4,0.8);

lambda_quint_SP_AQ ~ gamma(7,0.25);  
w_quint_SP_AQ      ~ gamma(4,0.8);

lambda_quadr_CQ ~  gamma(7,0.25); 
w_quadr_CQ      ~ gamma(4,0.8);


///not specifying a prior for freq or prob_determ - assuming uninformative uniform(0,1)

  
// likelihood ---- 

for(j in 2:N_obs_Bell) { // loop over time points for each study

probabilities_multi_SP_Bell[j-1,1]=(pred_treated_I_quint_SP_Bell[row_model_Bell[j]]- pred_treated_I_quint_SP_Bell[row_model_Bell[j-1]])/pred_treated_uninf_SP_Bell[row_model_Bell[j-1]]; // modelled probability of first outcome (here probability of new infection with dhps GEA)
probabilities_multi_SP_Bell[j-1,2]= 1-probabilities_multi_SP_Bell[j-1,1]; // modelled probability of second outcome (here probability of remaining uninfected)

probabilities_multi_SP_AS_Bell[j-1,1]=(pred_treated_I_quint_SP_AS_Bell[row_model_Bell[j]]- pred_treated_I_quint_SP_AS_Bell[row_model_Bell[j-1]])/pred_treated_uninf_SP_AS_Bell[row_model_Bell[j-1]];
probabilities_multi_SP_AS_Bell[j-1,2]=1-probabilities_multi_SP_AS_Bell[j-1,1];

probabilities_multi_SP_CQ_Bell[j-1,1]=(pred_treated_I_quint_SP_CQ_Bell[row_model_Bell[j]]- pred_treated_I_quint_SP_CQ_Bell[row_model_Bell[j-1]])/pred_treated_uninf_SP_CQ_Bell[row_model_Bell[j-1]];
probabilities_multi_SP_CQ_Bell[j-1,2]=1-probabilities_multi_SP_CQ_Bell[j-1,1];

probabilities_multi_SP_AQ_Bell[j-1,1]=(pred_treated_I_quint_SP_AQ_Bell[row_model_Bell[j]]- pred_treated_I_quint_SP_AQ_Bell[row_model_Bell[j-1]])/pred_treated_uninf_SP_AQ_Bell[row_model_Bell[j-1]];
probabilities_multi_SP_AQ_Bell[j-1,2]=1-probabilities_multi_SP_AQ_Bell[j-1,1];

}

for (time_pt_Bell in 1:(N_obs_Bell-1)){

N_outcome_SP_Bell[time_pt_Bell]~multinomial(to_vector(probabilities_multi_SP_Bell[time_pt_Bell]));       // this is equivalent to binomial () as there are only 2 outcomes for this particular study (the observed counts for each time point are binomially distributed with probabilities stored in the matrix above)
N_outcome_SP_AS_Bell[time_pt_Bell]~multinomial(to_vector(probabilities_multi_SP_AS_Bell[time_pt_Bell]));
N_outcome_SP_CQ_Bell[time_pt_Bell]~multinomial(to_vector(probabilities_multi_SP_CQ_Bell[time_pt_Bell]));
N_outcome_SP_AQ_Bell[time_pt_Bell]~multinomial(to_vector(probabilities_multi_SP_AQ_Bell[time_pt_Bell]));

}


for(j in 2:N_obs_Gesase) {

probabilities_multi_SP_Gesase[j-1,1]=(pred_treated_I_quint_SP_Gesase[row_model_Gesase[j]]- pred_treated_I_quint_SP_Gesase[row_model_Gesase[j-1]])/pred_treated_uninf_SP_Gesase[row_model_Gesase[j-1]];  // prob of new inf with dhps GEA
probabilities_multi_SP_Gesase[j-1,2]=(pred_treated_I_sext_SP_Gesase[row_model_Gesase[j]]- pred_treated_I_sext_SP_Gesase[row_model_Gesase[j-1]])/pred_treated_uninf_SP_Gesase[row_model_Gesase[j-1]]; // prob of new inf with dhps GEG
probabilities_multi_SP_Gesase[j-1,3]=(pred_treated_I_undeterm_SP_Gesase[row_model_Gesase[j]]- pred_treated_I_undeterm_SP_Gesase[row_model_Gesase[j-1]])/pred_treated_uninf_SP_Gesase[row_model_Gesase[j-1]]; // prob of new inf with undetermined dhps genotype
probabilities_multi_SP_Gesase[j-1,4]=1-probabilities_multi_SP_Gesase[j-1,1] - probabilities_multi_SP_Gesase[j-1,2] - probabilities_multi_SP_Gesase[j-1,3] ; // prob uninfected
}

for (time_pt_Gesase in 1:(N_obs_Gesase-1)){

N_outcome_SP_Gesase[time_pt_Gesase]~multinomial(to_vector(probabilities_multi_SP_Gesase[time_pt_Gesase]));
}
sext_day0_Gesase ~ binomial(denomin_day0_Gesase, freq_sext_Gesase); //underlying modelled frequency (freq_sext_Gesase) is informed by both the data on day 0 , as well as the rate of new infections with each genotype (see model chunk)


// likelihood ---
for(j in 2:N_obs_Nahum) {

probabilities_multi_SP_Nahum[j-1,1]=(pred_treated_I_quadr_SP_Nahum[row_model_Nahum[j]]- pred_treated_I_quadr_SP_Nahum[row_model_Nahum[j-1]])/pred_treated_uninf_SP_Nahum[row_model_Nahum[j-1]];
probabilities_multi_SP_Nahum[j-1,2]= 1-probabilities_multi_SP_Nahum[j-1,1];

probabilities_multi_SP_AS_Nahum[j-1,1]=(pred_treated_I_quadr_SP_AS_Nahum[row_model_Nahum[j]]- pred_treated_I_quadr_SP_AS_Nahum[row_model_Nahum[j-1]])/pred_treated_uninf_SP_AS_Nahum[row_model_Nahum[j-1]];
probabilities_multi_SP_AS_Nahum[j-1,2]=1-probabilities_multi_SP_AS_Nahum[j-1,1];

probabilities_multi_CQ_Nahum[j-1,1]=(pred_treated_I_quadr_CQ_Nahum[row_model_Nahum[j]]- pred_treated_I_quadr_CQ_Nahum[row_model_Nahum[j-1]])/pred_treated_uninf_CQ_Nahum[row_model_Nahum[j-1]];
probabilities_multi_CQ_Nahum[j-1,2]=1-probabilities_multi_CQ_Nahum[j-1,1];

}

for (time_pt_Nahum in 1:(N_obs_Nahum-1)){

N_outcome_SP_Nahum[time_pt_Nahum]~multinomial(to_vector(probabilities_multi_SP_Nahum[time_pt_Nahum]));
N_outcome_SP_AS_Nahum[time_pt_Nahum]~multinomial(to_vector(probabilities_multi_SP_AS_Nahum[time_pt_Nahum]));
N_outcome_CQ_Nahum[time_pt_Nahum]~multinomial(to_vector(probabilities_multi_CQ_Nahum[time_pt_Nahum]));

}

///Allen_Magude

for(j in 2:N_obs_Allen_Magude) {

probabilities_multi_SP_Allen_Magude[j-1,1]=((pred_treated_I_quint_SP_Allen_Magude[row_model_Allen_Magude[j]]+ pred_treated_I_tripl_SP_Allen_Magude[row_model_Allen_Magude[j]]) -
                                      (pred_treated_I_quint_SP_Allen_Magude[row_model_Allen_Magude[j-1]]+ pred_treated_I_tripl_SP_Allen_Magude[row_model_Allen_Magude[j-1]]))/
                                      pred_treated_uninf_SP_Allen_Magude[row_model_Allen_Magude[j-1]];

probabilities_multi_SP_Allen_Magude[j-1,2]= 1- probabilities_multi_SP_Allen_Magude[j-1,1];

probabilities_multi_SP_AS_Allen_Magude[j-1,1]=((pred_treated_I_quint_SP_AS_Allen_Magude[row_model_Allen_Magude[j]]+ pred_treated_I_tripl_SP_AS_Allen_Magude[row_model_Allen_Magude[j]]) -
                                      (pred_treated_I_quint_SP_AS_Allen_Magude[row_model_Allen_Magude[j-1]]+ pred_treated_I_tripl_SP_AS_Allen_Magude[row_model_Allen_Magude[j-1]]))/
                                      pred_treated_uninf_SP_AS_Allen_Magude[row_model_Allen_Magude[j-1]];

probabilities_multi_SP_AS_Allen_Magude[j-1,2]=1-probabilities_multi_SP_AS_Allen_Magude[j-1,1];
}

for (time_pt_Allen_Magude in 1:(N_obs_Allen_Magude-1)){

N_outcome_SP_Allen_Magude[time_pt_Allen_Magude]~multinomial(to_vector(probabilities_multi_SP_Allen_Magude[time_pt_Allen_Magude]));
N_outcome_SP_AS_Allen_Magude[time_pt_Allen_Magude]~multinomial(to_vector(probabilities_multi_SP_AS_Allen_Magude[time_pt_Allen_Magude]));
}
quint_day0_Allen_Magude ~ binomial(denomin_day0_Allen_Magude, freq_quint_Allen_Magude);

///Allen_Boane

for(j in 2:N_obs_Allen_Boane) {

probabilities_multi_SP_Allen_Boane[j-1,1]=((pred_treated_I_quint_SP_Allen_Boane[row_model_Allen_Boane[j]]+ pred_treated_I_tripl_SP_Allen_Boane[row_model_Allen_Boane[j]]) -
                                      (pred_treated_I_quint_SP_Allen_Boane[row_model_Allen_Boane[j-1]]+ pred_treated_I_tripl_SP_Allen_Boane[row_model_Allen_Boane[j-1]]))/
                                      pred_treated_uninf_SP_Allen_Boane[row_model_Allen_Boane[j-1]];

probabilities_multi_SP_Allen_Boane[j-1,2]= 1- probabilities_multi_SP_Allen_Boane[j-1,1];

probabilities_multi_SP_AS_Allen_Boane[j-1,1]=((pred_treated_I_quint_SP_AS_Allen_Boane[row_model_Allen_Boane[j]]+ pred_treated_I_tripl_SP_AS_Allen_Boane[row_model_Allen_Boane[j]]) -
                                      (pred_treated_I_quint_SP_AS_Allen_Boane[row_model_Allen_Boane[j-1]]+ pred_treated_I_tripl_SP_AS_Allen_Boane[row_model_Allen_Boane[j-1]]))/
                                      pred_treated_uninf_SP_AS_Allen_Boane[row_model_Allen_Boane[j-1]];

probabilities_multi_SP_AS_Allen_Boane[j-1,2]=1-probabilities_multi_SP_AS_Allen_Boane[j-1,1];
}

for (time_pt_Allen_Boane in 1:(N_obs_Allen_Boane-1)){

N_outcome_SP_Allen_Boane[time_pt_Allen_Boane]~multinomial(to_vector(probabilities_multi_SP_Allen_Boane[time_pt_Allen_Boane]));
N_outcome_SP_AS_Allen_Boane[time_pt_Allen_Boane]~multinomial(to_vector(probabilities_multi_SP_AS_Allen_Boane[time_pt_Allen_Boane]));
}
quint_day0_Allen_Boane ~ binomial(denomin_day0_Allen_Boane, freq_quint_Allen_Boane);

///Allen_Namaacha

for(j in 2:N_obs_Allen_Namaacha) {

probabilities_multi_SP_Allen_Namaacha[j-1,1]=((pred_treated_I_quint_SP_Allen_Namaacha[row_model_Allen_Namaacha[j]]+ pred_treated_I_tripl_SP_Allen_Namaacha[row_model_Allen_Namaacha[j]]) -
                                      (pred_treated_I_quint_SP_Allen_Namaacha[row_model_Allen_Namaacha[j-1]]+ pred_treated_I_tripl_SP_Allen_Namaacha[row_model_Allen_Namaacha[j-1]]))/
                                      pred_treated_uninf_SP_Allen_Namaacha[row_model_Allen_Namaacha[j-1]];

probabilities_multi_SP_Allen_Namaacha[j-1,2]= 1- probabilities_multi_SP_Allen_Namaacha[j-1,1];

probabilities_multi_SP_AS_Allen_Namaacha[j-1,1]=((pred_treated_I_quint_SP_AS_Allen_Namaacha[row_model_Allen_Namaacha[j]]+ pred_treated_I_tripl_SP_AS_Allen_Namaacha[row_model_Allen_Namaacha[j]]) -
                                      (pred_treated_I_quint_SP_AS_Allen_Namaacha[row_model_Allen_Namaacha[j-1]]+ pred_treated_I_tripl_SP_AS_Allen_Namaacha[row_model_Allen_Namaacha[j-1]]))/
                                      pred_treated_uninf_SP_AS_Allen_Namaacha[row_model_Allen_Namaacha[j-1]];

probabilities_multi_SP_AS_Allen_Namaacha[j-1,2]=1-probabilities_multi_SP_AS_Allen_Namaacha[j-1,1];
}

for (time_pt_Allen_Namaacha in 1:(N_obs_Allen_Namaacha-1)){

N_outcome_SP_Allen_Namaacha[time_pt_Allen_Namaacha]~multinomial(to_vector(probabilities_multi_SP_Allen_Namaacha[time_pt_Allen_Namaacha]));
N_outcome_SP_AS_Allen_Namaacha[time_pt_Allen_Namaacha]~multinomial(to_vector(probabilities_multi_SP_AS_Allen_Namaacha[time_pt_Allen_Namaacha]));
}
quint_day0_Allen_Namaacha ~ binomial(denomin_day0_Allen_Namaacha, freq_quint_Allen_Namaacha);


///Allen_Catuane

for(j in 2:N_obs_Allen_Catuane) {

probabilities_multi_SP_Allen_Catuane[j-1,1]=((pred_treated_I_quint_SP_Allen_Catuane[row_model_Allen_Catuane[j]]+ pred_treated_I_tripl_SP_Allen_Catuane[row_model_Allen_Catuane[j]]) -
                                      (pred_treated_I_quint_SP_Allen_Catuane[row_model_Allen_Catuane[j-1]]+ pred_treated_I_tripl_SP_Allen_Catuane[row_model_Allen_Catuane[j-1]]))/
                                      pred_treated_uninf_SP_Allen_Catuane[row_model_Allen_Catuane[j-1]];

probabilities_multi_SP_Allen_Catuane[j-1,2]= 1- probabilities_multi_SP_Allen_Catuane[j-1,1];

probabilities_multi_SP_AS_Allen_Catuane[j-1,1]=((pred_treated_I_quint_SP_AS_Allen_Catuane[row_model_Allen_Catuane[j]]+ pred_treated_I_tripl_SP_AS_Allen_Catuane[row_model_Allen_Catuane[j]]) -
                                      (pred_treated_I_quint_SP_AS_Allen_Catuane[row_model_Allen_Catuane[j-1]]+ pred_treated_I_tripl_SP_AS_Allen_Catuane[row_model_Allen_Catuane[j-1]]))/
                                      pred_treated_uninf_SP_AS_Allen_Catuane[row_model_Allen_Catuane[j-1]];

probabilities_multi_SP_AS_Allen_Catuane[j-1,2]=1-probabilities_multi_SP_AS_Allen_Catuane[j-1,1];
}

for (time_pt_Allen_Catuane in 1:(N_obs_Allen_Catuane-1)){

N_outcome_SP_Allen_Catuane[time_pt_Allen_Catuane]~multinomial(to_vector(probabilities_multi_SP_Allen_Catuane[time_pt_Allen_Catuane]));
N_outcome_SP_AS_Allen_Catuane[time_pt_Allen_Catuane]~multinomial(to_vector(probabilities_multi_SP_AS_Allen_Catuane[time_pt_Allen_Catuane]));
}
quint_day0_Allen_Catuane ~ binomial(denomin_day0_Allen_Catuane, freq_quint_Allen_Catuane);

for(j in 2:N_obs_RHXNJ) {

probabilities_multi_SP_RHXNJ[j-1,1]=((pred_treated_I_quint_SP_RHXNJ[row_model_RHXNJ[j]]+ pred_treated_I_tripl_SP_RHXNJ[row_model_RHXNJ[j]]) -
                                      (pred_treated_I_quint_SP_RHXNJ[row_model_RHXNJ[j-1]]+ pred_treated_I_tripl_SP_RHXNJ[row_model_RHXNJ[j-1]]))/
                                      pred_treated_uninf_SP_RHXNJ[row_model_RHXNJ[j-1]];

probabilities_multi_SP_RHXNJ[j-1,2]=pred_treated_uninf_SP_RHXNJ[row_model_RHXNJ[j]]/ pred_treated_uninf_SP_RHXNJ[row_model_RHXNJ[j-1]];

}

for (time_pt_RHXNJ in 1:(N_obs_RHXNJ-1)){

N_outcome_SP_RHXNJ[time_pt_RHXNJ]~multinomial(to_vector(probabilities_multi_SP_RHXNJ[time_pt_RHXNJ]));
}

quint_day0_RHXNJ ~ binomial(denomin_day0_RHXNJ, freq_quint_RHXNJ);


////RZENT

for(j in 2:N_obs_RZENT) {

probabilities_multi_SP_RZENT[j-1,1]=((pred_treated_I_quint_SP_RZENT[row_model_RZENT[j]]+ pred_treated_I_tripl_SP_RZENT[row_model_RZENT[j]]) -
                                      (pred_treated_I_quint_SP_RZENT[row_model_RZENT[j-1]]+ pred_treated_I_tripl_SP_RZENT[row_model_RZENT[j-1]]))/
                                      pred_treated_uninf_SP_RZENT[row_model_RZENT[j-1]];

probabilities_multi_SP_RZENT[j-1,2]=pred_treated_uninf_SP_RZENT[row_model_RZENT[j]]/ pred_treated_uninf_SP_RZENT[row_model_RZENT[j-1]];

}

for (time_pt_RZENT in 1:(N_obs_RZENT-1)){

N_outcome_SP_RZENT[time_pt_RZENT]~multinomial(to_vector(probabilities_multi_SP_RZENT[time_pt_RZENT]));
}

quint_day0_RZENT ~ binomial(denomin_day0_RZENT, freq_quint_RZENT);


////NMMSB

for(j in 2:N_obs_NMMSB) {

probabilities_multi_SP_NMMSB[j-1,1]=((pred_treated_I_quint_SP_NMMSB[row_model_NMMSB[j]]+ pred_treated_I_tripl_SP_NMMSB[row_model_NMMSB[j]]) -
                                      (pred_treated_I_quint_SP_NMMSB[row_model_NMMSB[j-1]]+ pred_treated_I_tripl_SP_NMMSB[row_model_NMMSB[j-1]]))/
                                      pred_treated_uninf_SP_NMMSB[row_model_NMMSB[j-1]];

probabilities_multi_SP_NMMSB[j-1,2]=pred_treated_uninf_SP_NMMSB[row_model_NMMSB[j]]/ pred_treated_uninf_SP_NMMSB[row_model_NMMSB[j-1]];

}

for (time_pt_NMMSB in 1:(N_obs_NMMSB-1)){

N_outcome_SP_NMMSB[time_pt_NMMSB]~multinomial(to_vector(probabilities_multi_SP_NMMSB[time_pt_NMMSB]));
}

quint_day0_NMMSB ~ binomial(denomin_day0_NMMSB, freq_quint_NMMSB);


////PEADD

for(j in 2:N_obs_PEADD) {

probabilities_multi_SP_PEADD[j-1,1]=((pred_treated_I_quint_SP_PEADD[row_model_PEADD[j]]+ pred_treated_I_tripl_SP_PEADD[row_model_PEADD[j]]) -
                                      (pred_treated_I_quint_SP_PEADD[row_model_PEADD[j-1]]+ pred_treated_I_tripl_SP_PEADD[row_model_PEADD[j-1]]))/
                                      pred_treated_uninf_SP_PEADD[row_model_PEADD[j-1]];

probabilities_multi_SP_PEADD[j-1,2]=pred_treated_uninf_SP_PEADD[row_model_PEADD[j]]/ pred_treated_uninf_SP_PEADD[row_model_PEADD[j-1]];

}

for (time_pt_PEADD in 1:(N_obs_PEADD-1)){

N_outcome_SP_PEADD[time_pt_PEADD]~multinomial(to_vector(probabilities_multi_SP_PEADD[time_pt_PEADD]));
}

quint_day0_PEADD ~ binomial(denomin_day0_PEADD, freq_quint_PEADD);


for(j in 2:N_obs_KZN) {

probabilities_multi_SP_KZN[j-1,1]=(pred_treated_I_quint_SP_KZN[row_model_KZN[j]]- pred_treated_I_quint_SP_KZN[row_model_KZN[j-1]])/pred_treated_uninf_SP_KZN[row_model_KZN[j-1]];
probabilities_multi_SP_KZN[j-1,2]=1-probabilities_multi_SP_KZN[j-1,1];

}

for (time_pt_KZN in 1:(N_obs_KZN-1)){
N_outcome_SP_KZN[time_pt_KZN]~multinomial(to_vector(probabilities_multi_SP_KZN[time_pt_KZN]));


}

}


// 
// ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 generated quantities {
////////////// The rest of the code does not affect the model or likelihood. It generates quantities to help interpret the results, e.g. using estimated parameters, this code generates model outputs such as the probability of infection over time for all model iterations to be used for plotting averages and credible intervals.

real pr_time_Bell[N_Bell,1];
real pr_time_Gesase[N_Gesase,1];
real pr_time_Nahum[N_Nahum,1];
real pr_time_Allen_Magude[N_Allen_Magude,1];
real pr_time_Allen_Boane[N_Allen_Boane,1];
real pr_time_Allen_Namaacha[N_Allen_Namaacha,1];
real pr_time_Allen_Catuane[N_Allen_Catuane,1];
real pr_time_RHXNJ[N_RHXNJ,1];
real pr_time_RZENT[N_RZENT,1];
real pr_time_NMMSB[N_NMMSB,1];
real pr_time_PEADD[N_PEADD,1];
real pr_time_KZN[N_KZN,1];

///Bell

real<lower=0, upper=1> pr_treated_I_quint_SP_Bell[N_Bell,1];     // predicted total proportion infected with dhps GEA by time t (cumulative)
real<lower=0, upper=1> pr_treated_uninf_SP_Bell[N_Bell,1];   // predicted proportion not infected by time t (and are at risk in the next time step)
real<lower=0, upper=1> pr_treated_I_quint_new_SP_Bell[N_Bell,1]; // predicted proportion of new infections with dhps GEA between the interval t and t-1
real<lower=0, upper=1> pr_protect_quint_SP_Bell[N_Bell,1];  // Protective efficacy at each time pt against dhps GEA

real<lower=0, upper=1> pr_treated_I_quint_SP_AS_Bell[N_Bell,1];     
real<lower=0, upper=1> pr_treated_uninf_SP_AS_Bell[N_Bell,1];  
real<lower=0, upper=1> pr_treated_I_quint_new_SP_AS_Bell[N_Bell,1]; 
real<lower=0, upper=1> pr_protect_quint_SP_AS_Bell[N_Bell,1];  

real<lower=0, upper=1> pr_treated_I_quint_SP_CQ_Bell[N_Bell,1];   
real<lower=0, upper=1> pr_treated_uninf_SP_CQ_Bell[N_Bell,1];  
real<lower=0, upper=1> pr_treated_I_quint_new_SP_CQ_Bell[N_Bell,1];
real<lower=0, upper=1> pr_protect_quint_SP_CQ_Bell[N_Bell,1];  

real<lower=0, upper=1> pr_treated_I_quint_SP_AQ_Bell[N_Bell,1];   
real<lower=0, upper=1> pr_treated_uninf_SP_AQ_Bell[N_Bell,1]; 
real<lower=0, upper=1> pr_treated_I_quint_new_SP_AQ_Bell[N_Bell,1]; 
real<lower=0, upper=1> pr_protect_quint_SP_AQ_Bell[N_Bell,1]; 

real <lower=0, upper=1> pr_prob_inf_Bell;  // Probability of infection at each time pt (in the absence of treatment - this depends on transmission level)


///Gesase
real<lower=0, upper=1> pr_treated_I_sext_SP_Gesase[N_Gesase,1];     
real<lower=0, upper=1> pr_treated_I_quint_SP_Gesase[N_Gesase,1];    
real<lower=0, upper=1> pr_treated_uninf_SP_Gesase[N_Gesase,1];   
real<lower=0, upper=1> pr_treated_I_sext_new_SP_Gesase[N_Gesase,1]; 
real<lower=0, upper=1> pr_treated_I_quint_new_SP_Gesase[N_Gesase,1]; 
real<lower=0, upper=1> pr_treated_I_undeterm_new_SP_Gesase[N_Gesase,1];
real<lower=0, upper=1> pr_treated_I_undeterm_SP_Gesase[N_Gesase,1];
real<lower=0, upper=1> pr_protect_sext_SP_Gesase[N_Gesase,1]; 
real<lower=0, upper=1> pr_protect_quint_SP_Gesase[N_Gesase,1];  

real <lower=0, upper=1> pr_prob_inf_Gesase;  




/////Nahum
  real<lower=0, upper=1> pr_treated_I_quadr_SP_Nahum[N_Nahum,1];    
  real<lower=0, upper=1> pr_treated_uninf_SP_Nahum[N_Nahum,1];   
  real<lower=0, upper=1> pr_treated_I_quadr_new_SP_Nahum[N_Nahum,1]; 
  real<lower=0, upper=1> pr_protect_quadr_SP_Nahum[N_Nahum,1];  
  real<lower=0, upper=1> pr_treated_I_quadr_SP_AS_Nahum[N_Nahum,1];    
  real<lower=0, upper=1> pr_treated_uninf_SP_AS_Nahum[N_Nahum,1];   
  real<lower=0, upper=1> pr_treated_I_quadr_new_SP_AS_Nahum[N_Nahum,1]; 
  real<lower=0, upper=1> pr_protect_quadr_SP_AS_Nahum[N_Nahum,1]; 
  real<lower=0, upper=1> pr_treated_I_quadr_CQ_Nahum[N_Nahum,1];    
  real<lower=0, upper=1> pr_treated_uninf_CQ_Nahum[N_Nahum,1];  
  real<lower=0, upper=1> pr_treated_I_quadr_new_CQ_Nahum[N_Nahum,1]; 
  real<lower=0, upper=1> pr_protect_quadr_CQ_Nahum[N_Nahum,1];  
  real <lower=0, upper=1> pr_prob_inf_Nahum; 

  /////Allen_Magude
  real<lower=0, upper=1> pr_treated_I_quint_SP_Allen_Magude[N_Allen_Magude,1];   
  real<lower=0, upper=1> pr_treated_uninf_SP_Allen_Magude[N_Allen_Magude,1]; 
  real<lower=0, upper=1> pr_treated_I_quint_new_SP_Allen_Magude[N_Allen_Magude,1]; 
  real<lower=0, upper=1> pr_protect_quint_SP_Allen_Magude[N_Allen_Magude,1];  
  real<lower=0, upper=1> pr_treated_I_tripl_SP_Allen_Magude[N_Allen_Magude,1];   
  real<lower=0, upper=1> pr_treated_I_tripl_new_SP_Allen_Magude[N_Allen_Magude,1]; 
  real<lower=0, upper=1> pr_protect_tripl_SP_Allen_Magude[N_Allen_Magude,1];  
  real<lower=0, upper=1> pr_treated_I_quint_SP_AS_Allen_Magude[N_Allen_Magude,1];    
  real<lower=0, upper=1> pr_treated_uninf_SP_AS_Allen_Magude[N_Allen_Magude,1];  
  real<lower=0, upper=1> pr_treated_I_quint_new_SP_AS_Allen_Magude[N_Allen_Magude,1]; 
  real<lower=0, upper=1> pr_protect_quint_SP_AS_Allen_Magude[N_Allen_Magude,1]; 
  real<lower=0, upper=1> pr_treated_I_tripl_SP_AS_Allen_Magude[N_Allen_Magude,1];     
  real<lower=0, upper=1> pr_treated_I_tripl_new_SP_AS_Allen_Magude[N_Allen_Magude,1]; 
  real<lower=0, upper=1> pr_protect_tripl_SP_AS_Allen_Magude[N_Allen_Magude,1]; 
  real <lower=0, upper=1> pr_prob_inf_Allen_Magude;  

  /////Allen_Boane
  real<lower=0, upper=1> pr_treated_I_quint_SP_Allen_Boane[N_Allen_Boane,1];  
  real<lower=0, upper=1> pr_treated_uninf_SP_Allen_Boane[N_Allen_Boane,1];  
  real<lower=0, upper=1> pr_treated_I_quint_new_SP_Allen_Boane[N_Allen_Boane,1]; 
  real<lower=0, upper=1> pr_protect_quint_SP_Allen_Boane[N_Allen_Boane,1]; 
  real<lower=0, upper=1> pr_treated_I_tripl_SP_Allen_Boane[N_Allen_Boane,1];  
  real<lower=0, upper=1> pr_treated_I_tripl_new_SP_Allen_Boane[N_Allen_Boane,1];
  real<lower=0, upper=1> pr_protect_tripl_SP_Allen_Boane[N_Allen_Boane,1]; 
  real<lower=0, upper=1> pr_treated_I_quint_SP_AS_Allen_Boane[N_Allen_Boane,1];    
  real<lower=0, upper=1> pr_treated_uninf_SP_AS_Allen_Boane[N_Allen_Boane,1]; 
  real<lower=0, upper=1> pr_treated_I_quint_new_SP_AS_Allen_Boane[N_Allen_Boane,1]; 
  real<lower=0, upper=1> pr_protect_quint_SP_AS_Allen_Boane[N_Allen_Boane,1]; 
  real<lower=0, upper=1> pr_treated_I_tripl_SP_AS_Allen_Boane[N_Allen_Boane,1];   
  real<lower=0, upper=1> pr_treated_I_tripl_new_SP_AS_Allen_Boane[N_Allen_Boane,1]; 
  real<lower=0, upper=1> pr_protect_tripl_SP_AS_Allen_Boane[N_Allen_Boane,1]; 
  real <lower=0, upper=1> pr_prob_inf_Allen_Boane;  

  /////Allen_Namaacha
  real<lower=0, upper=1> pr_treated_I_quint_SP_Allen_Namaacha[N_Allen_Namaacha,1];     
  real<lower=0, upper=1> pr_treated_uninf_SP_Allen_Namaacha[N_Allen_Namaacha,1];   
  real<lower=0, upper=1> pr_treated_I_quint_new_SP_Allen_Namaacha[N_Allen_Namaacha,1];
  real<lower=0, upper=1> pr_protect_quint_SP_Allen_Namaacha[N_Allen_Namaacha,1]; 
  real<lower=0, upper=1> pr_treated_I_tripl_SP_Allen_Namaacha[N_Allen_Namaacha,1];    
  real<lower=0, upper=1> pr_treated_I_tripl_new_SP_Allen_Namaacha[N_Allen_Namaacha,1]; 
  real<lower=0, upper=1> pr_protect_tripl_SP_Allen_Namaacha[N_Allen_Namaacha,1];  
  real<lower=0, upper=1> pr_treated_I_quint_SP_AS_Allen_Namaacha[N_Allen_Namaacha,1];   
  real<lower=0, upper=1> pr_treated_uninf_SP_AS_Allen_Namaacha[N_Allen_Namaacha,1]; 
  real<lower=0, upper=1> pr_treated_I_quint_new_SP_AS_Allen_Namaacha[N_Allen_Namaacha,1];
  real<lower=0, upper=1> pr_protect_quint_SP_AS_Allen_Namaacha[N_Allen_Namaacha,1]; 
  real<lower=0, upper=1> pr_treated_I_tripl_SP_AS_Allen_Namaacha[N_Allen_Namaacha,1];    
  real<lower=0, upper=1> pr_treated_I_tripl_new_SP_AS_Allen_Namaacha[N_Allen_Namaacha,1]; 
  real<lower=0, upper=1> pr_protect_tripl_SP_AS_Allen_Namaacha[N_Allen_Namaacha,1];  
  real <lower=0, upper=1> pr_prob_inf_Allen_Namaacha; 

  /////Allen_Catuane
  real<lower=0, upper=1> pr_treated_I_quint_SP_Allen_Catuane[N_Allen_Catuane,1];  
  real<lower=0, upper=1> pr_treated_uninf_SP_Allen_Catuane[N_Allen_Catuane,1];   
  real<lower=0, upper=1> pr_treated_I_quint_new_SP_Allen_Catuane[N_Allen_Catuane,1]; 
  real<lower=0, upper=1> pr_protect_quint_SP_Allen_Catuane[N_Allen_Catuane,1];  
  real<lower=0, upper=1> pr_treated_I_tripl_SP_Allen_Catuane[N_Allen_Catuane,1];     
  real<lower=0, upper=1> pr_treated_I_tripl_new_SP_Allen_Catuane[N_Allen_Catuane,1]; 
  real<lower=0, upper=1> pr_protect_tripl_SP_Allen_Catuane[N_Allen_Catuane,1];  
  real<lower=0, upper=1> pr_treated_I_quint_SP_AS_Allen_Catuane[N_Allen_Catuane,1];   
  real<lower=0, upper=1> pr_treated_uninf_SP_AS_Allen_Catuane[N_Allen_Catuane,1]; 
  real<lower=0, upper=1> pr_treated_I_quint_new_SP_AS_Allen_Catuane[N_Allen_Catuane,1]; 
  real<lower=0, upper=1> pr_protect_quint_SP_AS_Allen_Catuane[N_Allen_Catuane,1];  
  real<lower=0, upper=1> pr_treated_I_tripl_SP_AS_Allen_Catuane[N_Allen_Catuane,1];    
  real<lower=0, upper=1> pr_treated_I_tripl_new_SP_AS_Allen_Catuane[N_Allen_Catuane,1]; 
  real<lower=0, upper=1> pr_protect_tripl_SP_AS_Allen_Catuane[N_Allen_Catuane,1];  
  real <lower=0, upper=1> pr_prob_inf_Allen_Catuane;  

  ///RHXNJ
  real<lower=0, upper=1> pr_treated_I_quint_SP_RHXNJ[N_RHXNJ,1];    
  real<lower=0, upper=1> pr_treated_uninf_SP_RHXNJ[N_RHXNJ,1]; 
  real<lower=0, upper=1> pr_treated_I_quint_new_SP_RHXNJ[N_RHXNJ,1]; 
  real<lower=0, upper=1> pr_protect_quint_SP_RHXNJ[N_RHXNJ,1];  
  real<lower=0, upper=1> pr_treated_I_tripl_SP_RHXNJ[N_RHXNJ,1];  
  real<lower=0, upper=1> pr_treated_I_tripl_new_SP_RHXNJ[N_RHXNJ,1]; 
  real<lower=0, upper=1> pr_protect_tripl_SP_RHXNJ[N_RHXNJ,1];  
  real <lower=0, upper=1> pr_prob_inf_RHXNJ;

  ///RZENT
  real<lower=0, upper=1> pr_treated_I_quint_SP_RZENT[N_RZENT,1];   
  real<lower=0, upper=1> pr_treated_uninf_SP_RZENT[N_RZENT,1];  
  real<lower=0, upper=1> pr_treated_I_quint_new_SP_RZENT[N_RZENT,1]; 
  real<lower=0, upper=1> pr_protect_quint_SP_RZENT[N_RZENT,1]; 
  real<lower=0, upper=1> pr_treated_I_tripl_SP_RZENT[N_RZENT,1];   
  real<lower=0, upper=1> pr_treated_I_tripl_new_SP_RZENT[N_RZENT,1]; 
  real<lower=0, upper=1> pr_protect_tripl_SP_RZENT[N_RZENT,1]; 
  real <lower=0, upper=1> pr_prob_inf_RZENT;  

  ///NMMSB
  real<lower=0, upper=1> pr_treated_I_quint_SP_NMMSB[N_NMMSB,1];    
  real<lower=0, upper=1> pr_treated_uninf_SP_NMMSB[N_NMMSB,1]; 
  real<lower=0, upper=1> pr_treated_I_quint_new_SP_NMMSB[N_NMMSB,1]; 
  real<lower=0, upper=1> pr_protect_quint_SP_NMMSB[N_NMMSB,1];  
  real<lower=0, upper=1> pr_treated_I_tripl_SP_NMMSB[N_NMMSB,1];    
  real<lower=0, upper=1> pr_treated_I_tripl_new_SP_NMMSB[N_NMMSB,1]; 
  real<lower=0, upper=1> pr_protect_tripl_SP_NMMSB[N_NMMSB,1];  
  real <lower=0, upper=1> pr_prob_inf_NMMSB;  


 ///PEADD
  real<lower=0, upper=1> pr_treated_I_quint_SP_PEADD[N_PEADD,1];    
  real<lower=0, upper=1> pr_treated_uninf_SP_PEADD[N_PEADD,1];   
  real<lower=0, upper=1> pr_treated_I_quint_new_SP_PEADD[N_PEADD,1]; 
  real<lower=0, upper=1> pr_protect_quint_SP_PEADD[N_PEADD,1];  
  real<lower=0, upper=1> pr_treated_I_tripl_SP_PEADD[N_PEADD,1];     
  real<lower=0, upper=1> pr_treated_I_tripl_new_SP_PEADD[N_PEADD,1]; 
  real<lower=0, upper=1> pr_protect_tripl_SP_PEADD[N_PEADD,1]; 
  real <lower=0, upper=1> pr_prob_inf_PEADD;  

   /////KZN
  real<lower=0, upper=1> pr_treated_I_quint_SP_KZN[N_KZN,1];    
  real<lower=0, upper=1> pr_treated_uninf_SP_KZN[N_KZN,1];  
  real<lower=0, upper=1> pr_treated_I_quint_new_SP_KZN[N_KZN,1]; 
  real<lower=0, upper=1> pr_protect_quint_SP_KZN[N_KZN,1]; 
  real <lower=0, upper=1> pr_prob_inf_KZN;  


 // 
  //probability of infection
  pr_prob_inf_Bell=   1-exp(-(inc_Bell/365)*dt) ; // prob of infection at each time step (assumed to be constant across the study followup)
  pr_prob_inf_Gesase= 1-exp(-(inc_Gesase/365)*dt) ; 
  pr_prob_inf_Nahum=  1-exp(-(inc_Nahum/365)*dt) ; 
  pr_prob_inf_Allen_Magude=  1-exp(-(inc_Allen_Magude/365)*dt) ; 
  pr_prob_inf_Allen_Boane=  1-exp(-(inc_Allen_Boane/365)*dt) ; 
  pr_prob_inf_Allen_Namaacha=  1-exp(-(inc_Allen_Namaacha/365)*dt) ; 
  pr_prob_inf_Allen_Catuane=  1-exp(-(inc_Allen_Catuane/365)*dt) ; 
  pr_prob_inf_RHXNJ=  1-exp(-(inc_RHXNJ/365)*dt) ; 
  pr_prob_inf_RZENT=  1-exp(-(inc_RZENT/365)*dt) ; 
  pr_prob_inf_NMMSB=  1-exp(-(inc_NMMSB/365)*dt) ; 
  pr_prob_inf_PEADD=  1-exp(-(inc_PEADD/365)*dt) ; 
  pr_prob_inf_KZN=    1-exp(-(inc_KZN/365)*dt) ; 
  
///// Bell

// everyone is susceptible in the first time point

pr_treated_uninf_SP_Bell[1,1]=1;
pr_treated_uninf_SP_AS_Bell[1,1]=1;
pr_treated_uninf_SP_CQ_Bell[1,1]=1;
pr_treated_uninf_SP_AQ_Bell[1,1]=1;

// nobody is infected in the first time point

pr_treated_I_quint_SP_Bell[1,1]=0;
pr_treated_I_quint_new_SP_Bell[1,1]=0;
pr_protect_quint_SP_Bell[1,1]=1;

pr_treated_I_quint_SP_AS_Bell[1,1]=0;
pr_treated_I_quint_new_SP_AS_Bell[1,1]=0;
pr_protect_quint_SP_AS_Bell[1,1]=1;

pr_treated_I_quint_SP_CQ_Bell[1,1]=0;
pr_treated_I_quint_new_SP_CQ_Bell[1,1]=0;
pr_protect_quint_SP_CQ_Bell[1,1]=1;

pr_treated_I_quint_SP_AQ_Bell[1,1]=0;
pr_treated_I_quint_new_SP_AQ_Bell[1,1]=0;
pr_protect_quint_SP_AQ_Bell[1,1]=1;


 pr_time_Bell[1,1]=0;

for(i in 2:N_Bell) {

  pr_time_Bell[i,1]=pr_time_Bell[i-1,1]+dt;

  //protection against each strain, evaluated for each time step
  pr_protect_quint_SP_Bell[i,1]= exp(-((pr_time_Bell[i,1])/lambda_quint_SP)^w_quint_SP);
  pr_treated_I_quint_new_SP_Bell[i,1]=  (pr_prob_inf_Bell*pr_treated_uninf_SP_Bell[i-1,1]*(1-pr_protect_quint_SP_Bell[i,1]));     // proportion of new infections with dhps GEA between time t and t-1
  pr_treated_I_quint_SP_Bell[i,1]= pr_treated_I_quint_SP_Bell[i-1,1]+  pr_treated_I_quint_new_SP_Bell[i,1];     // proportion of total cumul infections with dhps GEA by time t
  pr_treated_uninf_SP_Bell[i,1]=pr_treated_uninf_SP_Bell[i-1,1] -   pr_treated_I_quint_new_SP_Bell[i,1] ;// proportion without an infection by time t

 pr_protect_quint_SP_AS_Bell[i,1]= exp(-((pr_time_Bell[i,1])/lambda_quint_SP_AS)^w_quint_SP_AS);
  pr_treated_I_quint_new_SP_AS_Bell[i,1]=  (pr_prob_inf_Bell*pr_treated_uninf_SP_AS_Bell[i-1,1]*(1-pr_protect_quint_SP_AS_Bell[i,1]));     
  pr_treated_I_quint_SP_AS_Bell[i,1]= pr_treated_I_quint_SP_AS_Bell[i-1,1]+  pr_treated_I_quint_new_SP_AS_Bell[i,1];    
  pr_treated_uninf_SP_AS_Bell[i,1]=pr_treated_uninf_SP_AS_Bell[i-1,1] -   pr_treated_I_quint_new_SP_AS_Bell[i,1] ;

 pr_protect_quint_SP_CQ_Bell[i,1]= exp(-((pr_time_Bell[i,1])/lambda_quint_SP_CQ)^w_quint_SP_CQ);
  pr_treated_I_quint_new_SP_CQ_Bell[i,1]=  (pr_prob_inf_Bell*pr_treated_uninf_SP_CQ_Bell[i-1,1]*(1-pr_protect_quint_SP_CQ_Bell[i,1]));    
  pr_treated_I_quint_SP_CQ_Bell[i,1]= pr_treated_I_quint_SP_CQ_Bell[i-1,1]+  pr_treated_I_quint_new_SP_CQ_Bell[i,1];    
  pr_treated_uninf_SP_CQ_Bell[i,1]=pr_treated_uninf_SP_CQ_Bell[i-1,1] -   pr_treated_I_quint_new_SP_CQ_Bell[i,1] ;


 pr_protect_quint_SP_AQ_Bell[i,1]= exp(-((pr_time_Bell[i,1])/lambda_quint_SP_AQ)^w_quint_SP_AQ);
  pr_treated_I_quint_new_SP_AQ_Bell[i,1]=  (pr_prob_inf_Bell*pr_treated_uninf_SP_AQ_Bell[i-1,1]*(1-pr_protect_quint_SP_AQ_Bell[i,1]));     
  pr_treated_I_quint_SP_AQ_Bell[i,1]= pr_treated_I_quint_SP_AQ_Bell[i-1,1]+  pr_treated_I_quint_new_SP_AQ_Bell[i,1];   
  pr_treated_uninf_SP_AQ_Bell[i,1]=pr_treated_uninf_SP_AQ_Bell[i-1,1] -   pr_treated_I_quint_new_SP_AQ_Bell[i,1] ;

}

////Gesase

// everyone is susceptible in the first time point

pr_treated_uninf_SP_Gesase[1,1]=1;

// nobody is infected in the first time point

pr_treated_I_sext_SP_Gesase[1,1]=0;
pr_treated_I_quint_SP_Gesase[1,1]=0;
pr_treated_I_sext_new_SP_Gesase[1,1]=0;
pr_treated_I_quint_new_SP_Gesase[1,1]=0;
pr_treated_I_undeterm_SP_Gesase[1,1]=0;
pr_treated_I_undeterm_new_SP_Gesase[1,1]=0;

 pr_protect_sext_SP_Gesase[1,1]=1;
 pr_protect_quint_SP_Gesase[1,1]=1;

 pr_time_Gesase[1,1]=0;



for(i in 2:N_Gesase) {

  pr_time_Gesase[i,1]=pr_time_Gesase[i-1,1]+dt;

  //protection against each strain, evaluated for each time step
  pr_protect_sext_SP_Gesase[i,1]= exp(-((pr_time_Gesase[i,1])/lambda_sext_SP)^w_sext_SP);
  pr_protect_quint_SP_Gesase[i,1]= exp(-((pr_time_Gesase[i,1])/lambda_quint_SP)^w_quint_SP);

  pr_treated_I_sext_new_SP_Gesase[i,1]=  (pr_prob_inf_Gesase*(freq_sext_Gesase)*pr_treated_uninf_SP_Gesase[i-1,1]*(1-pr_protect_sext_SP_Gesase[i,1])*prob_determ_Gesase); 
  pr_treated_I_quint_new_SP_Gesase[i,1]=  (pr_prob_inf_Gesase*(1-freq_sext_Gesase)*pr_treated_uninf_SP_Gesase[i-1,1]*(1-pr_protect_quint_SP_Gesase[i,1])*prob_determ_Gesase);    
  pr_treated_I_undeterm_new_SP_Gesase[i,1]=((pr_prob_inf_Gesase*(freq_sext_Gesase)*pr_treated_uninf_SP_Gesase[i-1,1]*(1-pr_protect_sext_SP_Gesase[i,1]) )+ (pr_prob_inf_Gesase*(1-freq_sext_Gesase)*pr_treated_uninf_SP_Gesase[i-1,1]*(1-pr_protect_quint_SP_Gesase[i,1])))*(1-prob_determ_Gesase);

  pr_treated_I_sext_SP_Gesase[i,1]= pr_treated_I_sext_SP_Gesase[i-1,1]+  pr_treated_I_sext_new_SP_Gesase[i,1];  
  pr_treated_I_quint_SP_Gesase[i,1]= pr_treated_I_quint_SP_Gesase[i-1,1]+  pr_treated_I_quint_new_SP_Gesase[i,1];  
  pr_treated_I_undeterm_SP_Gesase[i,1]= pr_treated_I_undeterm_SP_Gesase[i-1,1] +pr_treated_I_undeterm_new_SP_Gesase[i,1];

  pr_treated_uninf_SP_Gesase[i,1]=pr_treated_uninf_SP_Gesase[i-1,1] -   pr_treated_I_sext_new_SP_Gesase[i,1]- pr_treated_I_quint_new_SP_Gesase[i,1] -  pr_treated_I_undeterm_new_SP_Gesase[i,1];
}


//Nahum
  // everyone is susceptible in the first time point

  pr_treated_uninf_SP_Nahum[1,1]=1;
  pr_treated_uninf_SP_AS_Nahum[1,1]=1;
  pr_treated_uninf_CQ_Nahum[1,1]=1;

  // nobody is infected in the first time point

  pr_treated_I_quadr_SP_Nahum[1,1]=0;
  pr_treated_I_quadr_new_SP_Nahum[1,1]=0;
  pr_protect_quadr_SP_Nahum[1,1]=1;

  pr_treated_I_quadr_SP_AS_Nahum[1,1]=0;
  pr_treated_I_quadr_new_SP_AS_Nahum[1,1]=0;
  pr_protect_quadr_SP_AS_Nahum[1,1]=1;

  pr_treated_I_quadr_CQ_Nahum[1,1]=0;
  pr_treated_I_quadr_new_CQ_Nahum[1,1]=0;
  pr_protect_quadr_CQ_Nahum[1,1]=1;

   pr_time_Nahum[1,1]=0;

  for(i in 2:N_Nahum) {

    pr_time_Nahum[i,1]=pr_time_Nahum[i-1,1]+dt;

    //protection against each strain, evaluated for each time step
    pr_protect_quadr_SP_Nahum[i,1]= exp(-((pr_time_Nahum[i,1])/lambda_quadr_SP)^w_quadr_SP);
    pr_treated_I_quadr_new_SP_Nahum[i,1]=  pr_treated_uninf_SP_Nahum[i-1,1]*pr_prob_inf_Nahum*(1-pr_protect_quadr_SP_Nahum[i,1]);     
    pr_treated_I_quadr_SP_Nahum[i,1]= pr_treated_I_quadr_SP_Nahum[i-1,1]+ pr_treated_I_quadr_new_SP_Nahum[i,1];    
    pr_treated_uninf_SP_Nahum[i,1]= pr_treated_uninf_SP_Nahum[i-1,1] -pr_treated_I_quadr_new_SP_Nahum[i,1] ;

    pr_protect_quadr_SP_AS_Nahum[i,1]= exp(-((pr_time_Nahum[i,1])/lambda_quadr_SP_AS)^w_quadr_SP_AS);
    pr_treated_I_quadr_new_SP_AS_Nahum[i,1]=  pr_treated_uninf_SP_AS_Nahum[i-1,1]*pr_prob_inf_Nahum*(1-pr_protect_quadr_SP_AS_Nahum[i,1]);    
    pr_treated_I_quadr_SP_AS_Nahum[i,1]= pr_treated_I_quadr_SP_AS_Nahum[i-1,1]+ pr_treated_I_quadr_new_SP_AS_Nahum[i,1];    
    pr_treated_uninf_SP_AS_Nahum[i,1]= pr_treated_uninf_SP_AS_Nahum[i-1,1] -pr_treated_I_quadr_new_SP_AS_Nahum[i,1] ;

    pr_protect_quadr_CQ_Nahum[i,1]= exp(-((pr_time_Nahum[i,1])/lambda_quadr_CQ)^w_quadr_CQ);
    pr_treated_I_quadr_new_CQ_Nahum[i,1]=  pr_treated_uninf_CQ_Nahum[i-1,1]*pr_prob_inf_Nahum*(1-pr_protect_quadr_CQ_Nahum[i,1]);     
    pr_treated_I_quadr_CQ_Nahum[i,1]= pr_treated_I_quadr_CQ_Nahum[i-1,1]+ pr_treated_I_quadr_new_CQ_Nahum[i,1];   
    pr_treated_uninf_CQ_Nahum[i,1]= pr_treated_uninf_CQ_Nahum[i-1,1] -pr_treated_I_quadr_new_CQ_Nahum[i,1] ;
    }


   //////Allen_Magude
   // everyone is susceptible in the first time point

pr_treated_uninf_SP_Allen_Magude[1,1]=1;
pr_treated_uninf_SP_AS_Allen_Magude[1,1]=1;


// nobody is infected in the first time point
pr_treated_I_quint_SP_Allen_Magude[1,1]=0;
pr_treated_I_quint_new_SP_Allen_Magude[1,1]=0;
pr_protect_quint_SP_Allen_Magude[1,1]=1;
pr_treated_I_quint_SP_AS_Allen_Magude[1,1]=0;
pr_treated_I_quint_new_SP_AS_Allen_Magude[1,1]=0;
pr_protect_quint_SP_AS_Allen_Magude[1,1]=1;
pr_treated_I_tripl_SP_Allen_Magude[1,1]=0;
pr_treated_I_tripl_new_SP_Allen_Magude[1,1]=0;
pr_protect_tripl_SP_Allen_Magude[1,1]=1;
pr_treated_I_tripl_SP_AS_Allen_Magude[1,1]=0;
pr_treated_I_tripl_new_SP_AS_Allen_Magude[1,1]=0;
pr_protect_tripl_SP_AS_Allen_Magude[1,1]=1;

 pr_time_Allen_Magude[1,1]=0;

for(i in 2:N_Allen_Magude) {

  pr_time_Allen_Magude[i,1]=pr_time_Allen_Magude[i-1,1]+dt;

  //protection against each strain, evaluated for each time step
  pr_protect_quint_SP_Allen_Magude[i,1]= exp(-((pr_time_Allen_Magude[i,1])/lambda_quint_SP)^w_quint_SP);
  pr_protect_tripl_SP_Allen_Magude[i,1]= exp(-((pr_time_Allen_Magude[i,1])/lambda_tripl_SP)^w_tripl_SP);

  pr_treated_I_quint_new_SP_Allen_Magude[i,1]=  pr_treated_uninf_SP_Allen_Magude[i-1,1]*(freq_quint_Allen_Magude)*pr_prob_inf_Allen_Magude*(1-pr_protect_quint_SP_Allen_Magude[i,1]);     
  pr_treated_I_tripl_new_SP_Allen_Magude[i,1]=  pr_treated_uninf_SP_Allen_Magude[i-1,1]*(1-freq_quint_Allen_Magude)*pr_prob_inf_Allen_Magude*(1-pr_protect_tripl_SP_Allen_Magude[i,1]);

  pr_treated_I_quint_SP_Allen_Magude[i,1]= pr_treated_I_quint_SP_Allen_Magude[i-1,1]+ pr_treated_I_quint_new_SP_Allen_Magude[i,1];    
  pr_treated_I_tripl_SP_Allen_Magude[i,1]= pr_treated_I_tripl_SP_Allen_Magude[i-1,1]+ pr_treated_I_tripl_new_SP_Allen_Magude[i,1];     

  pr_treated_uninf_SP_Allen_Magude[i,1]= pr_treated_uninf_SP_Allen_Magude[i-1,1] -pr_treated_I_quint_new_SP_Allen_Magude[i,1] - pr_treated_I_tripl_new_SP_Allen_Magude[i,1];

   //protection against each strain, evaluated for each time step
  pr_protect_quint_SP_AS_Allen_Magude[i,1]= exp(-((pr_time_Allen_Magude[i,1])/lambda_quint_SP_AS)^w_quint_SP_AS);
  pr_protect_tripl_SP_AS_Allen_Magude[i,1]= exp(-((pr_time_Allen_Magude[i,1])/lambda_tripl_SP_AS)^w_tripl_SP_AS);

  pr_treated_I_quint_new_SP_AS_Allen_Magude[i,1]=  pr_treated_uninf_SP_AS_Allen_Magude[i-1,1]*(freq_quint_Allen_Magude)*pr_prob_inf_Allen_Magude*(1-pr_protect_quint_SP_AS_Allen_Magude[i,1]);     
  pr_treated_I_tripl_new_SP_AS_Allen_Magude[i,1]=  pr_treated_uninf_SP_AS_Allen_Magude[i-1,1]*(1-freq_quint_Allen_Magude)*pr_prob_inf_Allen_Magude*(1-pr_protect_tripl_SP_AS_Allen_Magude[i,1]);

  pr_treated_I_quint_SP_AS_Allen_Magude[i,1]= pr_treated_I_quint_SP_AS_Allen_Magude[i-1,1]+ pr_treated_I_quint_new_SP_AS_Allen_Magude[i,1];     
  pr_treated_I_tripl_SP_AS_Allen_Magude[i,1]= pr_treated_I_tripl_SP_AS_Allen_Magude[i-1,1]+ pr_treated_I_tripl_new_SP_AS_Allen_Magude[i,1];     

  pr_treated_uninf_SP_AS_Allen_Magude[i,1]= pr_treated_uninf_SP_AS_Allen_Magude[i-1,1] -pr_treated_I_quint_new_SP_AS_Allen_Magude[i,1] - pr_treated_I_tripl_new_SP_AS_Allen_Magude[i,1];
  }

    //////Allen_Boane
    // everyone is susceptible in the first time point

 pr_treated_uninf_SP_Allen_Boane[1,1]=1;
 pr_treated_uninf_SP_AS_Allen_Boane[1,1]=1;

 // nobody is infected in the first time point
 pr_treated_I_quint_SP_Allen_Boane[1,1]=0;
 pr_treated_I_quint_new_SP_Allen_Boane[1,1]=0;
 pr_protect_quint_SP_Allen_Boane[1,1]=1;
 pr_treated_I_quint_SP_AS_Allen_Boane[1,1]=0;
 pr_treated_I_quint_new_SP_AS_Allen_Boane[1,1]=0;
 pr_protect_quint_SP_AS_Allen_Boane[1,1]=1;
 pr_treated_I_tripl_SP_Allen_Boane[1,1]=0;
 pr_treated_I_tripl_new_SP_Allen_Boane[1,1]=0;
 pr_protect_tripl_SP_Allen_Boane[1,1]=1;
 pr_treated_I_tripl_SP_AS_Allen_Boane[1,1]=0;
 pr_treated_I_tripl_new_SP_AS_Allen_Boane[1,1]=0;
 pr_protect_tripl_SP_AS_Allen_Boane[1,1]=1;

  pr_time_Allen_Boane[1,1]=0;

 for(i in 2:N_Allen_Boane) {

   pr_time_Allen_Boane[i,1]=pr_time_Allen_Boane[i-1,1]+dt;

   //protection against each strain, evaluated for each time step
   pr_protect_quint_SP_Allen_Boane[i,1]= exp(-((pr_time_Allen_Boane[i,1])/lambda_quint_SP)^w_quint_SP);
   pr_protect_tripl_SP_Allen_Boane[i,1]= exp(-((pr_time_Allen_Boane[i,1])/lambda_tripl_SP)^w_tripl_SP);

   pr_treated_I_quint_new_SP_Allen_Boane[i,1]=  pr_treated_uninf_SP_Allen_Boane[i-1,1]*(freq_quint_Allen_Boane)*pr_prob_inf_Allen_Boane*(1-pr_protect_quint_SP_Allen_Boane[i,1]);     
   pr_treated_I_tripl_new_SP_Allen_Boane[i,1]=  pr_treated_uninf_SP_Allen_Boane[i-1,1]*(1-freq_quint_Allen_Boane)*pr_prob_inf_Allen_Boane*(1-pr_protect_tripl_SP_Allen_Boane[i,1]);

   pr_treated_I_quint_SP_Allen_Boane[i,1]= pr_treated_I_quint_SP_Allen_Boane[i-1,1]+ pr_treated_I_quint_new_SP_Allen_Boane[i,1];     
   pr_treated_I_tripl_SP_Allen_Boane[i,1]= pr_treated_I_tripl_SP_Allen_Boane[i-1,1]+ pr_treated_I_tripl_new_SP_Allen_Boane[i,1];     

   pr_treated_uninf_SP_Allen_Boane[i,1]= pr_treated_uninf_SP_Allen_Boane[i-1,1] -pr_treated_I_quint_new_SP_Allen_Boane[i,1] - pr_treated_I_tripl_new_SP_Allen_Boane[i,1];

    //protection against each strain, evaluated for each time step
   pr_protect_quint_SP_AS_Allen_Boane[i,1]= exp(-((pr_time_Allen_Boane[i,1])/lambda_quint_SP_AS)^w_quint_SP_AS);
   pr_protect_tripl_SP_AS_Allen_Boane[i,1]= exp(-((pr_time_Allen_Boane[i,1])/lambda_tripl_SP_AS)^w_tripl_SP_AS);

   pr_treated_I_quint_new_SP_AS_Allen_Boane[i,1]=  pr_treated_uninf_SP_AS_Allen_Boane[i-1,1]*(freq_quint_Allen_Boane)*pr_prob_inf_Allen_Boane*(1-pr_protect_quint_SP_AS_Allen_Boane[i,1]);     
   pr_treated_I_tripl_new_SP_AS_Allen_Boane[i,1]=  pr_treated_uninf_SP_AS_Allen_Boane[i-1,1]*(1-freq_quint_Allen_Boane)*pr_prob_inf_Allen_Boane*(1-pr_protect_tripl_SP_AS_Allen_Boane[i,1]);

   pr_treated_I_quint_SP_AS_Allen_Boane[i,1]= pr_treated_I_quint_SP_AS_Allen_Boane[i-1,1]+ pr_treated_I_quint_new_SP_AS_Allen_Boane[i,1];     
   pr_treated_I_tripl_SP_AS_Allen_Boane[i,1]= pr_treated_I_tripl_SP_AS_Allen_Boane[i-1,1]+ pr_treated_I_tripl_new_SP_AS_Allen_Boane[i,1];     

   pr_treated_uninf_SP_AS_Allen_Boane[i,1]= pr_treated_uninf_SP_AS_Allen_Boane[i-1,1] -pr_treated_I_quint_new_SP_AS_Allen_Boane[i,1] - pr_treated_I_tripl_new_SP_AS_Allen_Boane[i,1];
   }

    //////Allen_Namaacha
    // everyone is susceptible in the first time point

 pr_treated_uninf_SP_Allen_Namaacha[1,1]=1;
 pr_treated_uninf_SP_AS_Allen_Namaacha[1,1]=1;

 // nobody is infected in the first time point

 pr_treated_I_quint_SP_Allen_Namaacha[1,1]=0;
 pr_treated_I_quint_new_SP_Allen_Namaacha[1,1]=0;
 pr_protect_quint_SP_Allen_Namaacha[1,1]=1;

 pr_treated_I_quint_SP_AS_Allen_Namaacha[1,1]=0;
 pr_treated_I_quint_new_SP_AS_Allen_Namaacha[1,1]=0;
 pr_protect_quint_SP_AS_Allen_Namaacha[1,1]=1;

 pr_treated_I_tripl_SP_Allen_Namaacha[1,1]=0;
 pr_treated_I_tripl_new_SP_Allen_Namaacha[1,1]=0;
 pr_protect_tripl_SP_Allen_Namaacha[1,1]=1;

 pr_treated_I_tripl_SP_AS_Allen_Namaacha[1,1]=0;
 pr_treated_I_tripl_new_SP_AS_Allen_Namaacha[1,1]=0;
 pr_protect_tripl_SP_AS_Allen_Namaacha[1,1]=1;

  pr_time_Allen_Namaacha[1,1]=0;

 for(i in 2:N_Allen_Namaacha) {
   pr_time_Allen_Namaacha[i,1]=pr_time_Allen_Namaacha[i-1,1]+dt;

   //protection against each strain, evaluated for each time step
   pr_protect_quint_SP_Allen_Namaacha[i,1]= exp(-((pr_time_Allen_Namaacha[i,1])/lambda_quint_SP)^w_quint_SP);
   pr_protect_tripl_SP_Allen_Namaacha[i,1]= exp(-((pr_time_Allen_Namaacha[i,1])/lambda_tripl_SP)^w_tripl_SP);

   pr_treated_I_quint_new_SP_Allen_Namaacha[i,1]=  pr_treated_uninf_SP_Allen_Namaacha[i-1,1]*(freq_quint_Allen_Namaacha)*pr_prob_inf_Allen_Namaacha*(1-pr_protect_quint_SP_Allen_Namaacha[i,1]);     
   pr_treated_I_tripl_new_SP_Allen_Namaacha[i,1]=  pr_treated_uninf_SP_Allen_Namaacha[i-1,1]*(1-freq_quint_Allen_Namaacha)*pr_prob_inf_Allen_Namaacha*(1-pr_protect_tripl_SP_Allen_Namaacha[i,1]);

   pr_treated_I_quint_SP_Allen_Namaacha[i,1]= pr_treated_I_quint_SP_Allen_Namaacha[i-1,1]+ pr_treated_I_quint_new_SP_Allen_Namaacha[i,1];     
   pr_treated_I_tripl_SP_Allen_Namaacha[i,1]= pr_treated_I_tripl_SP_Allen_Namaacha[i-1,1]+ pr_treated_I_tripl_new_SP_Allen_Namaacha[i,1];     

   pr_treated_uninf_SP_Allen_Namaacha[i,1]= pr_treated_uninf_SP_Allen_Namaacha[i-1,1] -pr_treated_I_quint_new_SP_Allen_Namaacha[i,1] - pr_treated_I_tripl_new_SP_Allen_Namaacha[i,1];

    //protection against each strain, evaluated for each time step
   pr_protect_quint_SP_AS_Allen_Namaacha[i,1]= exp(-((pr_time_Allen_Namaacha[i,1])/lambda_quint_SP_AS)^w_quint_SP_AS);
   pr_protect_tripl_SP_AS_Allen_Namaacha[i,1]= exp(-((pr_time_Allen_Namaacha[i,1])/lambda_tripl_SP_AS)^w_tripl_SP_AS);

   pr_treated_I_quint_new_SP_AS_Allen_Namaacha[i,1]=  pr_treated_uninf_SP_AS_Allen_Namaacha[i-1,1]*(freq_quint_Allen_Namaacha)*pr_prob_inf_Allen_Namaacha*(1-pr_protect_quint_SP_AS_Allen_Namaacha[i,1]);     
   pr_treated_I_tripl_new_SP_AS_Allen_Namaacha[i,1]=  pr_treated_uninf_SP_AS_Allen_Namaacha[i-1,1]*(1-freq_quint_Allen_Namaacha)*pr_prob_inf_Allen_Namaacha*(1-pr_protect_tripl_SP_AS_Allen_Namaacha[i,1]);

   pr_treated_I_quint_SP_AS_Allen_Namaacha[i,1]= pr_treated_I_quint_SP_AS_Allen_Namaacha[i-1,1]+ pr_treated_I_quint_new_SP_AS_Allen_Namaacha[i,1];     
   pr_treated_I_tripl_SP_AS_Allen_Namaacha[i,1]= pr_treated_I_tripl_SP_AS_Allen_Namaacha[i-1,1]+ pr_treated_I_tripl_new_SP_AS_Allen_Namaacha[i,1];     

   pr_treated_uninf_SP_AS_Allen_Namaacha[i,1]= pr_treated_uninf_SP_AS_Allen_Namaacha[i-1,1] -pr_treated_I_quint_new_SP_AS_Allen_Namaacha[i,1] - pr_treated_I_tripl_new_SP_AS_Allen_Namaacha[i,1];
   }

    //////Allen_Catuane
    // everyone is susceptible in the first time point

 pr_treated_uninf_SP_Allen_Catuane[1,1]=1;
 pr_treated_uninf_SP_AS_Allen_Catuane[1,1]=1;

 // nobody is infected in the first time point

 pr_treated_I_quint_SP_Allen_Catuane[1,1]=0;
 pr_treated_I_quint_new_SP_Allen_Catuane[1,1]=0;
 pr_protect_quint_SP_Allen_Catuane[1,1]=1;

 pr_treated_I_quint_SP_AS_Allen_Catuane[1,1]=0;
 pr_treated_I_quint_new_SP_AS_Allen_Catuane[1,1]=0;
 pr_protect_quint_SP_AS_Allen_Catuane[1,1]=1;

 pr_treated_I_tripl_SP_Allen_Catuane[1,1]=0;
 pr_treated_I_tripl_new_SP_Allen_Catuane[1,1]=0;
 pr_protect_tripl_SP_Allen_Catuane[1,1]=1;

 pr_treated_I_tripl_SP_AS_Allen_Catuane[1,1]=0;
 pr_treated_I_tripl_new_SP_AS_Allen_Catuane[1,1]=0;
 pr_protect_tripl_SP_AS_Allen_Catuane[1,1]=1;

  pr_time_Allen_Catuane[1,1]=0;

 for(i in 2:N_Allen_Catuane) {

   pr_time_Allen_Catuane[i,1]=pr_time_Allen_Catuane[i-1,1]+dt;

   //protection against each strain, evaluated for each time step
   pr_protect_quint_SP_Allen_Catuane[i,1]= exp(-((pr_time_Allen_Catuane[i,1])/lambda_quint_SP)^w_quint_SP);
   pr_protect_tripl_SP_Allen_Catuane[i,1]= exp(-((pr_time_Allen_Catuane[i,1])/lambda_tripl_SP)^w_tripl_SP);

   pr_treated_I_quint_new_SP_Allen_Catuane[i,1]=  pr_treated_uninf_SP_Allen_Catuane[i-1,1]*(freq_quint_Allen_Catuane)*pr_prob_inf_Allen_Catuane*(1-pr_protect_quint_SP_Allen_Catuane[i,1]);     
   pr_treated_I_tripl_new_SP_Allen_Catuane[i,1]=  pr_treated_uninf_SP_Allen_Catuane[i-1,1]*(1-freq_quint_Allen_Catuane)*pr_prob_inf_Allen_Catuane*(1-pr_protect_tripl_SP_Allen_Catuane[i,1]);

   pr_treated_I_quint_SP_Allen_Catuane[i,1]= pr_treated_I_quint_SP_Allen_Catuane[i-1,1]+ pr_treated_I_quint_new_SP_Allen_Catuane[i,1];     
   pr_treated_I_tripl_SP_Allen_Catuane[i,1]= pr_treated_I_tripl_SP_Allen_Catuane[i-1,1]+ pr_treated_I_tripl_new_SP_Allen_Catuane[i,1];     

   pr_treated_uninf_SP_Allen_Catuane[i,1]= pr_treated_uninf_SP_Allen_Catuane[i-1,1] -pr_treated_I_quint_new_SP_Allen_Catuane[i,1] - pr_treated_I_tripl_new_SP_Allen_Catuane[i,1];

    //protection against each strain, evaluated for each time step
   pr_protect_quint_SP_AS_Allen_Catuane[i,1]= exp(-((pr_time_Allen_Catuane[i,1])/lambda_quint_SP_AS)^w_quint_SP_AS);
   pr_protect_tripl_SP_AS_Allen_Catuane[i,1]= exp(-((pr_time_Allen_Catuane[i,1])/lambda_tripl_SP_AS)^w_tripl_SP_AS);

   pr_treated_I_quint_new_SP_AS_Allen_Catuane[i,1]=  pr_treated_uninf_SP_AS_Allen_Catuane[i-1,1]*(freq_quint_Allen_Catuane)*pr_prob_inf_Allen_Catuane*(1-pr_protect_quint_SP_AS_Allen_Catuane[i,1]);     
   pr_treated_I_tripl_new_SP_AS_Allen_Catuane[i,1]=  pr_treated_uninf_SP_AS_Allen_Catuane[i-1,1]*(1-freq_quint_Allen_Catuane)*pr_prob_inf_Allen_Catuane*(1-pr_protect_tripl_SP_AS_Allen_Catuane[i,1]);

   pr_treated_I_quint_SP_AS_Allen_Catuane[i,1]= pr_treated_I_quint_SP_AS_Allen_Catuane[i-1,1]+ pr_treated_I_quint_new_SP_AS_Allen_Catuane[i,1];     
   pr_treated_I_tripl_SP_AS_Allen_Catuane[i,1]= pr_treated_I_tripl_SP_AS_Allen_Catuane[i-1,1]+ pr_treated_I_tripl_new_SP_AS_Allen_Catuane[i,1];     

   pr_treated_uninf_SP_AS_Allen_Catuane[i,1]= pr_treated_uninf_SP_AS_Allen_Catuane[i-1,1] -pr_treated_I_quint_new_SP_AS_Allen_Catuane[i,1] - pr_treated_I_tripl_new_SP_AS_Allen_Catuane[i,1];

   }

//RHXNJ
  // everyone is susceptible in the first time point

  pr_treated_uninf_SP_RHXNJ[1,1]=1;

  // nobody is infected in the first time point

  pr_treated_I_quint_SP_RHXNJ[1,1]=0;
  pr_treated_I_quint_new_SP_RHXNJ[1,1]=0;
  pr_protect_quint_SP_RHXNJ[1,1]=1;

  pr_treated_I_tripl_SP_RHXNJ[1,1]=0;
  pr_treated_I_tripl_new_SP_RHXNJ[1,1]=0;
  pr_protect_tripl_SP_RHXNJ[1,1]=1;

   pr_time_RHXNJ[1,1]=0;

  for(i in 2:N_RHXNJ) {
    pr_time_RHXNJ[i,1]=pr_time_RHXNJ[i-1,1]+dt;
    pr_protect_quint_SP_RHXNJ[i,1]= exp(-((pr_time_RHXNJ[i,1])/lambda_quint_SP)^w_quint_SP);
    pr_protect_tripl_SP_RHXNJ[i,1]= exp(-((pr_time_RHXNJ[i,1])/lambda_tripl_SP)^w_tripl_SP);
    pr_treated_I_quint_new_SP_RHXNJ[i,1]=  pr_treated_uninf_SP_RHXNJ[i-1,1]*(freq_quint_RHXNJ)*pr_prob_inf_RHXNJ*(1-pr_protect_quint_SP_RHXNJ[i,1]);     
    pr_treated_I_tripl_new_SP_RHXNJ[i,1]=  pr_treated_uninf_SP_RHXNJ[i-1,1]*(1-freq_quint_RHXNJ)*pr_prob_inf_RHXNJ*(1-pr_protect_tripl_SP_RHXNJ[i,1]);
    pr_treated_I_quint_SP_RHXNJ[i,1]= pr_treated_I_quint_SP_RHXNJ[i-1,1]+ pr_treated_I_quint_new_SP_RHXNJ[i,1];     
    pr_treated_I_tripl_SP_RHXNJ[i,1]= pr_treated_I_tripl_SP_RHXNJ[i-1,1]+ pr_treated_I_tripl_new_SP_RHXNJ[i,1];     
    pr_treated_uninf_SP_RHXNJ[i,1]= pr_treated_uninf_SP_RHXNJ[i-1,1] -pr_treated_I_quint_new_SP_RHXNJ[i,1] - pr_treated_I_tripl_new_SP_RHXNJ[i,1];

    }

       // everyone is susceptible in the first time point
  pr_treated_uninf_SP_RZENT[1,1]=1;
  // nobody is infected in the first time point
  pr_treated_I_quint_SP_RZENT[1,1]=0;
  pr_treated_I_quint_new_SP_RZENT[1,1]=0;
  pr_protect_quint_SP_RZENT[1,1]=1;
  pr_treated_I_tripl_SP_RZENT[1,1]=0;
  pr_treated_I_tripl_new_SP_RZENT[1,1]=0;
  pr_protect_tripl_SP_RZENT[1,1]=1;
   pr_time_RZENT[1,1]=0;

  for(i in 2:N_RZENT) {

    pr_time_RZENT[i,1]=pr_time_RZENT[i-1,1]+dt;
    pr_protect_quint_SP_RZENT[i,1]= exp(-((pr_time_RZENT[i,1])/lambda_quint_SP)^w_quint_SP);
    pr_protect_tripl_SP_RZENT[i,1]= exp(-((pr_time_RZENT[i,1])/lambda_tripl_SP)^w_tripl_SP);
    pr_treated_I_quint_new_SP_RZENT[i,1]=  pr_treated_uninf_SP_RZENT[i-1,1]*(freq_quint_RZENT)*pr_prob_inf_RZENT*(1-pr_protect_quint_SP_RZENT[i,1]);     
    pr_treated_I_tripl_new_SP_RZENT[i,1]=  pr_treated_uninf_SP_RZENT[i-1,1]*(1-freq_quint_RZENT)*pr_prob_inf_RZENT*(1-pr_protect_tripl_SP_RZENT[i,1]);
    pr_treated_I_quint_SP_RZENT[i,1]= pr_treated_I_quint_SP_RZENT[i-1,1]+ pr_treated_I_quint_new_SP_RZENT[i,1];     
    pr_treated_I_tripl_SP_RZENT[i,1]= pr_treated_I_tripl_SP_RZENT[i-1,1]+ pr_treated_I_tripl_new_SP_RZENT[i,1];     
    pr_treated_uninf_SP_RZENT[i,1]= pr_treated_uninf_SP_RZENT[i-1,1] -pr_treated_I_quint_new_SP_RZENT[i,1] - pr_treated_I_tripl_new_SP_RZENT[i,1];
    }

//NMMSB
      // everyone is susceptible in the first time point
  pr_treated_uninf_SP_NMMSB[1,1]=1;
  // nobody is infected in the first time point
  pr_treated_I_quint_SP_NMMSB[1,1]=0;
  pr_treated_I_quint_new_SP_NMMSB[1,1]=0;
  pr_protect_quint_SP_NMMSB[1,1]=1;
  pr_treated_I_tripl_SP_NMMSB[1,1]=0;
  pr_treated_I_tripl_new_SP_NMMSB[1,1]=0;
  pr_protect_tripl_SP_NMMSB[1,1]=1;
   pr_time_NMMSB[1,1]=0;

  for(i in 2:N_NMMSB) {

    pr_time_NMMSB[i,1]=pr_time_NMMSB[i-1,1]+dt;
    pr_protect_quint_SP_NMMSB[i,1]= exp(-((pr_time_NMMSB[i,1])/lambda_quint_SP)^w_quint_SP);
    pr_protect_tripl_SP_NMMSB[i,1]= exp(-((pr_time_NMMSB[i,1])/lambda_tripl_SP)^w_tripl_SP);
    pr_treated_I_quint_new_SP_NMMSB[i,1]=  pr_treated_uninf_SP_NMMSB[i-1,1]*(freq_quint_NMMSB)*pr_prob_inf_NMMSB*(1-pr_protect_quint_SP_NMMSB[i,1]);     
    pr_treated_I_tripl_new_SP_NMMSB[i,1]=  pr_treated_uninf_SP_NMMSB[i-1,1]*(1-freq_quint_NMMSB)*pr_prob_inf_NMMSB*(1-pr_protect_tripl_SP_NMMSB[i,1]);
    pr_treated_I_quint_SP_NMMSB[i,1]= pr_treated_I_quint_SP_NMMSB[i-1,1]+ pr_treated_I_quint_new_SP_NMMSB[i,1];     
    pr_treated_I_tripl_SP_NMMSB[i,1]= pr_treated_I_tripl_SP_NMMSB[i-1,1]+ pr_treated_I_tripl_new_SP_NMMSB[i,1];     
    pr_treated_uninf_SP_NMMSB[i,1]= pr_treated_uninf_SP_NMMSB[i-1,1] -pr_treated_I_quint_new_SP_NMMSB[i,1] - pr_treated_I_tripl_new_SP_NMMSB[i,1];
    }

//PEADD
   // everyone is susceptible in the first time point
  pr_treated_uninf_SP_PEADD[1,1]=1;
  // nobody is infected in the first time point
  pr_treated_I_quint_SP_PEADD[1,1]=0;
  pr_treated_I_quint_new_SP_PEADD[1,1]=0;
  pr_protect_quint_SP_PEADD[1,1]=1;
  pr_treated_I_tripl_SP_PEADD[1,1]=0;
  pr_treated_I_tripl_new_SP_PEADD[1,1]=0;
  pr_protect_tripl_SP_PEADD[1,1]=1;
   pr_time_PEADD[1,1]=0;

  for(i in 2:N_PEADD) {
    pr_time_PEADD[i,1]=pr_time_PEADD[i-1,1]+dt;
    pr_protect_quint_SP_PEADD[i,1]= exp(-((pr_time_PEADD[i,1])/lambda_quint_SP)^w_quint_SP);
    pr_protect_tripl_SP_PEADD[i,1]= exp(-((pr_time_PEADD[i,1])/lambda_tripl_SP)^w_tripl_SP);
    pr_treated_I_quint_new_SP_PEADD[i,1]=  pr_treated_uninf_SP_PEADD[i-1,1]*(freq_quint_PEADD)*pr_prob_inf_PEADD*(1-pr_protect_quint_SP_PEADD[i,1]);     
    pr_treated_I_tripl_new_SP_PEADD[i,1]=  pr_treated_uninf_SP_PEADD[i-1,1]*(1-freq_quint_PEADD)*pr_prob_inf_PEADD*(1-pr_protect_tripl_SP_PEADD[i,1]);
    pr_treated_I_quint_SP_PEADD[i,1]= pr_treated_I_quint_SP_PEADD[i-1,1]+ pr_treated_I_quint_new_SP_PEADD[i,1];     
    pr_treated_I_tripl_SP_PEADD[i,1]= pr_treated_I_tripl_SP_PEADD[i-1,1]+ pr_treated_I_tripl_new_SP_PEADD[i,1];     
    pr_treated_uninf_SP_PEADD[i,1]= pr_treated_uninf_SP_PEADD[i-1,1] -pr_treated_I_quint_new_SP_PEADD[i,1] - pr_treated_I_tripl_new_SP_PEADD[i,1];
    }

////KZN
  // everyone is susceptible in the first time point
  pr_treated_uninf_SP_KZN[1,1]=1;
  // nobody is infected in the first time point
  pr_treated_I_quint_SP_KZN[1,1]=0;
  pr_treated_I_quint_new_SP_KZN[1,1]=0;
  pr_protect_quint_SP_KZN[1,1]=1;

   pr_time_KZN[1,1]=0;

  for(i in 2:N_KZN) {
    pr_time_KZN[i,1]=pr_time_KZN[i-1,1]+dt;
    pr_protect_quint_SP_KZN[i,1]= exp(-((pr_time_KZN[i,1])/lambda_quint_SP)^w_quint_SP);
    pr_treated_I_quint_new_SP_KZN[i,1]=  pr_treated_uninf_SP_KZN[i-1,1]*pr_prob_inf_KZN*(1-pr_protect_quint_SP_KZN[i,1]);     
    pr_treated_I_quint_SP_KZN[i,1]= pr_treated_I_quint_SP_KZN[i-1,1]+ pr_treated_I_quint_new_SP_KZN[i,1];     
    pr_treated_uninf_SP_KZN[i,1]= pr_treated_uninf_SP_KZN[i-1,1] -pr_treated_I_quint_new_SP_KZN[i,1] ;
    }

}

