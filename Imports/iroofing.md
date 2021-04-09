# Iroofing with the CEs (Andy is lead)
## Start 03/31/2021

### Description
* Subs import
* as of start the merchant has no accounts/subs already created
* appears to be 1416 records

### Potentail Issues and Questions
* cards file not labelled where it is
* api key not labelled
* If account doesn't have join data, should it be acount only?
* deadline?
* What is 'Customer ID'? Is it to be ignored like 'Sub ID'?
* 4 digit zip codes (leading 0s lost?) for account and billing postal codes
* plan unit amounts did they actually give that to us in cents or are all of those dollars? no decimals so could be either but the amounts make me think dollars
* * They have one unit amount set as 0, is that really 0 or should that be nil to set as default as the plan value?
* Are they not having and addons, custom fields?
* no address 2 field for account or billing
* some blank billing addresses
* some non-traditional characters
* some of the accounts have multiple subs (to different plans)
* country 'GBP' is listed. Do they mean 'GB'

### 04/01/2021
* 1416 total records
* 1268 attempted prep
* 1212 succeeded prep
* * subtracted from eachother 91
* 57 failed the prep stage (no join data) 

