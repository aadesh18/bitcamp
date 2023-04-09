import requests
import json

## Create mock accounts for people in capital one bank and add money 

# 4 people - p1, p2, p3, p4

apiKey = "f1fbb5f9a7bfdc1597fafdf76476cfa7"
customerId = 'your customerId here'


# url = 'http://api.reimaginebanking.com/customers/{}/accounts?key={}'.format(customerId,apiKey)
url = 'http://api.nessieisreal.com/customers?key=f1fbb5f9a7bfdc1597fafdf76476cfa7'

payload = {
  "first_name": "Aryan",
  "last_name": "Agrawal",
  "address": {
    "street_number": "8160",
    "street_name": "La Plata Dr",
    "city": "College Park",
    "state": "MD",
    "zip": "20742"
  }
}
# Create a Savings Account
response = requests.post( 
	url, 
	data=json.dumps(payload),
	headers={'content-type':'application/json'},
	)

if response.status_code == 201:
	print('account created')
if response.status_code == 400:
	print('invalid input for customer')
	