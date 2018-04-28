const express = require ('express');
const stripe = require ('stripe')("sk_test_Y3UuJc5ZyLBQvFeDlI8Gktdz");
const bodyParser = require ('body-parser');
const app = express();
stripe.setApiVersion('2018-02-28');


app.use(bodyParser.json());

app.listen(5000, () => {
	console.log('Server up and running!');
});

app.post('/charge', (req, res) => {
	var customer = req.body.customer;
	var amount = req.body.amount;
	var currency = req.body.currency;

	stripe.charges.create({
		customer : customer;
		amount : amount;
		currency : currency;
	}, function(err, charge){
		if(err){
		console.log(err, req.body);
		res.status(500).end();
	}else{
		res.status(200).send();
	}
	
	}
})
});


app.post('/ephemeral_keys', (req, res) => {
  const stripe_version = req.body.apiVersion;
  const customer_id = req.body.customerId
 	 if (!stripe_version) {
    	res.status(400).end();
    	return;
  	}


  stripe.ephemeralKeys.create(
    	{customer: customer_id},
    	{stripe_version: stripe_version}
  	).then((key) => {
    	res.status(200).json(key);
  	}).catch((err) => {
    	res.status(500).end();
  	});
  });
