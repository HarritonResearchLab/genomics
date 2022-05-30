# packages

library(tidyverse)
library(data.table)

# reform data into tables
table_name <- c("bmi_exa_mr","bmi_Fin_mr","bmi_UK_mr","vit_exa_mr","vit_Fin_mr","vit_UK_mr")
bmi_exa_mr$b[3]
#old_table <- read.table(file = "table", header = T, sep = ",")

for (table in table_name){

  reformed_table <- data.frame(
  # IVW method  3
    b_IVW_MRE = table$b[3],
    se_IVW_MRE = table$se[3],
    pval_IVW_MRE = table$pval[3],
  # Egger method  1
    b_Egger = table$b[1],
    se_Egger = table$se[1],
    pval_Egger = table$pval[1],
  # Weighted median  2
    b_W_Med = table$b[2],
    se_W_Med = table$se[2],
    pval_W_Med = table$pval[2],
  # Weighted mode  5
    b_W_Mod = table$b[5],
    se_W_Mod = table$se[5],
    pval_W_Mod = table$pval[5],
  # then
    nsnps	= table$nsnp[1]
  # Heterogenous missing
  # intercept missing
  )
  #loop is not working, need to ask
  names(reformed_table) = paste0("reformed",name)
}

# ------------------------bmi_exa
bmi_exa_reformed <- data.frame(
  # IVW method  3
  b_IVW_MRE = bmi_exa_mr$b[3],
  se_IVW_MRE = bmi_exa_mr$se[3],
  pval_IVW_MRE = bmi_exa_mr$pval[3],
  # Egger method  1
  b_Egger = bmi_exa_mr$b[1],
  se_Egger = bmi_exa_mr$se[1],
  pval_Egger = bmi_exa_mr$pval[1],
  # Weighted median  2
  b_W_Med = bmi_exa_mr$b[2],
  se_W_Med = bmi_exa_mr$se[2],
  pval_W_Med = bmi_exa_mr$pval[2],
  # Weighted mode  5
  b_W_Mod = bmi_exa_mr$b[5],
  se_W_Mod = bmi_exa_mr$se[5],
  pval_W_Mod = bmi_exa_mr$pval[5],
  # then
  nsnps	= bmi_exa_mr$nsnp[1]
)

#-------------------bmi_Fin
bmi_Fin_reformed <- data.frame(
  # IVW method  3
  b_IVW_MRE = bmi_Fin_mr$b[3],
  se_IVW_MRE = bmi_Fin_mr$se[3],
  pval_IVW_MRE = bmi_Fin_mr$pval[3],
  # Egger method  1
  b_Egger = bmi_Fin_mr$b[1],
  se_Egger = bmi_Fin_mr$se[1],
  pval_Egger = bmi_Fin_mr$pval[1],
  # Weighted median  2
  b_W_Med = bmi_Fin_mr$b[2],
  se_W_Med = bmi_Fin_mr$se[2],
  pval_W_Med = bmi_Fin_mr$pval[2],
  # Weighted mode  5
  b_W_Mod = bmi_Fin_mr$b[5],
  se_W_Mod = bmi_Fin_mr$se[5],
  pval_W_Mod = bmi_Fin_mr$pval[5],
  # then
  nsnps	= bmi_Fin_mr$nsnp[1]
)

# -------------------bmi_UK
bmi_UK_reformed <- data.frame(
  # IVW method  3
  b_IVW_MRE = bmi_UK_mr$b[3],
  se_IVW_MRE = bmi_UK_mr$se[3],
  pval_IVW_MRE = bmi_UK_mr$pval[3],
  # Egger method  1
  b_Egger = bmi_UK_mr$b[1],
  se_Egger = bmi_UK_mr$se[1],
  pval_Egger = bmi_UK_mr$pval[1],
  # Weighted median  2
  b_W_Med = bmi_UK_mr$b[2],
  se_W_Med = bmi_UK_mr$se[2],
  pval_W_Med = bmi_UK_mr$pval[2],
  # Weighted mode  5
  b_W_Mod = bmi_UK_mr$b[5],
  se_W_Mod = bmi_UK_mr$se[5],
  pval_W_Mod = bmi_UK_mr$pval[5],
  # then
  nsnps	= bmi_UK_mr$nsnp[1]
)

# -------------------vit_exa
vit_exa_reformed <- data.frame(
  # IVW method  3
  b_IVW_MRE = vit_exa_mr$b[3],
  se_IVW_MRE = vit_exa_mr$se[3],
  pval_IVW_MRE = vit_exa_mr$pval[3],
  # Egger method  1
  b_Egger = vit_exa_mr$b[1],
  se_Egger = vit_exa_mr$se[1],
  pval_Egger = vit_exa_mr$pval[1],
  # Weighted median  2
  b_W_Med = vit_exa_mr$b[2],
  se_W_Med = vit_exa_mr$se[2],
  pval_W_Med = vit_exa_mr$pval[2],
  # Weighted mode  5
  b_W_Mod = vit_exa_mr$b[5],
  se_W_Mod = vit_exa_mr$se[5],
  pval_W_Mod = vit_exa_mr$pval[5],
  # then
  nsnps	= vit_exa_mr$nsnp[1]
)

# ----------------vit_Fin
vit_Fin_reformed <- data.frame(
  # IVW method  3
  b_IVW_MRE = vit_Fin_mr$b[3],
  se_IVW_MRE = vit_Fin_mr$se[3],
  pval_IVW_MRE = vit_Fin_mr$pval[3],
  # Egger method  1
  b_Egger = vit_Fin_mr$b[1],
  se_Egger = vit_Fin_mr$se[1],
  pval_Egger = vit_Fin_mr$pval[1],
  # Weighted median  2
  b_W_Med = vit_Fin_mr$b[2],
  se_W_Med = vit_Fin_mr$se[2],
  pval_W_Med = vit_Fin_mr$pval[2],
  # Weighted mode  5
  b_W_Mod = vit_Fin_mr$b[5],
  se_W_Mod = vit_Fin_mr$se[5],
  pval_W_Mod = vit_Fin_mr$pval[5],
  # then
  nsnps	= vit_Fin_mr$nsnp[1]
)

# ---------------------vit_UK
vit_UK_reformed <- data.frame(
  # IVW method  3
  b_IVW_MRE = vit_UK_mr$b[3],
  se_IVW_MRE = vit_UK_mr$se[3],
  pval_IVW_MRE = vit_UK_mr$pval[3],
  # Egger method  1
  b_Egger = vit_UK_mr$b[1],
  se_Egger = vit_UK_mr$se[1],
  pval_Egger = vit_UK_mr$pval[1],
  # Weighted median  2
  b_W_Med = vit_UK_mr$b[2],
  se_W_Med = vit_UK_mr$se[2],
  pval_W_Med = vit_UK_mr$pval[2],
  # Weighted mode  5
  b_W_Mod = vit_UK_mr$b[5],
  se_W_Mod = vit_UK_mr$se[5],
  pval_W_Mod = vit_UK_mr$pval[5],
  # then
  nsnps	= vit_UK_mr$nsnp[1]
)

