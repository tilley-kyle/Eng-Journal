### https://jira.recurly.net/browse/SUPPORTENG-8555
extra context might be on notes from the 5th
## Goal
* Import subs with gateway codes
* * this will link each sub to a certain of two gateways to be used.

* look up the v3 api, version 2999-01-01
* * https://developers.recurly.com/api/v2999-01-01/index.html#tag/subscription
* * This allows us to add the gateway_code to the sub import

* There is a header to
* Header for the skip auth
* search for `skip auth true`
* could add the exp api version
* payments/dx  footknife
* grep -rsi auth     # do this in the base of the v2 repo.
* * find a way to add the exp api version to this area

* make an immediate change to a sub to make sure it goes to the same gateway
* make default gateway

* **Look in prep_account_import_payload.rb**
* headers = { 'Recurly-Skip-Authorization' => true } # this could be where to add the exp api version

### MLS testing on kyle-prod
* paypal payflow prow
* * gateway code: obyq9n4i0f73
* Braintree
* * gateway code: obys0cyi9tcp


### Idea to test.
* Might need to try my own http requests. net.http
* * Will need to do it that way



* make a sub for some amount
* https://graylog.production.recurly.net/search?q=%22%2Fv2%2Finvoices%2F91331%2Frefund%22&rangetype=absolute&streams=5e3b333cf10f6b0027859277&from=2021-01-29T00%3A00%3A00.000Z&to=2021-02-01T00%3A00%3A00.000Z
<invoice>
  <amount_in_cents>****</amount_in_cents>
  <refund_method>transaction_first</refund_method>
  <external_refund>true</external_refund>
  <payment_method>credit_card</payment_method>
  <description>20-21 AHLTV Auto-renew Correction</description>
</invoice>
* API void refund