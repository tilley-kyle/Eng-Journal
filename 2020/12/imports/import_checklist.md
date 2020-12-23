# [company/mechant] Import
## Dates
#### Useful Links
* [Recurly Wiki for EncFS (mounting and unmounting)](https://wiki.recurly.net/display/DEV/How+to+use+EncFS)
* [v2-api-data-imports github readme](https://github.com/recurly/v2-api-data-imports)
* [Shared import gpg key](https://wiki.recurly.net/display/SE/Shared+Import+GPG+Key)
* [Import resource](https://wiki.recurly.net/display/SUP/Import+Resource)
* [Engineering Support for Imports/Exports google doc](https://docs.google.com/spreadsheets/d/1e3_b9XlRH2rwbUxARbHT8LBERtseGDX8LiknaA_Fu8k/edit#gid=0)
* [TMUX cheat sheet](https://tmuxcheatsheet.com/)
* [vim cheat sheet](https://vim.rtorr.com/)
####
- [ ] gcloud auth login --update-adc                                                    # gcloud auth done once per day
- [ ] gcloud compute ssh import-export --project=devops-f467c7d5 --zone=us-east4-a      # log into the import box
- [ ] tmux new -s sessionname                                                           # start a tmux session with name sessionname
- [ ] ./new_import.sh                                                                   # Starts a new import subdomain for the new client. will need to supply: subdomain, api key, p, and 3 (for production)
- [ ] cd [production subdomain]                                                         # move into the new subdomain
- [ ] cd data                                                                           # FIRST CHECK OF DATA, headers, empty fields, bad data types (1st time)
* Check UI for subdomain to confirm things like: plan codes, coupons, shipping, required address
* Take note of potential issues I see
- [ ] cd ..                                                                             # move back to subdomain level
- [ ] vim mapping.rb                                                                    # open up the mapping file
* based on first look at the data and the import docs provided
- [ ] make validate                                                                     # run the cards and accounts validator
* check results and reports for how many problems and what the problems are
* The report will tell us what fields that are requred by the api and will need to be addressed by the merchant for them to import
- [ ] cd data                                                                           # check the cards and accounts data again, check the changes (2nd time)
* Log any new potential issues
* Log that changes made seem to fix initial problems
- [ ] make prep                                                                         # run the prep script
* check to see if reports any problems
- [ ] cd data                                                                           # go back into data folder (3rd time)
* check data based on results of the make prep command
* if no issues were present there, still do triple check of accounts and cards files
- [ ] cd ..                                                                             # go back to subdomain level
- [ ] make run                                                                          # start praying
- [ ] watch results coming in, hopefully it's not blowing up                            # <- read that
* q + enter                                                                           # IF IT'S BLOWING UP, GRACEFUL EXIT TO SAVE LOGGING DATA
- [ ] cp [various results files]                                                        # copy the results file of successful or failed import to location to be shipped to merchant
- [ ] cd ..                                                                             # move into v2-api level
- [ ] cd subscription_import                                                            # move into subscriptions import level
- [ ] cd [subdomain]                                                                    # move into subdomain level of subs folder
- [ ] cd data                                                                           # move into data folder
- [ ] vim subscriptions.csv                                                             # check through subs data file (1st time)
* check for headers, missing fields such as: plan codes, coupons (these first two need to be checked before doing a 'make run'), billing info, account info
* log potential issues
- [ ] cd ..                                                                             # move back to sub level
- [ ] vim subscription_mapping.rb                                                       # open up mapping file
* Make sure headers match what I saw and what was provided by merchant
- [ ] cd data                                                                           # check the data again (2nd time)
* log any changes made by merchant that fixed previous errors and any new issues you notice
- [ ] cd ..                                                                             # move back to subdomain level
- [ ] make prep                                                                         # run the make prep on subscription
* check results for any errors that popped up
- [ ] cd data                                                                           # check data again (3rd time)
* log any issues you see or things you noticed got fixed.
- [ ] make run                                                                          # start praying
- [ ] watch results coming in, hopefully it's not blowing up                            # <- read that
* q + enter                                                                             # IF IT'S BLOWING UP, GRACEFUL EXIT TO SAVE LOGGING DATA
cp [various results files]                                                              # copy results files of successful or failed import to location to be shipped to merchant
- [ ] SUBDOMAIN=the_subdomain                                                           # unmount the data to re-encrypt it
cd ~/secure
fusermount -u ~/secure/$SUBDOMAIN/
- [ ] tmux kill-session sessionname                                                     # kill the tmux session
- [ ] exit                                                                              # exit the import/export box
- [ ] give yourself a premature congratulation                                          # do it, but you know something went wrong

