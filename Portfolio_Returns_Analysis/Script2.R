# Install and load the readxl package if not already installed
# install.packages("readxl")
library(readxl)

# Read the Excel file
data <- read_excel("PortfolioData.xlsx")

# Convert the "Period" column to Date object if it's not already
data$Period <- as.Date(data$Period, format = "%m/%d/%Y")

# Print the converted data
print(data)

# Load required library
library(ggplot2)


# Calculate cumulative returns
data$Cumulative_Portfolio <- cumprod(1 + data$Portfolio)
data$Cumulative_Benchmark <- cumprod(1 + data$Benchmark)

# Plot cumulative returns
ggplot(data, aes(x = Period)) +
  geom_line(aes(y = Cumulative_Portfolio, color = "Portfolio"), size = 1) +
  geom_line(aes(y = Cumulative_Benchmark, color = "Benchmark"), size = 1) +
  labs(title = "Cumulative Returns",
       y = "Cumulative Return",
       color = "Legend") +
  scale_color_manual(values = c("Portfolio" = "blue", "Benchmark" = "red")) +
  theme_minimal()

# Create a table of cumulative returns
returns_table <- data.frame(
  Period = data$Period,
  Cumulative_Portfolio = data$Cumulative_Portfolio,
  Cumulative_Benchmark = data$Cumulative_Benchmark
)

print(returns_table)

library(PerformanceAnalytics)

# data = as.xts(data, order.by = data$Period)

# Calculate cumulative returns
data$Cumulative_Portfolio <- cumprod(1 + data$Portfolio)
data$Cumulative_Benchmark <- cumprod(1 + data$Benchmark)

# Calculate today's cumulative return
today_cumulative_return_portfolio <- tail(data$Cumulative_Portfolio, 1)
today_cumulative_return_benchmark <- tail(data$Cumulative_Benchmark, 1)

# Historical annualized returns
historical_annualized_returns_portfolio <- prod(1 + data$Portfolio)^(12/nrow(data)) - 1
historical_annualized_returns_benchmark <- prod(1 + data$Benchmark)^(12/nrow(data)) - 1

# Historical 12-month volatility
historical_volatility_portfolio <- sd(data$Portfolio) * sqrt(12)
historical_volatility_benchmark <- sd(data$Benchmark) * sqrt(12)

# Create table with annual returns
annual_returns_table <- aggregate(cbind(Portfolio, Benchmark) ~ format(Period, "%Y"), data, function(x) prod(1 + x) - 1)

# Print results
cat("Today's Cumulative Return (Portfolio):", today_cumulative_return_portfolio, "\n")
cat("Today's Cumulative Return (Benchmark):", today_cumulative_return_benchmark, "\n\n")

cat("Historical Annualized Returns (Portfolio):", historical_annualized_returns_portfolio, "\n")
cat("Historical Annualized Returns (Benchmark):", historical_annualized_returns_benchmark, "\n\n")

cat("Historical 12-Month Volatility (Portfolio):", historical_volatility_portfolio, "\n")
cat("Historical 12-Month Volatility (Benchmark):", historical_volatility_benchmark, "\n\n")

print(annual_returns_table)