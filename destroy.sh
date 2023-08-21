#!/bin/bash

stack_name="stonks-api-stack"
region="ap-southeast-2"

if ! aws cloudformation describe-stacks --region $region --stack-name $stack_name; then
	echo "Stack does not exist."
else
	type_formation='delete-stack'
	echo "Begin "$type_formation"......."
	eval "aws cloudformation $type_formation --stack-name $stack_name --region $region"
fi

exit
