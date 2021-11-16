import pyreadr

r_file = r'C:\Users\Research\Documents\GitHub\genomics\src\exploring\gene_knn\first_try\tissuesGeneExpression.rda'

result = pyreadr.read_r(r_file)

expressions = result['e']

expressions.to_csv('e_test.csv', index=True)

