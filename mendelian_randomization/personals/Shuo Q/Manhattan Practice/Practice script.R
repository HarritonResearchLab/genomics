# "D\\Software\\R-4.1.3\\Projects\\Mendelian Randomization\\material"
library(tidyverse)
library(qqman)
library(data.table)
setwd("material")

t1 <- read.table("4611.37.tsv", header = T, sep = '\t', fill = T)
# na.omit (t1, cols = "ci_upper","ci_lower","effect_allele_frequency","odd_ratio")
t1$chromosome <- gsub("chr","", t1$chromosome)
t1$chromosome <- as.numeric(t1$chromosome)

manhattan(
  t1,
  snp = "variant_id",
  chr = "chromosome",
  bp = "base_pair_location",
  p = "p_value",

  main = "Manhattan Plot",
  ylim = c(0,10),
  col = c("blue4","orange3")
)



