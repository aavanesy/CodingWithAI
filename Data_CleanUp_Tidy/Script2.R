# Load necessary library
library(dplyr)

# Read the CSV file
data <- read.csv("gdp_countries.csv")

# Clean up the data
cleaned_data <- data %>%
  # Remove rows with any missing values
  filter(!is.na(Region) & !is.na(Country) & !is.na(GDP) & !is.na(Date) & !is.na(VariableOne) & !is.na(VariableTwo)) %>%
  # Remove rows with 'ERROR' in the GDP column
  filter(GDP != "ERROR") %>%
  # Convert Date column to Date type
  mutate(Date = as.Date(Date, format = "%m/%d/%Y")) %>%
  # Convert VariableOne and VariableTwo to logical (TRUE/FALSE)
  mutate(VariableOne = VariableOne == "t",
         VariableTwo = VariableTwo == 1)

# View cleaned data
print(cleaned_data)
