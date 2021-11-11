import numpy as np
import pandas as pd

#df1 = pd.read_csv(r'C:\Users\Research\Documents\GitHub\genomics\src\exploring\gene_knn\first_try\expressions.csv')
df2 = pd.read_csv(r'C:\Users\Research\Documents\GitHub\genomics\src\exploring\gene_knn\first_try\data\tissue_df.csv')

print(list(set(df2['tissue_name'])))