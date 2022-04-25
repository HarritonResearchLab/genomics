# prep

library(data.table)
library(tidyverse)
library(TwoSampleMR)
library(qqman)

# get data table 2 from data 4612.37.tsv
path_2 = "D:\\software\\R-4.1.3\\Projects\\Mendelian Randomization\\material\\4612.37.tsv"

t2 <- read_exposure_data(
  filename = path_2,
  snp_col = "rsid",
  beta_col = "beta",
  se_col ="standard_error",
  effect_allele_col = "A1",
  other_allele_col = "A2",
  pval_col = "P_value",
  samplesize_col = "N",
  chr_col = "chromosome",
  # what are those NAs?
)


