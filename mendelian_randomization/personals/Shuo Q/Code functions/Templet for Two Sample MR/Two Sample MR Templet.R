# Topic here
library(tidyverse)
library(TwoSampleMR)
library(data.table)

# input exposures and outcomes, ex: outcomes <- c("ieu-b-18", "finn-b-G6_MS", "ukb-b-17670")
exposures <- c("")
outcomes <- c("")

# which outcome are you running?
x =  # input should be a number

# where do you want to save the file?
data_wd <- paste("D:/Software/Github/genomics/mendelian_randomization/personals/Shuo Q/")
graph_wd <- paste("D:/Software/Github/genomics/mendelian_randomization/personals/Shuo Q/")

# main loop body when outcome is the first from the list of outcomes
for(i in 1:length(exposures)){
  print("------------- new -------------")
  
  expo_data <- extract_instruments(exposures[i])
  out_data <- extract_outcome_data(snps = expo_data$SNP, outcomes = outcomes[x])
  
  # check if there are enough SNPs and if exposure data or outcome data is missing
  if(is.null(expo_data)){
    print("exposure data missing")
    next
  }else if(is.null(out_data)){
    print("outcome data missing")
    next
  }else{
    print("expo out ok")
  }
  
  print(exposures[i])
  print("vs.")
  print(outcomes[x])
  print("===================== extract done =====================")
  
  # analysis
  hm_data <- harmonise_data(expo_data, out_data)
  
  mr_data <- mr(hm_data) # change here if want to force to use a different method
  
  intercept_data <- mr_pleiotropy_test(hm_data)
  
  het_data <- mr_heterogeneity(hm_data)
  
  print("===================== analysis done =====================")
  
  # plots
  plot <- mr_scatter_plot(mr_data, hm_data)
  
  # save plots
  setwd(graph_wd)
  png(paste(exposures[i],"vs. ",outcomes[1] , ".png", sep = ""), width = 600, height = 500, res = 120)
  print(plot[[1]])
  dev.off()
  
  print("===================== plot saved =====================")
  
  # reform table
  if(mr_data$method == "Wald ratio"){
    print("Wald ratio")
    reformed_table <- data.frame(
      GWAS_ID = exposures[i],
      b_Wald_ratio = mr_data[1,7],
      se_Wald_ratio = mr_data[1,8],
      pval_Wald_ratio = mr_data[1,9],
      nsnps	= mr_data[1,6]
    )
  }else if (is.null(het_data) & is.null(intercept_data)){
    print ("het and int missing")
    reformed_table <- data.frame(
      GWAS_ID = exposures[i],
      # IVW method  3
      b_IVW_MRE = mr_data[3,7],
      se_IVW_MRE = mr_data[3,8],
      pval_IVW_MRE = mr_data[3,9],
      # Egger method  1
      b_Egger = mr_data[1,7],
      se_Egger = mr_data[1,8],
      pval_Egger = mr_data[1,9],
      # intercept missing
      Egger_intercept = NA,
      pval_intercept = NA,
      # Heterogenous missing
      Het_IVW_pval = NA,
      Het_Egger_pval = NA,
      # Weighted median  2
      b_W_Med = mr_data[2,7],
      se_W_Med = mr_data[2,8],
      pval_W_Med = mr_data[2,9],
      # Weighted mode  5
      b_W_Mod = mr_data[5,7],
      se_W_Mod = mr_data[5,8],
      pval_W_Mod = mr_data[5,9],
      # then
      nsnps	= mr_data[1,6]
    )
  }else{
    print("het int OK")
    reformed_table <- data.frame(
      GWAS_ID = exposures[i],
      # IVW method  3
      b_IVW_MRE = mr_data[3,7],
      se_IVW_MRE = mr_data[3,8],
      pval_IVW_MRE = mr_data[3,9],
      # Egger method  1
      b_Egger = mr_data[1,7],
      se_Egger = mr_data[1,8],
      pval_Egger = mr_data[1,9],
      # intercept
      Egger_intercept = intercept_data[1,5],
      pval_intercept = intercept_data[1,7],
      # Heterogenous
      Het_IVW_pval = het_data[2,8],
      Het_Egger_pval = het_data[1,8],
      # Weighted median  2
      b_W_Med = mr_data[2,7],
      se_W_Med = mr_data[2,8],
      pval_W_Med = mr_data[2,9],
      # Weighted mode  5
      b_W_Mod = mr_data[5,7],
      se_W_Mod = mr_data[5,8],
      pval_W_Mod = mr_data[5,9],
      # then
      nsnps	= mr_data[1,6]
    )
  }
  
  # need to assign names and save things
  print("===================== reform done =====================")
  
  #save the file with .csv
  setwd(data_wd)
  
  if(mr_data$method == "Wald ratio"){
    filename <- paste("Wald ratio__", exposures[i], "vs. ", outcomes[x],".csv", sep = "")
  }else {
    filename <- paste(exposures[i], "vs. ", outcomes[x],".csv", sep = "")
  }
  
  write.csv(reformed_table, file = filename, row.names = F)
  
  print("===================== file saved =====================")
}






