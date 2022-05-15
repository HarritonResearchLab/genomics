library(TwoSampleMR)
library(MRInstruments)

data("gwas_catalog")

exposures <- c("ieu-b-40", "ebi-a-GCST005367")
outcomes <- c("ieu-b-18", "finn-b-G6_MS", "ukb-b-17670")



for (e in exposures){
  exposure <- extract_instruments(e)
  for (o in outcomes){
    outcome <- extract_outcome_data(snps=exposure$SNP, outcomes=o)
    dat <- harmonise_data(exposure, outcome)
    results <- mr(dat)
    
    p1 <- mr_scatter_plot(results, dat)
    plot(p1[[1]])
  }
}

