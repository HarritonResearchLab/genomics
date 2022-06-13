dim(table_name) <- c(5,8)


setwd("/Software/Github/genomics/mendelian_randomization/personals/Shuo Q/BMI, VD MR/tables/raw")
bmi_exa_mr <- read.csv("bmi_exa.csv", header = T, stringsAsFactors = F )
bmi_Fin_mr <- read.csv("bmi_Fin.csv", header = T, stringsAsFactors = T)

bmi_table <- rbind(bmi_exa_mr,bmi_Fin_mr)


for (i in table_name){
  
  reformed_table <- data.frame(
    # IVW method  3
    b_IVW_MRE = i[b],
    se_IVW_MRE = i[3,8],
    pval_IVW_MRE = i[3,9],
    # Egger method  1
    b_Egger = i[1,7],
    se_Egger = i[1,8],
    pval_Egger = i[1,9],
    # Weighted median  2
    b_W_Med = i[2,7],
    se_W_Med = i[2,8],
    pval_W_Med = i[2,9],
    # Weighted mode  5
    b_W_Mod = i[5,7],
    se_W_Mod = i[5,8],
    pval_W_Mod = i[5,9],
    # then
    nsnps	= i[1,6]
    # Heterogenous missing
    # intercept missing
  )
  #loop is not working, need to ask
  gettext("reformed" + table) <- reformed_table
  
}


reformed_table <- data.frame(
  # IVW method  3
  b_IVW_MRE = 1,
  se_IVW_MRE = 1,
  pval_IVW_MRE = 1,
  # Egger method  1
  b_Egger = 1,
  se_Egger = 1,
  pval_Egger = 1,
  # Weighted median  2
  b_W_Med = 1,
  se_W_Med = 1,
  pval_W_Med = 1,
  # Weighted mode  5
  b_W_Mod = 1,
  se_W_Mod = 1,
  pval_W_Mod = 1)
