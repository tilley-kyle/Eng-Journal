# TMUX KILL REFACTOR
### Refactor make tmux_run to store data for a potential make graceful exit
### Date Created: 01/15/2021
### Date Start: 01/25/2021
### Date PR:
### Date Closed:

### Summary
* Right now the tmux graceful exit script needs a user to put in all the data into it to initiae a graceful exit on every window. This will take time and cause more errors to occur. To solve when the TMUX run scrip is initiated it will create a file for the graceful exit script to read from to handle that input

### Things to consider
* graceful exit script require:
* * All of the following are created in the tmux_run script
* * type of import being run - "1) Accounts + Billing OR Accounts Only"   "2) Subscriptions"
* * subdomain
* * num_of_batches
* * start_batch_index
* * session_name

* tmux_run script write a csv file
* * subdomain_graceful_exit_timestamp.csv
* * headers: operation, subdomain, num_of_batches, start_batch_index, session_name



### Difficulties