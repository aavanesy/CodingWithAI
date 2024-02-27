# Load necessary library
library(ggplot2)

# Read the CSV file
data <- read.csv("Student_Performance.csv")

# Convert the 'Date' column to Date format
data$Date <- as.Date(data$Date, format = "%m/%d/%Y")

data$Month <- format(data$Date, "%Y-%m")
data <- aggregate(Performance_Index ~ Month, data, mean)

# Plotting the line chart
ggplot(data, aes(x = Month, y = Performance_Index, group = 1)) +
  geom_line(color = "red") +
  labs(x = "Date", y = "Performance Index") +
  ggtitle("Performance Index Over Time") +
  theme_minimal()


ggplot(data, aes(x = Month, y = Performance_Index, fill = as.factor(row.names(data)))) +
  geom_bar(stat = "identity") +
  labs(x = "Date", y = "Performance Index") +
  ggtitle("Performance Index Over Time") +
  theme_minimal() +
  scale_fill_manual(values = rainbow(nrow(data))) + 
  #rename legend's title
  guides(fill = guide_legend(title = "Month"))
