
# read the csv
data <- read.csv("Student_Performance.csv")

head(data)

names(data)

#explain Performance.Index from Hours.Studied using linear regression
model <- lm(Performance.Index ~ Hours.Studied, data = data)

summary(model)

library(dplyr)
data2 <- data %>% select(-Date)
names(data2)
# explain Performance.Index by all factors
model2 <- lm(Performance.Index ~ ., data = data2)

summary(model2)
