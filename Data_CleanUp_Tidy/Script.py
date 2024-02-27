
# load gdp_countres.csv
import pandas as pd
data = pd.read_csv('gdp_countries.csv')

#clean up and tidy data
# convert date into correct format
data['Date'] = pd.to_datetime(data['Date'])
# convert gdp into numerc and if its a string, say NA
data['GDP'] = pd.to_numeric(data['GDP'], errors='coerce')

#convert variableone to True or False,  if t or TRUE, TRUE, if f FALSE
data['VariableOne'] = data['VariableOne'].str.upper().map({'T': True, 'F': False, 'TRUE': True, 'FALSE': False})
# remove duplicates
data = data.drop_duplicates()
# remove rows with missing values
data = data.dropna()
