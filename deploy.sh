#!/bin/bash
#set -x

stack_name="stonks-api-stack"
region="ap-southeast-2"

if ! aws cloudformation describe-stacks --region $region --stack-name $stack_name; then
	echo "1"
	type_formation='create-stack'
else
	type_formation='update-stack'
fi

# Define parameters array
declare -A parameters

# stack parameters
parameters["LambdaFunctionName"]="trade-stonks"

file='stack.yml'

# Join parameters together
s_parameters=''
for i in "${!parameters[@]}"; do
	s_parameters=$s_parameters' '$(printf "ParameterKey=%s,ParameterValue=%s" $i ${parameters[${i}]})
done

echo "Begin "$type_formation"......."
eval "aws cloudformation $type_formation --stack-name $stack_name --template-body 'file://$file' --parameters $s_parameters --capabilities CAPABILITY_NAMED_IAM --region $region"
exit