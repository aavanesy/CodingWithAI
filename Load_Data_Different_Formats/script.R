
#loading file 'Student_Performance'
data_csv <- read.csv("Student_Performance.csv")

# txt tab delimited
data_txt <- read.table("Student_Performance.txt", sep = "\t", header = TRUE)

#data xlsx
library(readxl)
data_xlsx <- read_excel("Student_Performance.xlsx", sheet = 1)

# read the pdf
library(pdftools)
data_pdf <- pdf_text("Student_Performance.pdf")

data_pdf2 <- pdf_data("Student_Performance.pdf")

library(data.table)

# Specify the path to your CSV file
csv_file_path <- "Student_Performance.csv"

# Use fread to read the CSV file
data <- fread(csv_file_path)
