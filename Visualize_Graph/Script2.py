import pandas as pd
import matplotlib.pyplot as plt

# Load the CSV file
data = pd.read_csv('Student_Performance.csv')

# Convert 'Date' column to datetime format
data['Date'] = pd.to_datetime(data['Date'], format='%m/%d/%Y')

# Compute the month for each date
data['Month'] = data['Date'].dt.month

# Compute the average Performance_Index by month
average_performance_by_month = data.groupby('Month')['Performance_Index'].mean().reset_index()

# Plotting the line chart
plt.plot(average_performance_by_month['Month'], average_performance_by_month['Performance_Index'], marker='o', color='green')
plt.xlabel('Month')
plt.ylabel('Average Performance Index')
plt.title('Average Performance Index by Month')
plt.xticks(range(1, 13))  # Assuming data spans all 12 months
plt.grid(True)
plt.show()
