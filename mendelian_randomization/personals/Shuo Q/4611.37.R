# install the packages and get the library

#install.packages("tidyverse") --- done
#install.packages("devtools") --- done
#install.packages("qqman")
#install_github("MRCIEU/TwoSampleMR") --- done, based on devtools.
#remove.packages() --- remove package from computer
library(data.table)
library(tidyverse)
library(TwoSampleMR)
library(qqman)
#library(devtools)
#devtools::install_github("MRCIEU/TwoSampleMR")
#devtools::install_github("MRCIEU/MRInstruments")
# get it to work and make sure the data is read

setwd("material")


# get exposure data from data table 4611.37
path_1 = "D:\\Software\\R-4.1.3\\Projects\\Mendelian Randomization\\material\\4611.37.tsv"
t1_exp  <- read_exposure_data(
  filename = path_1,
  sep = "\t",
  snp_col = "variant_id",
  beta_col = "beta",
  se_col ="standard_error",
  effect_allele_col = "effect_allele",
  other_allele_col = "other_allele",
  pval_col = "p_value",
  samplesize_col = "n",
)

head(t1_exp)

# there is no pheno, need to be checked

# get outcome table to find the correlated id number, HDL cholesterol
ao <- available_outcomes()
head(subset(ao, select=c(traits, id)))

chd_out_dat <- extract_outcome_data(snps = t1_exp$SNP, outcomes = "ieu-a-7")

# write_tsv(HDL_out_dat,"D:\\Software\\R-4.1.3\\Projects\\Mendelian Randomization\\material\\prep\\HDL_out.tsv")

HDLHD <- harmonise_data(bmi_exp_dat,chd_out_dat)

sid <- mr(HDLHD)

#  -----------------scatter plot for MR
plot_1 <- mr_scatter_plot(sid, HDLHD)
print(plot_1) # oh this works interesting. how about plot_1 [[1]]
# plot_1 [[1]] ok nice this works too

#  -----------------Forest plot for MR
sid_single <- mr_singlesnp(HDLHD)
plot_2 <- mr_forest_plot(sid_single)
print(plot_2)

#  -----------------Leave one out plot
sid_loo <- mr_leaveoneout(HDLHD)
plot_3 <- mr_leaveoneout_plot (sid_loo)
print(plot_3)
