import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

# Read data from Excel
data = pd.read_excel("PortfolioData.xlsx")

# Calculate cumulative returns
data['Cumulative_Portfolio'] = (1 + data['Portfolio']).cumprod()
data['Cumulative_Benchmark'] = (1 + data['Benchmark']).cumprod()

# Plot cumulative returns
plt.plot(data['Period'], data['Cumulative_Portfolio'], label='Portfolio')
plt.plot(data['Period'], data['Cumulative_Benchmark'], label='Benchmark')
plt.title('Cumulative Returns')
plt.xlabel('Period')
plt.ylabel('Cumulative Return')
plt.legend()
plt.show()
plt.clf()
# Compute returns for each year
data['Year'] = pd.to_datetime(data['Period']).dt.year
annual_returns_table = data.groupby('Year').agg({'Portfolio': lambda x: np.prod(1 + x) - 1,
                                                 'Benchmark': lambda x: np.prod(1 + x) - 1}).reset_index()

print(annual_returns_table)

# Compute annualized standard deviation
stdev_annualized_portfolio = np.std(data['Portfolio']) * np.sqrt(12)
stdev_annualized_benchmark = np.std(data['Benchmark']) * np.sqrt(12)

print("Annualized Standard Deviation (Portfolio):", stdev_annualized_portfolio)
print("Annualized Standard Deviation (Benchmark):", stdev_annualized_benchmark)


# Compute drawdown
data['Portfolio_Peak'] = data['Cumulative_Portfolio'].cummax()
data['Portfolio_Drawdown'] = (data['Cumulative_Portfolio'] - data['Portfolio_Peak']) / data['Portfolio_Peak']
max_drawdown_portfolio = data['Portfolio_Drawdown'].min()

data['Benchmark_Peak'] = data['Cumulative_Benchmark'].cummax()
data['Benchmark_Drawdown'] = (data['Cumulative_Benchmark'] - data['Benchmark_Peak']) / data['Benchmark_Peak']
max_drawdown_benchmark = data['Benchmark_Drawdown'].min()

# Plot drawdown
plt.plot(data['Period'], data['Portfolio_Drawdown'], label='Portfolio')
plt.plot(data['Period'], data['Benchmark_Drawdown'], label='Benchmark')
plt.title('Drawdown')
plt.xlabel('Period')
plt.ylabel('Drawdown')
plt.legend()
plt.show()

