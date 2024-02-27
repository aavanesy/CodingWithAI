# Reading a tab-delimited text file
data_txt <- read.table("Student_Performance.txt", header = TRUE, sep = "\t")

# Reading a comma-separated file
data_csv <- read.csv("Student_Performance.csv", header = TRUE)


library(readxl)

data_xlsx <- read_excel("Student_Performance.xlsx")


text <- pdf_text("Student_Performance.pdf")

