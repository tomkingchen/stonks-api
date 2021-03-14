# stonks-api
Trade your :gem: :raised_hands: with this great API!

Well, you can only list your trades and submit new trades through this API...

The API consist of an API Gateway, a single Lambda function and a DynamoDB table. It's deployed using Cloudformation template as specified (Usually I will use SAM or Serverless template for this kind implementation.).

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
