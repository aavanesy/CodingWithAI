library(readxl)
library(dplyr)

# Read data from the Excel file
data1 <- read_excel("gdp_countries.xlsx", sheet = 2) %>% 
  #remove lines where Abbreviation is NA
  filter(!is.na(Abbreviation))

data2 <- read_excel("gdp_countries.xlsx", sheet = 3)
data3 <- read_excel("gdp_countries.xlsx", sheet = 4) %>% 
  filter(!is.na(Abbreviation))

# Join data1 and data2 by Abbreviation
joined_data1_data2 <- inner_join(data1, data2, by = "Abbreviation")

# Join data2 and data3 by Country
joined_data2_data3 <- inner_join(data2, data3, by = "Abbreviation")

data3 <- data3 %>% head(10)

# Inner join between data1 and data3
inner_join_data1_data3 <- inner_join(data1, data3, by = c("Country" = "Country"))

# Anti join between data1 and data3
anti_join_data1_data3 <- anti_join(data1, data3, by = c("Country" = "Country"))