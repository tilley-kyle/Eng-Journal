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
* gsutil cp gs://recurly-production1-us-secure-upload-appication/FILENAME # command to upload file from recurly secure place
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
* gpg --encrypt --recipient "solutions@recurly.com" --output output.gpg input.txt  # to encrypt a file
* script to batch thingsi
* * ruby setup_import.rb site-subdomain number data_file_location startingindex
* `shred -u file.csv`    #this will scramble and delete files so we safely remove PCI info
* mount | grep 'name'
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
:e file-you-want-to-move-to
* .  # repeat the last command you did
#### RCMD stuff
* rcmd exec POD_NAME -t -- rails c  # opens the rails c

#### Header for v2
* X-Api-Version: 2.29

#### SFTP and CHMOD
* `sftp sftp148@sftp.recurly.com`
* `chmod 644 [file]`
* https://wiki.recurly.net/display/SE/Transferring+Files+Uploaded+via+upload.recurly.com

####
`chrome://inspect/#devices`
NODE_ENV=test ./node_modules/.bin/mocha --inspect-brk test/integration/stripe_payment_intents/query.test.js




rcmd ll pods | grep 'script-runner'



    -- Query to validate manual invoice counts:
    SELECT id, manual_invoice_count
    FROM recurly_production.stats_recurly_billing
    WHERE site_id = (SELECT id FROM sites WHERE subdomain = 'realtytrac')
    AND manual_invoice_count > 0;


      SET @manual_invoice_count_id :=
      (SELECT id
        FROM recurly_production.stats_recurly_billing
        WHERE site_id = (SELECT id FROM sites WHERE subdomain = 'realtytrac')
        AND stat_date = '2021-03-26');

      UPDATE recurly_production.stats_recurly_billing SET manual_invoice_count = (manual_invoice_count - 425), updated_at = UTC_TIMESTAMP()
      WHERE id = @manual_invoice_count_id;

      SET @manual_invoice_count_id = NULL;

      Query to validate manual invoice counts:
      SELECT id, manual_invoice_count
      FROM recurly_production.stats_recurly_billing
      WHERE site_id = (SELECT id FROM sites WHERE subdomain = 'realtytrac')
      AND manual_invoice_count > 0;

* gsutil ls gs://recurly-enablement/transaction_issues