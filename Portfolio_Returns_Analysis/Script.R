
# load data from xlsx PortfolioData.xlsx
library(readxl)
data <- read_excel("PortfolioData.xlsx", sheet = 1)

#check str
str(data)

#check if Period is date object
class(data$Period)

# load lib  
library(dplyr)
# compute total return over the period for both Portfolio and Benchmark
# given values are returns in percentage

return_portfio <- 100 * cumprod(data$Portfolio + 1)

plot(return_portfio)

# plot data using ggplot2, but cumulate return before
library(ggplot2)
ggplot(data, aes(x = Period, y = return_portfio)) + 
  geom_line() + labs(title = "Portfolio Cumulative Return", x = "Period", y = "Cumulative Return")