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
- [ ] gcloud auth login --update-adc                                                    # _gcloud auth done once per day_
- [ ] gcloud compute ssh import-export --project=devops-f467c7d5 --zone=us-east4-a      # _log into the import box_
- [ ] tmux new -s sessionname                                                           # _start a tmux session with name sessionname_
- [ ] ./new_import.sh                                                                   # _Starts a new import subdomain for the new client. will need to supply: subdomain, api key, p, and 3_(for production)
- [ ] cd [production subdomain]                                                         # _move into the new subdomain_
- [ ] cd data                                                                           # _FIRST CHECK OF DATA, headers, empty fields, bad data types (1st time)_
* Check UI for subdomain to confirm things like: plan codes, coupons, shipping, required address
* Take note of potential issues I see
- [ ] cd ..                                                                             # _move back to subdomain level_
- [ ] vim mapping.rb                                                                    # _open up the mapping file_
* based on first look at the data and the import docs provided
- [ ] make validate                                                                     # _run the cards and accounts validator_
* check results and reports for how many problems and what the problems are
* The report will tell us what fields that are requred by the api and will need to be addressed by the merchant for them to import
- [ ] cd data                                                                           # _check the cards and accounts data again, check the changes (2nd time)_
* Log any new potential issues
* Log that changes made seem to fix initial problems
- [ ] make prep                                                                         # _run the prep script_
* check to see if reports any problems
- [ ] cd data                                                                           # _go back into data folder (3rd time)_
* check data based on results of the make prep command
* if no issues were present there, still do triple check of accounts and cards files
- [ ] cd ..                                                                             # _go back to subdomain level_
- [ ] make run                                                                          # _start praying_
- [ ] watch results coming in, hopefully it's not blowing up                            # _<- read that_
* q + enter                                                                             # _IF IT'S BLOWING UP, GRACEFUL EXIT TO SAVE LOGGING DATA_
- [ ] cp [various results files]                                                        # _copy the results file of successful or failed import to location to be shipped to merchant_
- [ ] cd ..                                                                             # _move into v2-api level_
- [ ] cd subscription_import                                                            # _move into subscriptions import level_
- [ ] cd [subdomain]                                                                    # _move into subdomain level of subs folder_
- [ ] cd data                                                                           # _move into data folder_
- [ ] vim subscriptions.csv                                                             # _check through subs data file (1st time)_
* check for headers, missing fields such as: plan codes, coupons (these first two need to be checked before doing a 'make run'), billing info, account info
* log potential issues
- [ ] cd ..                                                                             # _move back to sub level_
- [ ] vim subscription_mapping.rb                                                       # _open up mapping file_
* Make sure headers match what I saw and what was provided by merchant
- [ ] cd data                                                                           # _check the data again (2nd time)_
* log any changes made by merchant that fixed previous errors and any new issues you notice
- [ ] cd ..                                                                             # _move back to subdomain level_
- [ ] make prep                                                                         # _run the make prep on subscription_
* check results for any errors that popped up
- [ ] cd data                                                                           # _check data again (3rd time)_
* log any issues you see or things you noticed got fixed.
- [ ] make run                                                                          # _start praying_
- [ ] watch results coming in, hopefully it's not blowing up                            # _<- read that_
* q + enter                                                                             # _IF IT'S BLOWING UP, GRACEFUL EXIT TO SAVE LOGGING DATA_
cp [various results files]                                                              # _copy results files of successful or failed import to location to be shipped to merchant_
- [ ] SUBDOMAIN=the_subdomain                                                           # _unmount the data to re-encrypt it_
cd ~/secure
fusermount -u ~/secure/$SUBDOMAIN/
- [ ] tmux kill-session sessionname                                                     # _kill the tmux session_
- [ ] exit                                                                              # _exit the import/export box_
- [ ] give yourself a premature congratulation                                          # _do it, but you know something went wrong_

