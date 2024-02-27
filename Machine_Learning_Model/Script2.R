
# load the csv
library(dplyr)
data <- read.csv("Student_Performance.csv") %>% 
  select(-Date) %>% 
  # first 500 lines only
  slice(1:200)

# Convert Performance_Index to a binary classification problem (High vs Low)
data$Performance_Index <- ifelse(data$Performance_Index >= 50, "High", "Low")
data$Performance_Index <- as.factor(data$Performance_Index)

set.seed(123) # for reproducibility
train_indices <- createDataPartition(data$Performance_Index, p = 0.8, list = FALSE)
train_data <- data[train_indices, ]
test_data <- data[-train_indices, ]

levels(train_data$Performance_Index) <- levels(test_data$Performance_Index)

# Train the Random Forest model
model <- train(
  Performance_Index ~ ., 
  data = train_data, 
  method = "rf",
  trControl = trainControl(method = "cv", number = 5) # 5-fold cross-validation
)

# Make predictions on the testing set
predictions <- predict(model, newdata = test_data)

# Evaluate the model
mse <- mean((predictions - test_data$Performance_Index)^2)
print(paste("Mean Squared Error:", mse))

accuracy <- confusionMatrix(predictions, test_data$Performance_Index)$overall['Accuracy']
accuracy
