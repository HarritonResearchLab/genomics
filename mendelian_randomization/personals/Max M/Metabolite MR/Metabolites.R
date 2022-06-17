library(TwoSampleMR)
library(MRInstruments)
library(plyr)
library(tibble)
data("gwas_catalog")

exposures <- c("met-d-bOHbutyrate",
               "met-c-846",
               "met-a-311",
               "met-a-420",
               "met-a-471",
               "met-a-421",
               "met-a-393",
               "met-a-427",
               "met-d-Acetoacetate",
               "met-c-838",
               "met-d-Acetate",
               "met-c-839",
               "met-a-446",
               "met-a-386")

outcomes <- c("ieu-b-18", "finn-b-G6_MS", "ukb-b-17670")

############################# Normal MR #############################


# extract_instruments returns null w/ others
working_exposures <- c("met-d-bOHbutyrate",
                       "met-a-471", 
                       "met-a-421", 
                       "met-a-427", 
                       "met-d-Acetoacetate",
                       "met-d-Acetate")

for (i in 1:length(working_exposures)){
  exposure_dat <- extract_instruments(working_exposures[i])
  for (j in 1:length(outcomes)){
    outcome_dat <- extract_outcome_data(exposure_dat$SNP, outcomes=outcomes[j])
    dat <- harmonise_data(exposure_dat, outcome_dat)
    res <- mr(dat)
    name <- paste(working_exposures[i], outcomes[j],sep="-")
    filename <- paste(name,".csv")
    capture.output(res, file = filename)
  }
}

############################# Multivariable MR #############################


exposure_dat <- mv_extract_exposures(exposures)
outcome_dat <- extract_outcome_data(exposure_dat$SNP, outcomes="ieu-b-18")
mvdat <- mv_harmonise_data(exposure_dat, outcome_dat)
mv_res_generic <- mv_multiple(mvdat)
bob <- c()

bob <- append(bob, mv_res_generic)
bob
exposure_dat <- mv_extract_exposures(exposures)
outcome_dat <- extract_outcome_data(exposure_dat$SNP, outcomes="finn-b-G6_MS")
mvdat <- mv_harmonise_data(exposure_dat, outcome_dat)
mv_res_finn <- mv_multiple(mvdat)

# Commented out exposures cause dimension errors and NaN pvals
not_wierd_exp <- c("met-d-bOHbutyrate",
               "met-a-471", 
               "met-a-421", 
               "met-a-427", 
               "met-d-Acetoacetate",
               "met-d-Acetate",
               "met-c-846",
               "met-a-311",
               "met-a-420",
               "met-a-393",
               #"met-c-838",
               #"met-c-839",
               #"met-a-446",
               "met-a-386")

exposure_dat <- mv_extract_exposures(not_wierd_exp)
outcome_dat <- extract_outcome_data(exposure_dat$SNP, outcomes="ukb-b-17670")
mvdat <- mv_harmonise_data(exposure_dat, outcome_dat)
mv_res_uk <- mv_multiple(mvdat)

mv_res <- c(mv_res_generic, mv_res_finn, mv_res_uk)
mv_df <- do.call(rbind.data.frame, mv_res)
write.csv(mv_df, "Multivariable_MR.csv", row.names=FALSE, quote=FALSE) 


