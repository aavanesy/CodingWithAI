import pandas as pd
import plotly.graph_objects as go

# Load the CSV
data = pd.read_csv('Student_Performance.csv')

# Convert 'Date' column to datetime format
data['Date'] = pd.to_datetime(data['Date'])

# Aggregate Sleep_Hours by Month
data['Month'] = data['Date'].dt.to_period('M')
data2 = data.groupby('Month')['Sleep_Hours'].mean().reset_index()

# Convert 'Month' to string
data2['Month'] = data2['Month'].astype(str)

# Create a Plotly table
fig = go.Figure(data=[go.Table(
    header=dict(values=["Month", "Average Sleep Hours"],
                fill_color='lightblue',
                align='center'),
    cells=dict(values=[data2['Month'], data2['Sleep_Hours']],
               fill_color='lavender',
               align='center'))
])

# Update table layout
fig.update_layout(
    title="Average Sleep Hours by Month",
    title_font=dict(size=20),
    title_x=0.5,
    title_y=0.95,
    title_xanchor='center',
    title_yanchor='top'
)

fig.show()

# Save the figure as PNG
fig.write_image("table_plot.png")
