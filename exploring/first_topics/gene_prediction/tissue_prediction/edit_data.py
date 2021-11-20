def outcomes_df(input_path, out_dir):
    import pandas as pd
    import numpy as np
    
    input_df = pd.read_csv(input_path)

    drop_columns = ['DB_ID', 'ExperimentID', 'ClinicalGroup']
    output_df = input_df.drop(columns=drop_columns)
    
    tissue_df = pd.read_csv('https://raw.githubusercontent.com/HarritonResearchLab/genomics/main/exploring/first_topics/gene_prediction/tissue_prediction/data/tissue_df.csv')
    tissues = np.array(tissue_df['tissue_ordinal'])

    output_df['tissue_ordinal'] = tissues

    output_df['SubType'] = output_df['SubType'].replace('first trimester placental organ explants grown on matrigel', np.nan)

    output_df = output_df.reindex(columns=['filename', 'Tissue', 'tissue_ordinal', 'SubType'])
    output_df = output_df.rename(columns={'Tissue': 'tissue_name', 'SubType':'sub_type'})
    
    output_df.to_csv(out_dir, index=False)