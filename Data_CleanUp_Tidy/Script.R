
# load gdp_countries
data_csv <- read.csv("gdp_countries.csv")

str(data_csv)

# load data clean and up tidy packages
library(dplyr)

data_clean <- data_csv %>% 
  mutate(Date = as.Date(Date, format = "%m/%d/%Y")) %>%
  mutate(GDP = as.numeric(GDP)) %>%
  mutate(VariableOne = case_when(
    VariableOne == "t" ~ T,
    VariableOne == "TRUE" ~ T,
    VariableOne == "f" ~ F
  )) %>%
  #if variable_two is 1, T, else F
  mutate(VariableTwo = ifelse(VariableTwo == 1, T, F)) %>%
  #remove duplicates
  distinct() 
  
  
