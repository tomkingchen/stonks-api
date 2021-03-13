exports.handler = async (event) => {
  if (event.httpMethod === 'GET'){
    return getTrades(event);
  }
  if (event.httpMethod === 'POST'){
    return addTrade(event);
  }
};

const getTrades = event => {
  // let timestamp = Date.now()
  let trade = {
    company: 'GME',
    volume: '1000',
    price: '400',
    time: event.requestContext.requestTime
  };
  return {
    statusCode: 200,
    body: JSON.stringify(trade)
  }
}

const addTrade = event => {
  let body = JSON.parse(event.body);
  body.timestamp = event.requestContext.requestTime;
  console.log('Trade added', body);
  return {
    statusCode: 200,
    body: JSON.stringify({
      message: 'Trade submitted!' + event.body
    })
  }
}