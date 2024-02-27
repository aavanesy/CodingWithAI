
# load the csv
import pandas as pd
data = pd.read_csv('Student_Performance.csv')

data.columns

# aggregate Sleep_Hours by MOnth
data['Month'] = pd.to_datetime(data['Date']).dt.to_period('M')
data2 = data.groupby('Month')['Sleep_Hours'].mean()



#lets use plotly to make tables
import plotly.graph_objects as go
fig = go.Figure(data=[go.Table(header=dict(values=['Month', 'Sleep_Hours']),
                 cells=dict(values=[data2.index, data2.values]))
                     ])
fig.show()
