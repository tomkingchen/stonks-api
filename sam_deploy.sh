#!/bin/bash

stack_name="stonks-api-stack"
region="ap-southeast-2"

# Define parameters array
declare -A parameters

s3bucketname='tom-lambda-repo'

file='./sam_stack.yml'

echo "Begin package the template......"
eval "aws --region $region cloudformation package --template-file $file --s3-bucket $s3bucketname --output-template-file updated.yml"

echo "Begin deploy the template......."
eval "aws --region $region cloudformation deploy --stack-name $stack_name --template-file updated.yml --capabilities CAPABILITY_AUTO_EXPAND CAPABILITY_NAMED_IAM"
exit