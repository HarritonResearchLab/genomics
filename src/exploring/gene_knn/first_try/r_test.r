install.packages("languageserver")

library(tissuesGeneExpression)
data(tissuesGeneExpression)

ind <- which(tissue != "placenta")
y <- tissue[ind]
X <- t( e[,ind] )

print(X)