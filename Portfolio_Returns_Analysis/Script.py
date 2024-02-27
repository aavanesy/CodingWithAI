
# Load PortfolioData.xlsx
import pandas as pd
data = pd.read_excel('PortfolioData.xlsx')

# compute cumulative returns for Portfolio And Benchmark
data['Portfolio Cumulative'] = (1 + data['Portfolio']).cumprod()
data['Benchmark Cumulative'] = (1 + data['Benchmark']).cumprod()

#plot cumulative returns
import matplotlib.pyplot as plt
plt.plot(data['Period'], data['Portfolio Cumulative'], label='Portfolio')
plt.plot(data['Period'], data['Benchmark Cumulative'], label='Benchmark')
plt.xlabel('Date')
plt.ylabel('Cumulative Return')
plt.title('Portfolio vs Benchmark Cumulative Returns')
plt.legend()
plt.show()
#remve plot
plt.clf()

# compute cumulated returns for 2012, 2013 etc
data['Year'] = pd.to_datetime(data['Period']).dt.year
data2 = data.groupby('Year')[['Portfolio', 'Benchmark']].apply(lambda x: (1 + x).cumprod())

# compute stdev for the period, annualized
stdev = data2.groupby('Year').std() * (12 ** 0.5)
