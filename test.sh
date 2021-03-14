#!/bin/bash

stack_name="stonks-api-stack"
region="ap-southeast-2"

base_uri=$(aws cloudformation describe-stacks --region $region --stack-name $stack_name --query "Stacks[0].Outputs[0].OutputValue")
# Remove quotes around the uri
base_uri="${base_uri%\"}"
base_uri="${base_uri#\"}"
base_uri+='/trade'

# Add stonk trade into API
curl --request POST $base_uri \
--header 'Content-Type: application/json' \
--data-raw '{
    "company": "GME",
    "action": "sell",
    "price": 500,
    "volume": 999
}'

# List stonk trades from API
echo ""
echo "Trades you have done:"
curl --request GET $base_uri |jq
exit