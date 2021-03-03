# MLS Listings Inc
## subdomain = mlslistingsinc

## aculist import
* total: 110
* Success: 110
* Failure: 0

## Parent import
### with billing info
* Total: 4466
* Success: 4459
* Failure: 7 (bad address or billing postal codes)

### account only
* Total: 19493
* Success: 13054
* Failures: 6438


## Issue
* Leading 0s got eliminated from account codes.
* * Looks like they were cleared out in the sheet before I started working on them
* Account codes were messed up
* * Search every table to a column header
* * Selct something from platform schema
* * how do I search multiple column accross schema in sql
* * * accounts, subscription_versions, transactions
* * account_code
* Find record that was imported.
* * What I imported
* * What I got
* * This is how I imported
* * Salesforce
* * Find all tables need account codes
* * Find support data updates for anything we used to updatae account codes
* Who owns salesforce and jitterbit integration (ask Drew and Katie)
* * Will anything else get messed up
* * Why is salesforce int doing two way calls (get and put)
* **Get on katie**
* PR
* * rcmd manifest under QA support yaml
* * rcmd update app ~/recurly_repos/rekube/support-tools -m ~/recurly_repos/rcmd-release-manifests/qa/support.yaml --deploy
* * rcmd logs -f pod/$POD_NAME
* * rcmd rm job/script-runner-$jira

## Headers
card_reference_id,billing_token_id,account_code,email,first_name,last_name,address1,address2,city,state,postal_code,country,vat_number,parent_account_code,bill_to,gateway_code,billing_first_name,billing_last_name,billing_company_name,billing_address1,billing_address      2,billing_city,billing_state,billing_postal_code,billing_country,cc_month_expiration,cc_year_expiration,username,company_name,language,cc_emails,phone,acquition_cost_in_cents,acquisition_currency,acquisition_channel,acquisition_subschannel,acquisition_campaign,custo      m_account_field_1,custom_account_field_2,custom_account_field_3,status,subscription_id,subscription_custom_field_1,next_bill_date,remaining_paused_cycles,remaining_billing_cycles,total_billing_cycles,renewal_billing_cycles,currency,coupon_code,plan_code,plan_quantit      y,plan_unit_amount,add_on_code_1,add_on_quantity_1,add_on_unit_amount_1,collection_method,net_terms,po_number,terms_and_conditions,customer_notes,revenue_schedule_type,shipping_nickname,shipping_first_name,shipping_last_name,shipping_company,shipping_address_1,shipp      ing_address_2,shipping_city,shipping_province,shipping_postal_code,shipping_country,shipping_phone,shipping_email,shipping_address_id,shipping_method_code,shipping_amount_in_cents

## 02/23
* made a support script (okay, stole it) to update the account_codes.
* it properly iterates through the input csv, looks for the account codes in the db, and updates them in the three tables mentioned above
## 02/24
* Update 50 account codes
* update the 50 account fields
* ACCOUNT CODE UPDATE WORKS FINE.
* Jitterbit or SF integration is messing up the account data (first_name, last_name)

* UPDATED 15167 account codes based on the two reports (small batch and full batch)

### 02/25/2021
child account queries
Create PR to clear manual invoice counts:
# Query to validate manual invoice counts:
# SELECT id, manual_invoice_count
# FROM recurly_production.stats_recurly_billing
# WHERE site_id = (SELECT id FROM sites WHERE subdomain = 'mlslistingsinc')
# AND manual_invoice_count > 0;
SET @manual_invoice_count_id :=
(SELECT id
  FROM recurly_production.stats_recurly_billing
  WHERE site_id = (SELECT id FROM sites WHERE subdomain = 'mlslistingsinc')
  AND stat_date = '2021-02-25');

UPDATE recurly_production.stats_recurly_billing SET manual_invoice_count = (manual_invoice_count - 1618), updated_at = UTC_TIMESTAMP()
WHERE id = @manual_invoice_count_id;

SET @manual_invoice_count_id = NULL;

Query to validate manual invoice counts:
SELECT id, manual_invoice_count
FROM recurly_production.stats_recurly_billing
WHERE site_id = (SELECT id FROM sites WHERE subdomain = 'mlslistingsinc')
AND manual_invoice_count > 0;

Subs import results
Success: 1619
Failed: 1
One failure due to the account not imported yet

### Parent subs cleanup
# Query to validate manual invoice counts:
# SELECT id, manual_invoice_count
# FROM recurly_production.stats_recurly_billing
# WHERE site_id = (SELECT id FROM sites WHERE subdomain = 'mlslistingsinc')
# AND manual_invoice_count > 0;
SET @manual_invoice_count_id :=
(SELECT id
  FROM recurly_production.stats_recurly_billing
  WHERE site_id = (SELECT id FROM sites WHERE subdomain = 'mlslistingsinc')
  AND stat_date = '2021-02-25');

UPDATE recurly_production.stats_recurly_billing SET manual_invoice_count = (manual_invoice_count - 38), updated_at = UTC_TIMESTAMP()
WHERE id = @manual_invoice_count_id;

SET @manual_invoice_count_id = NULL;

Query to validate manual invoice counts:
SELECT id, manual_invoice_count
FROM recurly_production.stats_recurly_billing
WHERE site_id = (SELECT id FROM sites WHERE subdomain = 'mlslistingsinc')
AND manual_invoice_count > 0;


#### Child subs cleanup
5. Create PR to clear manual invoice counts:
# Query to validate manual invoice counts:
# SELECT id, manual_invoice_count
# FROM recurly_production.stats_recurly_billing
# WHERE site_id = (SELECT id FROM sites WHERE subdomain = 'mlslistingsinc')
# AND manual_invoice_count > 0;
SET @manual_invoice_count_id :=
(SELECT id
  FROM recurly_production.stats_recurly_billing
  WHERE site_id = (SELECT id FROM sites WHERE subdomain = 'mlslistingsinc')
  AND stat_date = '2021-02-25');

UPDATE recurly_production.stats_recurly_billing SET manual_invoice_count = (manual_invoice_count - 1), updated_at = UTC_TIMESTAMP()
WHERE id = @manual_invoice_count_id;

SET @manual_invoice_count_id = NULL;

Query to validate manual invoice counts:
SELECT id, manual_invoice_count
FROM recurly_production.stats_recurly_billing
WHERE site_id = (SELECT id FROM sites WHERE subdomain = 'mlslistingsinc')
AND manual_invoice_count > 0;

9 digit problem
5. Create PR to clear manual invoice counts:
# Query to validate manual invoice counts:
# SELECT id, manual_invoice_count
# FROM recurly_production.stats_recurly_billing
# WHERE site_id = (SELECT id FROM sites WHERE subdomain = 'mlslistingsinc')
# AND manual_invoice_count > 0;
SET @manual_invoice_count_id :=
(SELECT id
  FROM recurly_production.stats_recurly_billing
  WHERE site_id = (SELECT id FROM sites WHERE subdomain = 'mlslistingsinc')
  AND stat_date = '2021-02-26');

UPDATE recurly_production.stats_recurly_billing SET manual_invoice_count = (manual_invoice_count - 1), updated_at = UTC_TIMESTAMP()
WHERE id = @manual_invoice_count_id;

SET @manual_invoice_count_id = NULL;

Query to validate manual invoice counts:
SELECT id, manual_invoice_count
FROM recurly_production.stats_recurly_billing
WHERE site_id = (SELECT id FROM sites WHERE subdomain = 'mlslistingsinc')
AND manual_invoice_count > 0;


## Net terms and
* Count back 30 days and 'due_date'
* Try next_bill_date

## Looking at current term start dates
* Starting between 2021-03-01 and 2021-03-02: 1490 records
* 02 and 03:

## 3/2/2021
### Talk w/ Lex and Katie
* What is provisioning?
* solutions design workshop? What is that, large merchants tend to have them
* Why is this more confusing that I think it should be?
* billing alignment vs billing offsets
* Can update the invoices that have already renewed (like the march 1st ones) (also those invoices are sent out, what about then)
* Will then have to update all the underlying subs
* account code, subs uuid, new bill date and due dates,
* * Also need to know what they want to change
* Testing on updating things
* Does that use case of the offset make sense to them
* update on the invoices  and update on the subs
* Validate that offset works