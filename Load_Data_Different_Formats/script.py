
import pandas as pd

data = pd.read_csv('Student_Performance.csv')

data2 = pd.read_excel('Student_Performance.xlsx')

data3 = pd.read_csv('Student_Performance.txt', delimiter='\t')
