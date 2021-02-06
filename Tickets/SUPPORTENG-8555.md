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