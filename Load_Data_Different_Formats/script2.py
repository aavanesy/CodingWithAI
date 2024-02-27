
# read csv file
import pandas as pd
data_csv = pd.read_csv('Student_Performance.csv')

#read txt file
data_txt = pd.read_csv('Student_Performance.txt', delimiter='\t')

#read xlsx file from first sheet
data_xlsx = pd.read_excel('Student_Performance.xlsx', sheet_name=0)

#read pdf file
#pip install tabula-py
from tabula import read_pdf
data_pdf = read_pdf('Student_Performance.pdf')
