#!/bin/bash

stack_name="stonks-api-stack"
region="ap-southeast-2"

if ! aws cloudformation describe-stacks --region $region --stack-name $stack_name; then
	echo "1"
	type_formation='create-stack'
else
	type_formation='update-stack'
fi

# Get current date and time
currentdate=`date`
currentdate=${currentdate// /-}

file='stack.yml'
params_file='params.json'

echo "Begin "$type_formation"......."
eval "aws cloudformation $type_formation --stack-name $stack_name --template-body 'file://$file' --parameters file://$params_file --capabilities CAPABILITY_NAMED_IAM --region $region"
exit
