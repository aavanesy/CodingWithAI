#https://coinmarketcap.com/api/documentation/v1/#section/Standards-and-Conventions

## COPILOT VERSION
key <- '8bdc7ed1-2836-42ee-b0a0-e9b55e63dc5f'
url <- 'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest'

# load packages we need
library(httr)
library(dplyr)

# run a GET request using the key
response <- GET(url, add_headers('X-CMC_PRO_API_KEY' = key))

response

#save content as a list
content <- content(response, as = "parsed")


url2 = 'https://pro-api.coinmarketcap.com/v2/cryptocurrency/ohlcv/latest'

data2 <- GET(url2, add_headers('X-CMC_PRO_API_KEY' = key))

data2
