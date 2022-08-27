library(tidyverse)
library(TwoSampleMR)
library(data.table)



expo <- extract_instruments("met-c-838")
out <- extract_outcome_data(expo$SNP, outcomes = "ieu-b-18")
hm_data <- harmonise_data(expo, out)
mr_data <- mr(hm_data)
het <- mr_heterogeneity(hm_data)
int <- mr_pleiotropy_test(hm_data)

