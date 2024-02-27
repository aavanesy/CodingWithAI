# Load necessary libraries
library(tidyverse)

# Load the CSV file
data <- read.csv("Student_Performance.csv")

# Convert 'Date' column to Date format
data$Date <- as.Date(data$Date, format = "%m/%d/%Y")

# Create a new variable 'Month' to represent the month
data <- data %>%
  mutate(Month = format(Date, "%Y %b"))

# Using tidyverse, compute the monthly average Sleep_Hours
monthly_avg_sleep_hours <- data %>%
  group_by(Month) %>%
  summarise(Avg_Sleep_Hours = mean(Sleep_Hours, na.rm = TRUE))

# Print the result
print(monthly_avg_sleep_hours)

# Load necessary libraries
library(gt)

# Generate a nice table using gt
monthly_avg_sleep_hours %>%
  gt() %>%
  tab_header(
    title = "Monthly Average Sleep Hours",
    subtitle = "Computed from the provided data"
  ) %>%
  fmt_number(columns = everything(), decimals = 1) 

# Load necessary libraries
library(flextable)

# Generate a nice table using flextable
flextable(monthly_avg_sleep_hours) %>%
  set_caption("Monthly Average Sleep Hours") %>%
  align(align = "center", part = "all")

# Load necessary libraries
library(kableExtra)

# Generate a nice table using kableExtra
monthly_avg_sleep_hours %>%
  kbl() %>%
  kable_paper("striped", full_width = FALSE) %>%
  add_header_above(c("Monthly Average Sleep Hours" = 2), align = "center") %>%
  column_spec(1:2)



# Load necessary libraries
library(flextable)

# Generate a nice table using flextable
ft <- flextable(monthly_avg_sleep_hours) %>%
  set_caption("Monthly Average Sleep Hours") %>%
  align(align = "center", part = "all") %>%
  theme_booktabs() %>%
  theme_vanilla() %>%
  fontsize(size = 10) %>%
  padding(padding = 2) %>%
  bold(part = "header") %>%
  autofit() 
ft
# Save the flextable as an image
save_as_image(ft, "nice_table.png")











