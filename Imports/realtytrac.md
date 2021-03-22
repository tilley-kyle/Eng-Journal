# realtytrac
[SUPPORTENG-8400](https://jira.recurly.net/browse/SUPPORTENG-8400)
**Start** 03/22/2021
**Subdomain** realtytrac
**API Key Name** Realtytrac_Import
**Next Bill Date For Merchant** March 31

## Description
* 4 phase import that is straightforward except that there are 4 phases that get interlocked.

### 03/22/2021
* Going to do prep work today to get it
* Ran through the prep with the CEs
* * all acounts but 4 look good
* * Those 4 use the default namespace for billing info
* All subscriptions failed because they didn't include values for 'plan_unit_amount'
* Update the jira and tagged Monica about this info
* Should be a quick import if they are okay with all of the plan unit amounts defaulting to what ever is in their site
