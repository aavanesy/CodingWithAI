
# load data manipulation libraries
library(dplyr)
library(readxl)

# load the xlsx
data1 <- read_excel("gdp_countries.xlsx", sheet = 2)
data2 <- read_excel("gdp_countries.xlsx", sheet = 3)
data3 <- read_excel("gdp_countries.xlsx", sheet = 4)

data_all <- data1 %>% 
  # if no abbreviation, use country name
  mutate(Abbreviation = ifelse(is.na(Abbreviation), Country, Abbreviation)) %>%
  left_join(data2, by = "Abbreviation") %>% 
  left_join(data3, by = "Country")


data33 <- data3 %>% head(10)

df = data1 %>% left_join(data33, by = "Country")

#inner join
df2 = data1 %>% inner_join(data33, by = "Country")

# I want to show only the rows where data1 didn't match data3
df3 = data1 %>% anti_join(data33, by = "Country")
