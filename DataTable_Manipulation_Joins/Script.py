
# load data manip libs
import pandas as pd
import numpy as np

#read from gdp_countries.xlsx
data1 = pd.read_excel('gdp_countries.xlsx', 1) # second sheet
data2 = pd.read_excel('gdp_countries.xlsx', 2) # third sheet
data3 = pd.read_excel('gdp_countries.xlsx', 3) # fourth sheet

# left join data1 and data2
#remove rows where abbreviation is NA
data1 = data1.dropna(subset=['Abbreviation'])

data_all = pd.merge(data1, data2, on='Abbreviation', how='left')

# add data3 to data_all
data_all = pd.merge(data_all, data3, on='Country', how='left')

#subset data3 to 10 random rows
data3_subset = data3.sample(10)

#join data1 and data3_subset
df = pd.merge(data1, data3_subset, on='Country', how='inner')

df2 = pd.merge(data1, data3_subset, on='Country', how='left')

# now show an anti join
df3 = pd.merge(data1, data3_subset, on='Country', how='outer', indicator=True).query('_merge == "left_only"').drop('_merge', axis=1)
