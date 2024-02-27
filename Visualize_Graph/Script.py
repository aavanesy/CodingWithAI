
#load data
import pandas as pd
data = pd.read_csv('Student_Performance.csv')

data.columns

# compute month based on Date
data['Month'] = pd.to_datetime(data['Date']).dt.month

#compute average Performance_Index per Month
data2 = data.groupby('Month')['Performance_Index'].mean()

# plot a line chart where X is MOnth, y is Performance_Index
import matplotlib.pyplot as plt
plt.plot(data2.index, data2.values)
plt.show()
#change line to red
plt.plot(data2.index, data2.values, color='red')
plt.show()
#change line to red and add marker
plt.plot(data2.index, data2.values, color='red', marker='o')
plt.show()

#delete plot from memory
plt.clf()

#plot a bar chart
plt.bar(data2.index, data2.values)
plt.show()
# no markers, each bar different color
plt.bar(data2.index, data2.values, color=['red', 'blue', 'green', 'yellow', 'orange', 'purple'])
plt.show()
#add title and labels
plt.bar(data2.index, data2.values, color=['red', 'blue', 'green', 'yellow', 'orange', 'purple'])
plt.title('Average Performance Index by Month')
plt.xlabel('Month')
plt.ylabel('Average Performance Index')
  
    


