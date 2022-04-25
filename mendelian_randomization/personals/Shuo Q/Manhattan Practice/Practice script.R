# "D\\Software\\R-4.1.3\\Projects\\Mendelian Randomization\\material"
library(tidyverse)
library(qqman)
library(data.table)
setwd("material")

t1 <- read.table("4611.37.tsv", header = T, sep = '\t', fill = T)
# na.omit (t1, cols = "ci_upper","ci_lower","effect_allele_frequency","odd_ratio") na omit is not necessary because NA in the data will not affect the graph. 
t1$chromosome <- gsub("chr","", t1$chromosome)
t1$chromosome <- as.numeric(t1$chromosome)

manhattan(
  t1,
  snp = "variant_id",
  chr = "chromosome", # this section only accept the variables as numebrs, so make sure to convert those into numbers.
  bp = "base_pair_location",
  p = "p_value",

  main = "Manhattan Plot", # the name of the plot
  ylim = c(0,10), # make sure to set up the ylim, important
  col = c("blue4","orange3") # the color will use, this will show two colors in systemmetic patterns.
)



