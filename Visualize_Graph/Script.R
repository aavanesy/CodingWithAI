
# load csv
data <- read.csv("Student_Performance.csv")

str(data)

# convert Date into Date format
data$Date <- as.Date(data$Date, format = "%m/%d/%Y")

#aggregate Performance_Index by month, as average
data$Month <- format(data$Date, "%Y-%m")
data <- aggregate(Performance_Index ~ Month, data, mean)

library(dplyr)
data2 <- read.csv("Student_Performance.csv") %>% 
  mutate(Date = as.Date(Date, format = "%m/%d/%Y")) %>%
  # find month
  mutate(Month = format(Date, "%Y-%m")) %>%
  group_by(Month) %>%
  summarise(Performance_Index = mean(Performance_Index))

#let's plot a line chat
library(ggplot2)
#line chart
ggplot(data, aes(x = Month, y = Performance_Index, group = 1)) +
  geom_line() +
  labs(title = "Performance Index Over Time", x = "Month", y = "Performance Index") +
  theme_minimal() +
  #font color blue
  theme(text = element_text(color = "blue"))


#bar chart
ggplot(data, aes(x = Month, y = Performance_Index)) +
  geom_col() +
  labs(title = "Performance Index Over Time", x = "Month", y = "Performance Index") +
  theme_minimal() + 
  #bar color red
  scale_fill_manual(values = "red")



