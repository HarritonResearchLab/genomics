# enable the libraries
library(tidyverse)
library(data.table)
library(TwoSampleMR)

# --------------------work starts here
# exposure IDs -- BMI: ieu-b-40 ; vitamin D: ebi-a-GCST005367 ; 
# outcome IDS -- multiple sclerosis: ieu-b-18 ; GWAS in Finnish: finn-b-G6_MS ; GWAS in UK Biobank: ukb-b-17670      

# --------- get the instrument variable from exposure
bmi_ins <- extract_instruments('ieu-b-40')
vit_ins <- extract_instruments('ebi-a-GCST005367')

# --------- get the outcomes from outcome 
# for BMI
bmi_example_out <- extract_outcome_data(snps = bmi_ins$SNP, outcomes = 'ieu-b-18')
bmi_Finnish_out <- extract_outcome_data(snps = bmi_ins$SNP, outcomes = 'finn-b-G6_MS')
bmi_UK_out <- extract_outcome_data(snps = bmi_ins$SNP, outcomes = 'ukb-b-17670')
#for Vitamin D
vit_exa_out <- extract_outcome_data(snps = vit_ins$SNP, outcomes = "ieu-b-18")
vit_Fin_out <- extract_outcome_data(snps = vit_ins$SNP, outcomes = 'finn-b-G6_MS')
vit_UK_out <- extract_outcome_data(snps = vit_ins$SNP, outcomes = 'ukb-b-17670')
  
# --------- harmonise data for BMI vs outcomes
bmi_exa_hm <- harmonise_data(bmi_ins, bmi_example_out)
bmi_Fin_hm <- harmonise_data(bmi_ins, bmi_Finnish_out)
bmi_UK_hm <- harmonise_data(bmi_ins, bmi_UK_out)

# --------- harmonise data for Vitamin D vs outcomes
vit_exa_hm <- harmonise_data(vit_ins, vit_exa_out)
vit_Fin_hm <- harmonise_data(vit_ins, vit_Fin_out)
vit_UK_hm <- harmonise_data(vit_ins, vit_UK_out)

# ---------- Perform MR for BMI(heard about for loop..... try it later)
bmi_exa_mr <- mr(bmi_exa_hm)
bmi_Fin_mr <- mr(bmi_Fin_hm)
bmi_UK_mr <- mr(bmi_UK_hm)
# plot functions
bmi_exa_plot <- mr_scatter_plot(bmi_exa_mr, bmi_exa_hm)
bmi_Fin_plot <- mr_scatter_plot(bmi_Fin_mr, bmi_Fin_hm)
bmi_UK_plot <- mr_scatter_plot(bmi_UK_mr, bmi_UK_hm)

# get plot printed
bmi_exa_plot[[1]]
bmi_Fin_plot[[1]]
bmi_UK_plot[[1]]

# ---------- Perform MR for Vitamin D
vit_exa_mr <- mr(vit_exa_hm)
vit_Fin_mr <- mr(vit_Fin_hm)
vit_UK_mr <- mr(vit_UK_hm)
# plot functions
vit_exa_plot <- mr_scatter_plot(vit_exa_mr, vit_exa_hm)
vit_Fin_plot <- mr_scatter_plot(vit_Fin_mr, vit_Fin_hm)
vit_UK_plot <- mr_scatter_plot(vit_UK_mr, vit_UK_hm)

# get plot printed
vit_exa_plot[[1]]
vit_Fin_plot[[1]]
vit_UK_plot[[1]]

# save tables
write.csv(bmi_exa_mr, file = "bmi_exa.csv", row.names = F)
write.csv(bmi_Fin_mr, file = "bmi_Fin.csv", row.names = F)
write.csv(bmi_UK_mr, file = "bmi_UK.csv", row.names = F)

write.csv(vit_exa_mr, file = "vit_exa.csv", row.names = F)
write.csv(vit_Fin_mr, file = "vit_Fin.csv", row.names = F)
write.csv(vit_UK_mr, file = "vit_UK.csv", row.names = F)

# Het Test
bmi_exa_het <- mr_heterogeneity(bmi_exa_hm)
bmi_Fin_het <- mr_heterogeneity(bmi_Fin_hm)
bmi_UK_het <- mr_heterogeneity(bmi_UK_hm)

vit_exa_het <- mr_heterogeneity(vit_exa_hm)
vit_Fin_het <- mr_heterogeneity(vit_Fin_hm)
vit_UK_het <- mr_heterogeneity(vit_UK_hm)
# ----------------------------------------------------
write.csv(bmi_exa_het, file = "bmi_exa_het.csv",row.names = F)
write.csv(bmi_Fin_het, file = "bmi_Fin_het.csv",row.names = F)
write.csv(bmi_UK_het, file = "bmi_UK_het.csv",row.names = F)

write.csv(vit_exa_het, file = "vit_exa_het.csv",row.names = F)
write.csv(vit_Fin_het, file = "vit_Fin_het.csv",row.names = F)
write.csv(vit_UK_het, file = "vit_UK_het.csv",row.names = F)

# intercept test
bmi_exa_int <- mr_pleiotropy_test(bmi_exa_hm)
bmi_Fin_int <- mr_pleiotropy_test(bmi_Fin_hm)
bmi_UK_int <- mr_pleiotropy_test(bmi_UK_hm)

vit_exa_int <- mr_pleiotropy_test(vit_exa_hm)
vit_Fin_int <- mr_pleiotropy_test(vit_Fin_hm)
vit_UK_int <- mr_pleiotropy_test(vit_UK_hm)
# -----------------------------------------------------
write.csv(bmi_exa_int, file = "bmi_exa_int.csv",row.names = F)
write.csv(bmi_Fin_int, file = "bmi_Fin_int.csv",row.names = F)
write.csv(bmi_UK_int, file = "bmi_UK_int.csv",row.names = F)

write.csv(vit_exa_int, file = "vit_exa_int.csv",row.names = F)
write.csv(vit_Fin_int, file = "vit_Fin_int.csv",row.names = F)
write.csv(vit_UK_int, file = "vit_UK_int.csv",row.names = F)

setwd("D:/Software/Github/genomics/mendelian_randomization/personals/Shuo Q/BMI, VD MR/tables/raw")







