## Import Tool Header Issues
* `unit_amount`s are treated differently in the import tool
* * Both are required to be in cents in the fine print of the field description
* * `plan_unit_amount` is not modified by the tool, so 20.00 will be imported as 20.00
* * `add_on_unit_amount` is divided by 100 (assuming it is input in cents) so 20.00 will be imported as .20

## Street vs Address
* in the account mapping.rb file it is looking for `source_data[:street1]` or street2
* * The data file given to customers is supplying an `address1` or 2.
* * The subscription_mapping.rf is looking for the correct `billing_address_1`
* * * However it differs in format `address1` vs `address_1`
