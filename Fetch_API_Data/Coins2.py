import requests

# Define the API endpoint
endpoint = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest"

# Set your API key
api_key = "8bdc7ed1-2836-42ee-b0a0-e9b55e63dc5f"

# Set headers with API key
headers = {
    "Accepts": "application/json",
    "X-CMC_PRO_API_KEY": api_key
}

# Make the API request
response = requests.get(endpoint, headers=headers)

# Check if the request was successful
if response.status_code == 200:
    # Parse the JSON response
    data = response.json()
    
    # Print the data
    print(data)
else:
    # Print error message
    print("Error:", response.status_code)
