# DC-6 Stripe: cannot query a refund, it looks for the re_reference on the setup_intent
### Link
[Link to DC-6 Jira](https://jira.recurly.net/browse/DC-6)
[Link to retestly](https://github.com/recurly/retestly/blob/d9ffe6b00494c17dbdcf5475fb45c6128ca418b7/spec/api/v2/payments/gateway/gateway_query_api_spec.rb#L8)


## Description
Given a refund transaction that has been run on a site that is using the payment_intents FF, we should be able to query that refund if it returned a queryable transactin error.

## Aceptance Criteria?
Make refunds queryable for strip when we have a saved reference on the transaction.

## Starting info
* This is controlled somewhere in MB
* * after some initial research maybe lib/consumbers/query/stripe.js
* Need to make a refund transaction to a stripe gateway and with it's transaction reference id be able to query it
* * Can use QA2 and insomnia
* Once that is successful find where the problem is (beautiful comment)

## Investigating
* mb/lib/consumers/query/stripe.js
* *
~~* Transactions::QueryProducer
* * ra/app/producers/transactions/query_producer.rb~~
* * maybe not

## Current test
* Set up a refund in QA2
* reference number: re_1ITjSTBMMkzTUXRpCZp0s1uA
* * transaction uuid: 598f193bbfaac611b132d94bab84b280
* * wiped status to declined as if the comm error
* * not updating in the UI

* Next RE test: re_1ITjSXBMMkzTUXRpLWHSjT9U
* * UUID: 598f194ad59efc94a8b1c242dcabdf1f
* * invoice_id: 3226943891692976524
* * wiped status to mimic gateway comm error
* * Not updated in UI
* * MB gets gateway response

* Good reference number to check if query works at all: pi_1ITrMmBMMkzTUXRp5RLDB8GV, uuid: 5990e916a29da1740d00ef4e9a87fa4e
* * set that to a declined status as well as it's invoice
* * clicked the query button in the UI to confirm that it would be queried (it was queried)
* * **interesting that following the retestly steps (deleting the reference_id in db) resulted in a new reference_id upon query**
* * * new id is ch_1ITrMnBMMkzTUXRpjPZRvXd0
* * * Could relate to being in a new environment that isn't using pi. I would still think it would change the id but use the pi prefix instead

## The previous tests were flawed. Start over with same process
#### Process
* remove all data like the retestly test does
* [DO NOT REMOVE THE REFERENCE_ID (this is the difference)](d9ffe6b00494c17dbdcf5475fb45c6128ca418b7)
#### Test on a charge
* reference_id: pi_1ITpZSBMMkzTUXRpfiBZwLTC
* transaction_uuid: 59907fc5f7e22c28cfc1114219ba2e1f
* invoice_id: 3227140460211807991
##### Result
Successful query of the charge

#### Test on a refund (before change to code)
* reference_id: re_1IQ6gvBMMkzTUXRpAgCZJ0lk
* transaction_uuid: 595b99966edfcb9270051d4f719ff833
* invoice_id: 3219696073365893079
##### Result
Unsuccessful. Did not properly update the transaction
##### Result after building code change into qa2 (into consumers/stripe)
* It is looking for the refund under the 'setup_intents' endpoint, the query for the charge went to 'payment_intents' endpoint which I believe refunds should as well
##### Result after building code change into qa2 (into gateways/stipe_payments_intents/config)
* it looked to the charges endpoint. I will try adding it in both locations now to get it to the correct place
##### Result after building code change into qa2 (both places at the same time now)
Queried the payment_intents endpoint, but didn't find the transaction. (need to look at the refunds endpoint...)
##### Result after adding in a condition for refunds to the right endpoint in config.js
* Query came back from gateway and found the refund
* reset the message to success but the status is still declined.
* * The response being sent from MB to RA has 'success: true' and 'refunded: false' and 'status: succeeded'
* * I'm guessing the refunded false is due to the fact that this was a query of the refund, so it wasn't refunded in this call.

## Looking in RA
* app/consumers/transactions/updaters/query_updater.rb
* * line 83 `def process_refund_update`
* * also `base_updater.rb` line 44 through 65
* * will also need to update the spec for it


#### Test with three changes mention made
* reference: re_1IP1HfBMMkzTUXRprUCYDxod
* uuid: 594c27ce1b22bc0d800b4c4cee82cfec
* invoice: 3217522458491250690