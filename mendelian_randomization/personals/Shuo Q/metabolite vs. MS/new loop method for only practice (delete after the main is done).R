# ------------------ metabolite vs. MS
library(tidyverse)
library(TwoSampleMR)
library(data.table)


exposures <- c("met-d-bOHbutyrate", "met-c-846", "met-a-311")
exposures <- c("met-d-bOHbutyrate", "met-c-846", "met-a-311", "met-a-420", "met-a-471", "met-a-421", "met-a-393", "met-a-427", "met-d-Acetoacetate", "met-c-838", "met-a-446", "met-a-386")

outcomes <- c("ieu-b-18", "finn-b-G6_MS", "ukb-b-17670")


# outcomes as exa ( reform could be included in this loop so don't need to read the raw data again)
for(i in 1:length(exposures)){
  print("------------- new -------------")
  expo_data <- extract_instruments(exposures[i])
  if(is.null(expo_data)){
    print("exposure data missing")
    next
  }else{
    print("expo ok")
  }
  out_data <- extract_outcome_data(snps = expo_data$SNP, outcomes = outcomes[2]) # change here
  
  print(exposures[i])
  print(outcomes[2]) # change here
  print("===================== extract down =====================")
  
  # analysis
  hm_data <- harmonise_data(expo_data, out_data)
  
  mr_data <- mr(hm_data)
  
  intercept_data <- mr_pleiotropy_test(hm_data)
  
  het_data <- mr_heterogeneity(hm_data)
  
  print("===================== analysis down =====================")
  
  if (dim(het_data)[1] == 0 & dim(intercept_data)[1] == 0){
    print ("missing")
  }else if (dim(het_data)[1] == 0 | dim(intercept_data)[1] == 0){
    print ("single missing")
  }else{
    print("OK")
  }
  # plots
  plot <- mr_scatter_plot(mr_data, hm_data)
  plot(plot[[1]])
  
  print("===================== plot down =====================")
  # here paste
  print("===================== file saved =====================")
}




# reform table
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
  Egger_intercept = intercept_data[1,5],
  pval_intercept = intercept_data[1,7],
  # Heterogenous missing
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
# need to assign names and save things
print("===================== reform down =====================")

#save the file with .csv
setwd("D:/Software/Github/genomics/mendelian_randomization/personals/Shuo Q/metabolite vs. MS/results")

filename <- paste(exposures[i],".csv", sep = "")
write.csv(reformed_table, file = filename, row.names = F)
