
data <- read.csv("Student_Performance.csv")

#convert Date into Date format
data$Date <- as.Date(data$Date, format = "%m/%d/%Y")

#aggregate Performance_Index by month, as average
data$Month <- format(data$Date, "%Y-%m")
data <- aggregate(Performance_Index ~ Month, data, mean)



library(dplyr)

# generate an html table based on data
# load library
library(knitr)
library(kableExtra)
html_table <- data %>%
  kable("html") %>%
  kable_styling(bootstrap_options = c("striped", "hover", "condensed", "responsive"))
html_table

# condence the table so the columns are close to each other
html_table <- data %>%
  kable("html") %>%
  kable_styling(bootstrap_options = c("striped", "hover", "condensed", "responsive")) %>%
  column_spec(1, width = "2em") %>%
  column_spec(2, width = "2em")
html_table

# space between columns is too big
html_table <- data %>%
  kable("html") %>%
  kable_styling(bootstrap_options = c("striped", "hover", "condensed", "responsive")) %>%
  column_spec(1, width = "2em") %>%
  column_spec(2, width = "2em") 
html_table

#lets use the gt package
library(gt)
table_gt <- data %>%
  # change Month to mmm yyyy
  mutate(Month = format(as.Date(paste0(Month, "-01")), "%Y %b")) %>%
  gt() %>%
  tab_header(
    title = "Performance Index Over Time",
    subtitle = "Average Performance Index by Month"
  ) %>% 
  # title is in dark blue
  tab_style(
    style = cell_text(color = "darkblue"),
    locations = cells_title()
  ) 
table_gt


# flextable package
library(flextable)
table_ft <- data %>% 
  mutate(Month = format(as.Date(paste0(Month, "-01")), "%Y %b")) %>%
  flextable() %>%
  set_table_properties(width = 1) %>%
  set_header_labels(
    Month = "Month",
    Performance_Index = "Performance Index"
  ) %>%
  theme_zebra() %>%
  bold(part = "header") %>%
  align(align = "center", part = "all") %>%
  set_caption("Average Performance Index by Month") %>% 
  # column width larger
  width(j = 1, width = 1)

table_ft








