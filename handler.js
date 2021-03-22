const AWS = require("aws-sdk");
const dynamoClient = new AWS.DynamoDB.DocumentClient();

exports.tradestonks = async (event) => {
  let response
  if (event.httpMethod === 'GET'){
    try {
      response = await dynamoClient.scan({ TableName: "good-stonks-table" }).promise();
      return {
        statusCode: 200,
        body: JSON.stringify(response)
      };
    } catch (error) {
      console.log('Retrieve trades error: ' + error)
    }
  };
  if (event.httpMethod === 'POST'){
    let requestJSON = JSON.parse(event.body);
    try{
      await dynamoClient
      .put({
        TableName: "good-stonks-table",
        Item: {
          company: requestJSON.company,
          action: requestJSON.action,
          price: requestJSON.price,
          volume: requestJSON.volume,
          timestamp: event.requestContext.requestTime
        }
      })
      .promise();
      return {
        statusCode: 200,
        body: JSON.stringify({
          message: 'Trade submitted!' + event.body
        })
      }
    } catch (error){
      console.log('Add trade error: ' + error)
    }
  }
}