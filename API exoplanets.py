import requests
import csv

# https://exoplanetarchive.ipac.caltech.edu/docs/TAP/usingTAP.html#

# Base URL for the Exoplanet Archive TAP service
base_url = "https://exoplanetarchive.ipac.caltech.edu/TAP/sync?"

# Define the table for Planetary Systems Composite Parameters (pscomppars)
table_name = "pscomppars"

# Specify the columns you want to retrieve (use "*" to get all columns)
columns = "*"

# Construct the TAP query to retrieve all data from the pscomppars table
tap_query = f"select {columns} from {table_name}"

# Construct the full API URL
api_url = f"{base_url}query={tap_query}&format=csv"

# Send the HTTP request and get the response
response = requests.get(api_url)

# Check if the request was successful (status code 200)
if response.status_code == 200:
    # Parse the CSV data from the response
    csv_data = response.text

    # Save the CSV data to a file
    output_file_path = "pscomppars_data.csv"
    with open(output_file_path, "w", newline="") as csv_file:
        csv_file.write(csv_data)

    print(f"Data saved to: {output_file_path}")
else:
    # Print an error message if the request was not successful
    print(f"Error: {response.status_code} - {response.text}")
