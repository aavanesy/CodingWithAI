# Assuming your data frame is named "data"
# If not, replace "data" with the name of your data frame
data <- read.csv("Student_Performance.csv")

# Convert Date column to Date format if it's not already
data$Date <- as.Date(data$Date, format="%m/%d/%Y")

# Load necessary library for linear regression
library(stats)

# Fit linear regression model
lm_model <- lm(Performance.Index ~ Hours.Studied, data=data)

summary(lm_model)

# Predict Performance.Index based on Hours.Studied
predicted_performance <- predict(lm_model, 
                                 data.frame(Hours.Studied = 15))

# Output the predicted values
predicted_performance

lm_model2 <- lm(Performance.Index ~ Hours.Studied + Previous.Scores + 
                 Extracurricular.Activities + Sleep.Hours + 
                 Sample.Question.Papers.Practiced, data=data)

summary(lm_model2)
