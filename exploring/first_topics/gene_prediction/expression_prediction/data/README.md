##Data Description
- Data source: converted from the binary RData files in tissuesGeneExpression R package available from the genomicsclass GitHub repository. The data in this package was collected from the following papers by Michael Love and Rafael Irizarry:

http://www.ncbi.nlm.nih.gov/pubmed/17906632%20 http://www.ncbi.nlm.nih.gov/pubmed/21177656%20 http://www.ncbi.nlm.nih.gov/pubmed/24271388
- The expressions are stored in a pandas readable feather format binary file (pyarrow must be installed, e.g. via pip, for this to work). When read into a Pandas DataFrame, each column contains the expression values for a gene across each row which represents a different tissue sample. Each row corresponds to a tissue in the tissues.csv file, which says which tissue each sample was taken from.

- The expressions of 22,215 genes (the predictors) are measured in 189 tissue samples (the outcomes).

##Notes

##Thoughts
