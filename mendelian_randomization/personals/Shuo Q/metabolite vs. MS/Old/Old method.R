# ------------------ metabolite vs. MS
library(tidyverse)
library(TwoSampleMR)
library(data.table)


exposures <- c("met-d-bOHbutyrate", "met-c-846", "met-a-311", "met-a-420", "met-a-471", "met-a-421", "met-a-393", "met-a-427", "met-d-Acetoacetate", "met-c-838", "met-a-446", "met-a-386")
outcomes <- c("ieu-b-18", "finn-b-G6_MS", "ukb-b-17670")

# 1. 3-Hydroxybutyrate: met-d-bOHbutyrate , met-c-846 , met-a-311
# multiple sclerosis: ieu-b-18 ; GWAS in Finnish: finn-b-G6_MS ; GWAS in UK Biobank: ukb-b-17670

expo_11 <- extract_instruments("met-d-bOHbutyrate")
expo_11 <- extract_instruments("met-d-bOHbutyrate")
out_11 <- extract_outcome_data(snps = expo_11$SNP, outcomes = "ieu-b-18")
hm_data <- harmonise_data(expo_11, out_11)
mr_data <- mr(hm_data)
intercept_data <- mr_pleiotropy_test(hm_data)
het_data <- mr_heterogeneity(hm_data)

plot <- mr_scatter_plot(mr_data, hm_data)
plot(plot[[1]])

reformed_table <- data.frame(
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

"met-c-846"
"ukb-b-17670"

expo_12 <- extract_instruments("met-c-846")
out_12 <- extract_outcome_data(snps = expo_12$SNP, outcomes = "ukb-b-17670")
hm_data  <- harmonise_data(expo_12, out_12)
intercept_data <- mr_pleiotropy_test(hm_data)
het_data <- mr_heterogeneity(hm_data)

head(het_data)

if (dim(het_data)[1] == 0 & dim(intercept_data)[1] == 0 ){
  reformed_table <- data.frame(
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
}else {
  reformed_table <- data.frame(
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
}



plot <- mr_scatter_plot(mr_data, hm_data)
plot(plot[[1]])





expo_13 <- extract_instruments("met-a-311")
head(expo_13)
out_13 <- extract_outcome_data(snps = expo_13$SNP, "ieu-b-18")
head(out_13)
hm_data <- harmonise_data(expo_13, out_13)
mr_data <- mr(hm_data)
intercept_data <- mr_pleiotropy_test(hm_data)
het_data <- mr_heterogeneity(hm_data)

plot <- mr_scatter_plot(mr_data, hm_data)
plot(plot[[1]])

reformed_table <- data.frame(
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

# 2. 2-Hydroxybutyrate: met-a-420
# multiple sclerosis: ieu-b-18 ; GWAS in Finnish: finn-b-G6_MS ; GWAS in UK Biobank: ukb-b-17670
expo_21 <- extract_instruments("met-a-420")
out_21 <- extract_outcome_data(snps = expo_21$SNP, "")



# 3. 2-Aminobbutyrate: met-a-471
# multiple sclerosis: ieu-b-18 ; GWAS in Finnish: finn-b-G6_MS ; GWAS in UK Biobank: ukb-b-17670
expo_31 <- extract_instruments("met-a-471")
out_31 <- extract_outcome_data(snps = expo_31$SNP, "")




# 4. 3-methyl-2-oxobutyrate: met-a-421
# multiple sclerosis: ieu-b-18 ; GWAS in Finnish: finn-b-G6_MS ; GWAS in UK Biobank: ukb-b-17670
expo_41 <- extract_instruments("met-a-421")
out_41 <- extract_outcome_data(snps = expo_41$SNP, "")





# 5. 3,4-dihyroxybutyrate: met-a-393
# multiple sclerosis: ieu-b-18 ; GWAS in Finnish: finn-b-G6_MS ; GWAS in UK Biobank: ukb-b-17670
expo_51 <- extract_instruments("met-a-393")
out_51 <- extract_outcome_data(snps = expo_51$SNP, "")




# 6. 2-hydroxyisobutyrate: met-a-427
# multiple sclerosis: ieu-b-18 ; GWAS in Finnish: finn-b-G6_MS ; GWAS in UK Biobank: ukb-b-17670
expo_61 <- extract_instruments("met-a-427")
out_61 <- extract_outcome_data(snps = expo_61$SNP, "")





# 7. Acetoacetate: met-d-Acetoacetate , met-c-838
# multiple sclerosis: ieu-b-18 ; GWAS in Finnish: finn-b-G6_MS ; GWAS in UK Biobank: ukb-b-17670
expo_71 <- extract_instruments("met-d-Acetoacetate")
out_71 <- extract_outcome_data(snps = expo_71$SNP, "")

expo_72 <- extract_instruments("met-c-838")
out_72 <- extract_outcome_data(snps = expo_72$SNP, "")


# 8. Acetate: met-d-Acetate , met-c-838
# multiple sclerosis: ieu-b-18 ; GWAS in Finnish: finn-b-G6_MS ; GWAS in UK Biobank: ukb-b-17670
expo_81 <- extract_instruments("met-d-Acetate")
out_81 <- extract_outcome_data(snps = expo_81$SNP, "")


expo_82 <- extract_instruments("met-c-838")
out_82 <- extract_outcome_data(snps = expo_82$SNP, "")


# 9. Indoleacetate: met-a-446
# multiple sclerosis: ieu-b-18 ; GWAS in Finnish: finn-b-G6_MS ; GWAS in UK Biobank: ukb-b-17670
expo_91 <- extract_instruments("met-a-446")
out_91 <- extract_outcome_data(snps = expo_91$SNP, "")




# 10. Phenylacetate: met-a-386
# multiple sclerosis: ieu-b-18 ; GWAS in Finnish: finn-b-G6_MS ; GWAS in UK Biobank: ukb-b-17670
expo_101 <- extract_instruments("met-a-386")
out_101 <- extract_outcome_data(snps = expo_101$SNP, "")





















