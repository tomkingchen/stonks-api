#!/bin/bash

stack_name="stonks-api-dev"
region="ap-southeast-2"

base_uri=$(aws cloudformation describe-stacks --region $region --stack-name $stack_name --query "Stacks[0].Outputs[1].OutputValue")
# Remove quotes around the uri
base_uri="${base_uri%\"}"
base_uri="${base_uri#\"}"
base_uri+='/trade'

api_key=$(aws apigateway get-api-keys --name-query 'stonks-api-key' --include-value|jq '.items[0].value')
# Remove quotes around the api key
api_key="${api_key%\"}"
api_key="${api_key#\"}"
api_key="x-api-key:$api_key"

# Add stonk trade into API
curl --request POST $base_uri \
--header $api_key \
--header 'Content-Type: application/json' \
--data-raw '{
    "company": "GME",
    "action": "buy",
    "price": 500,
    "volume": 999
}'

# List stonk trades from API
echo ""
echo "Trades you have done:"
curl --request GET $base_uri --header $api_key |jq
exit