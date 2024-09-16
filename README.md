# Impact of *dhps* mutations on sulfadoxine-pyrimethamine protective efficacy and implications for malaria chemoprevention
:mosquito:🦟:test_tube:🧪:dna: 🧬
 
## Overview
This repository contains the code used to analyse data on new infections from sulfadoxine-pyrimethamine (SP) alone or in combination with artesunate (AS). 
The corresponding scientific article is available at: https://dx.doi.org/10.2139/ssrn.4856036
The code and data to reproduce all figures presented in main text, and supplementary information of the associated publication is available within this repository.
Andria Mousa, Gina Cuomo-Dannenburg, Hayley A. Thompson, David J. Bell, Umberto D’Alessandro,  Roly Gosling, Alain Nahum, Karen I. Barnes, Jaishree Raman, Lesley Workmann, Yong See Foo, Jennifer A. Flegg, Emma Filtenborg Hocke, Helle Hansson, Ana Chopo-Pizarro, Khalid B. Beshir, Michael Alifrangis, R. Matthew Chico, Colin J. Sutherland, Lucy C. Okell, Cally Roper
 

## Repo Contents
- [data](./data): this folder includes the data required to reproduce the analysis and results. This includes **combined_data.csv** (new infection data for all studies) and **day0_frequencies**. It also includes **Data_dictionary.doc**.
- **deterministic_combined_all.stan**: this file is the deterministic model file writtern in rstan. 
- **R_script_combined_all.R** : this file is the R script which pools and analyses data from all studies using **deterministic_combined_all.stan**. This includes:
 --reading in data and converting to model inputs 
 --running stan model 
 --checking model diagnostics (including R-hat and ESS)
 --traceplots and correlation plots (not presented in the manuscript)
 --summarizing model outputs: median and 95%Credible Intervals of estimated parameters (presented in the manuscript and supplementary materials)
 --calculation of the mean duration of protection using estimated shape and scale parameters (and median & 95%Credible intervals across 10000 iterations)
- **model_all_combined.RData**: this file stores the model (MCMC) outputs produced using **R_script_combined_all.R**. 
- **Figures**: this folder contains code related to figures presented in the main manuscript and supplementary infromation. These are using both data and outputs from the model and include:
 -- reading in model predictions (from stan model generated quantities)
 -- for each arm and site generates predicted proportion reinfected vs observed proportion reinfected (by genotype)
 -- supplementary plot of day 0 frequency vs posterior distribution of genotype frequency by trial site
 -- plots of protective efficacy over time since treatment (for SP/SPAS and additional arms where available)

 
## Software Requirements
Running the code contained in this repository requires the following:
- The R Programming Language (Version 4.3.1 used here) 
- The packages **ggplot2**, **cowplot**, **dplyr**, **bayesplot**, **DescTools**    
- The package **rstan** :  This work utilises the probabilistic programming language Stan for model fitting (implemented in R via the package rstan). Stan is a program for analysis of Bayesian models using Markov Chain Monte Carlo (MCMC) simulation. More information and details about the software and its use via R are available here: https://github.com/stan-dev/rstan/wiki . Guidelines on how to install rstan can be found here: https://github.com/stan-dev/rstan/wiki/RStan-Getting-Started .
 ## Installation Guide and Instructions for Use
The following instructions require that all the relevant `R` packages have been installed by the user and that rstan has been installed. To replicate and reproduce the analyses presented in this paper, do the following: 
1. Clone this Github repository and make a local copy on your desktop.
2. Run the `R` code scripts for the particular part of the analysis you are trying to reproduce.
