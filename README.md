# stonks-api
Trade your :gem: :raised_hands: with this great API!

Well, you can only list your trades and submit new trades through this API...

The API consist of an API Gateway, a single Lambda function and a DynamoDB table. It's deployed using Cloudformation template (Obviously you can use SAM or Serverless framework for this kind implementation.).

Add execute rights to the bash scripts.

To deploy and update the CFN template:
```
./deploy.sh
```
To remove the CFN stack
```
./destroy.sh
```
To test the API
```
./test.sh
```

## TODOs
- Add a WAF in front of API Gateway
- Add a custom domain for API Gateway endpoint
- Add an authorizer function in front of Lambda
- Create function local invocation test scripts
- Add data validation in the code
- Move trade logic into library
- Create unit tests for the code
- Add API Documentation
