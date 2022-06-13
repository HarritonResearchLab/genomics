#practice
setwd("material")
# t1 = read.table(file = '4611.37.tsv', sep = '\t', header = TRUE, fill = T)
# t2 = read.table(file = '4612.37.tsv', sep = '\t', header = TRUE, fill = T), 
data <- fread ("4611.37.tsv", header = T, na.strings = c("NA"))
na.omit (all_data, cols = "ci_upper")
###########---------------------------------------


#analysis
# head (t1)
t2$chromosome <- gsub("chr","",t2$chromosome)
t2$chromosome <- as.numeric(t2$chromosome)

#manhattanʧЧ not working because of NA value

manhattan(t1,chr = "chromosome", bp = "base_pair_location",snp = "SNP", p = "P.value")
t1_exp <- read_exposure_data(data1)



library(TwoSampleMR)

# List available GWASs
ao <- available_outcomes()

# Get instruments
exposure_dat <- extract_instruments("ieu-a-2")

# Get effects of instruments on outcome
outcome_dat <- extract_outcome_data(snps=exposure_dat$SNP, outcomes="ieu-a-7")

# Harmonise the exposure and outcome data
dat <- harmonise_data(exposure_dat, outcome_dat)

# Perform MR
res <- mr(dat)