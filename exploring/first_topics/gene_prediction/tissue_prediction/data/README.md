## Data Description
* Data source: converted from the binary RData files in ```tissuesGeneExpression``` `R` package available from the ```genomicsclass``` GitHub repository. The data in this package was collected from the following papers by Michael Love and Rafael Irizarry: 
    * http://www.ncbi.nlm.nih.gov/pubmed/17906632%20
      http://www.ncbi.nlm.nih.gov/pubmed/21177656%20
      http://www.ncbi.nlm.nih.gov/pubmed/24271388

* The expressions are stored in a pandas readable feather format binary file (pyarrow must be installed, e.g. via pip, for this to work). When read into a Pandas DataFrame, each column contains the expression values for a gene across each row which represents a different tissue sample. Each row corresponds to a tissue in the tissues.csv file, which says which tissue each sample was taken from.
* ```outcomes_df.csv``` has some extra information like ```sub_type``` but the subtypes are really different between tissues and even different within tissue type (not sure what to make of this yet). 
* The expressions of 22,215 genes (the predictors) are measured in 189 tissue samples (the outcomes). 

## Notes
* It is recommended to exclude samples from the placenta due to their small number. 

## Thoughts
* ~~Use multidimensional scaling instead of PDS first (probably should talk about MDS on Wednesday)~~
* ~~Perhaps randomly sample 500 genes and then~~ do MDS (see [sklearn documentation](https://scikit-learn.org/stable/modules/generated/sklearn.manifold.MDS.html))
* Should probably test accuracy of k = {3, 5, 7, 9, 13} and dim = {2, 4, 6, 8, 12} (maybe make 3D plot with z= knn accuracy)
* Should we make little directories with README.MDs like this for every major data set we use? 
