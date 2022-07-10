import matplotlib.pyplot as plt
import pandas as pd
import seaborn as sns

sns.set_style('dark')

df = pd.read_csv('./mendelian_randomization/personals/tk/around seven hundred/routine_results.csv')

df = df.sort_values(by='pval')
df.to_csv('./mendelian_randomization/personals/tk/around seven hundred/routine_results.csv', index=False)

plt.hist(df['pval'])
plt.gca().set(xlabel='p', ylabel='Frequency')
plt.savefig('./mendelian_randomization/personals/tk/around seven hundred/hist.png', dpi=150)