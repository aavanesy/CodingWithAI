import pandas as pd

# Read data from the Excel file
data1 = pd.read_excel("gdp_countries.xlsx", sheet_name="Data1")
data2 = pd.read_excel("gdp_countries.xlsx", sheet_name="Data2")
data3 = pd.read_excel("gdp_countries.xlsx", sheet_name="Data3")

# Join data1 and data2 by Abbreviation
joined_data1_data2 = pd.merge(data1, data2, on="Abbreviation")

# Join data2 and data3 by Country
joined_data2_data3 = pd.merge(data2, data3, on="Abbreviation")


#subset data3 to 10 random rows
data3_subset = data3.sample(10)

# Inner join between data1 and data3
inner_join_data1_data3 = pd.merge(data1, data3_subset, on="Country", how="inner")

# Anti join between data1 and data3
anti_join_data1_data3 = pd.merge(data1, data3, on="Country", how="left", indicator=True).query('_merge == "left_only"').drop('_merge', axis=1)

