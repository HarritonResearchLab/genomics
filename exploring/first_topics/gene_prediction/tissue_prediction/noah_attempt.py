import pandas as pd 
import numpy as np 
import matplotlib.pyplot as plt
from sklearn.manifold import MDS
from sklearn.model_selection import train_test_split
from sklearn.neighbors import KNeighborsClassifier
from sklearn.metrics import accuracy_score

tissue_df = pd.read_csv('data/tissue_df.csv')
outcomes_df = pd.read_csv('data/outcomes_df.csv')

gene_df = pd.read_feather('data/genes_only.ftr')

mds = MDS()
X=mds.fit_transform(gene_df)
model = KNeighborsClassifier()
X_train, X_test, y_train, y_test = train_test_split(X, tissue_df['tissue_ordinal'], test_size=0.30)
model.fit(X_train, y_train)
print(f"Accuracy: {accuracy_score(model.predict(X_test), y_test)*100:.2f}%")
