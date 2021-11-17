## Data Description
- Data source: converted from the Affymetrix Human Genome U133A Array (GEO ID: GPL96):
  - https://www.ncbi.nlm.nih.gov/geo/download/?acc=GSE16716
- The expressions are stored in a pandas readable feather format binary file (pyarrow must be installed, e.g. via pip, for this to work). When read into a Pandas DataFrame, each cell contains the expression values for a gene from a sample. Each row corresponds to a probe/gene and each column corresponds to a sample.

- The expressions of 22,283 genes are measured across 253 samples.

## Notes

## Thoughts
