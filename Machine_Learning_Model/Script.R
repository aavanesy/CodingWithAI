
# load the csv
library(dplyr)
data <- read.csv("Student_Performance.csv") %>% 
  select(-Date) %>% 
  # first 500 lines only
  slice(1:200)


names(data)

# explain Performance.Index by all factors
# split data into test and train
set.seed(123)
train_index <- sample(1:nrow(data), 0.7*nrow(data))
train <- data[train_index,]
test <- data[-train_index,]

# apply a machine learning model
library(caret)
model <- train(Performance_Index ~ ., data = train, method = "lm")
# calculate models accuracy
results <- predict(model, test)
#compare retsults to actual values
confusionMatrix(results, test$Performance_Index)

# alternative model
model2 <- train(Performance_Index ~ ., data = train, method = "rf")
# calculate accuracy
results2 <- predict(model2, test)
# compare results to actual values
caret::confusionMatrix(results2, test$Performance_Index)

# #alternative model
# model3 <- train(Performance_Index ~ ., data = train, method = "xgbTree")
