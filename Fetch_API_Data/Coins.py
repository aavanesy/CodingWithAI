
# COPILOT VERSION
key = '8bdc7ed1-2836-42ee-b0a0-e9b55e63dc5f'
url = 'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest'


# load libraries
import requests
# write a GET query to obtain data from the API
request = requests.get(url, headers={'X-CMC_PRO_API_KEY': key})

#check if correct
request.status_code

#fetch data and print it
data = request.json()
print(data)

url2 = 'https://pro-api.coinmarketcap.com/v2/cryptocurrency/ohlcv/historical'

# print data for url2
request2 = requests.get(url2, headers={'X-CMC_PRO_API_KEY': key})
request2.status_code

data2 = request2.json()
print(data2)
