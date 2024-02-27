# Install and load necessary packages
library(httr)

# Define the API endpoint
endpoint <- "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest"

# Set your API key
api_key <- "8bdc7ed1-2836-42ee-b0a0-e9b55e63dc5f"

# Make the API request
response <- GET(endpoint,
                add_headers("X-CMC_PRO_API_KEY" = api_key),
                query = list(limit = 10))  # You can adjust the limit as needed

# Check if the request was successful
if (response$status_code == 200) {
  # Parse the JSON response
  data <- content(response, "parsed")
  
  # Print the data
  print(data)
} else {
  # Print error message
  print(paste("Error:", response$status_code))
}
