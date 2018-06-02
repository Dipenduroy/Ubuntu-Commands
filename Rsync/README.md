# Learn Rsync



Steps for autologin to destination server

Reference: https://www.thegeekstuff.com/2008/11/3-steps-to-perform-ssh-login-without-password-using-ssh-keygen-ssh-copy-id/

Note: Replace user and host with yours

Type : ssh-keygen

Press Enter thrice

Type : ssh-copy-id -i ~/.ssh/id_rsa.pub user@host

Enter password for user of destination server

Type : ssh user@host

And test if autologin works


Shell Script to migrate multiple folders to backup server and then remove those folders

```sh

#!/bin/bash  

#source folder paths to sync
FOLDERS[0]="/usr/share/nginx/html/explusfuture/storage/chinaonlinestarwood"
FOLDERS[1]="/usr/share/nginx/html/explusfuture/storage/travelclick"

#destination configuration
USER="preeti"
HOST="192.168.4.34"
DESTINATION="/home/preeti/Desktop/Dipendu/"
MESSAGE=$'Migration Status:\n'
for dest in "${FOLDERS[@]}" 
do
  rsync -avzhe ssh ${dest}/ ${USER}@${HOST}:${DESTINATION}$(basename $dest) && MESSAGE+=${dest}$' folder copied successfully\n' && rm -rf ${dest} && MESSAGE+=${dest}$' folder deleted successfully\n'
done
echo "$MESSAGE"
```
