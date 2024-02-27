import pandas as pd

# Read the CSV file
data = pd.read_csv("gdp_countries.csv")

# Step 1: Handle Missing Values
data = data.dropna()

# Step 2: Standardize Data Types
data['Date'] = pd.to_datetime(data['Date'], format='%m/%d/%Y')
data['VariableOne'] = data['VariableOne'].map({'t': True, 'f': False})
data['VariableTwo'] = data['VariableTwo'].astype(bool)

# Step 3: Remove Duplicates
data = data.drop_duplicates()

# Step 4: Address Data Integrity Issues
# data = data[data['GDP'] != 'ERROR']
data['GDP'] = pd.to_numeric(data['GDP'], errors='coerce')  # Coerce errors to NaN

# Step 5: Normalize Data
# No specific normalization needed in this case

# Step 6: Handle Outliers
# No specific handling of outliers in this script

# Step 7: Reshape Data
# No reshaping needed in this case

# Step 8: Ensure Consistent Naming Conventions
# No specific action needed in this case

# Step 9: Document Changes
# No specific documentation needed in this script

# Step 10: Save cleaned data to a new file

print("Data cleaning and tidying completed.")
