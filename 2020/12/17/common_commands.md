# common_commands
## Imports/Exports
### things to remember
* when setting up the account in the app, make sure to check things such as...
* * coupons
* * plans
* * shipping
* * turn off email for: cancelled subs, new invoice, and new subs
* * leading 0's on subs postal code will cause failures
### common commands
#### impors/exports
* **q + enter**      # graceful exit
* gcloud auth login --update-adc     # you only need to run this once per day
* gcloud compute ssh import-export --project=devops-f467c7d5 --zone=us-east4-a    # to log into the box
* gcloud compute scp --project=devops-f467c7d5 --zone=us-east4-a ~/local_file.txt import-export:~/    # to import a doc
* gcloud compute scp --project=devops-f467c7d5 --zone=us-east4-a import-export:~/remote_file.txt ~/    # to import from inside the box
* [link to mounting stuff](https://wiki.recurly.net/display/DEV/How+to+use+EncFS)
* new_imports.sh
* * follow steps prompted to make things set up
* cp path_to_file path_to_end_location
* SUBDOMAIN=the_subdomain                                           # unmounting to re-encrypt data
cd ~/secure
fusermount -u ~/secure/$SUBDOMAIN/
* cd ~/secure                                                       # remoutning to de-encrypt
encfs -o allow_other ~/secure/$SUBDOMAIN.enc/ ~/secure/$SUBDOMAIN/
* gpg-decrypt.sh subdomain file.gpg   # helps automate decrypting files
* script to batch things
* * ruby setup_import.rb site-subdomain number data_file_location startingindex
#### TMUX
* tmux new -s sessionname    # do this to start a new tmux session
* tmux kill-session -t sessionname # kill the session (could be different command, will find out later)
**find the detach command and put it here**
* tmux attach -t sessionname    # attach to a session
#### CSV stuff
* sed 's/[\x0\r]//g' source.csv > target.csv    # removes null values from CSV - and outputs to new file
* sed 's/"//g'    # removes all double quotes on each line.
#### cool things
* `grep -rsi "thing i'm looking up"`    # look up a specific thing in my file system
* rm -rf file_names # be careful if 
#### Vim Stuff
* :%s/thingtoreplace/thingchanging/gc
* imap <c-l> =><Space>    makes rockets