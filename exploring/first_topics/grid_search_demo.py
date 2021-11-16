import numpy as np
import pandas as pd

ks = list(range(1, 21))
distance_metrics = ['euclidian', 'manhattan']

permutations = np.array([]).reshape(0, 2)

for k in ks:
    for dm in distance_metrics: 
        row = np.array([k,dm])
        permutations = np.vstack((permutations, row))

np.random.shuffle(permutations)

print(permutations)
