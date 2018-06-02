#!/bin/bash  

#source folder paths to sync
FOLDERS[0]="/usr/share/nginx/html/explusfuture/storage/chinaonlinestarwood"
FOLDERS[1]="/usr/share/nginx/html/explusfuture/storage/travelclick"

#destination configuration
USER="preeti"
HOST="192.168.3.29"
DESTINATION="/home/preeti/Desktop/Dipendu/"
MESSAGE=$'Migration Status:\n'
for dest in "${FOLDERS[@]}" 
do
  rsync -avzhe ssh ${dest}/ ${USER}@${HOST}:${DESTINATION}$(basename $dest) && MESSAGE+=${dest}$' folder copied successfully\n' && rm -rf ${dest} && MESSAGE+=${dest}$' folder deleted successfully\n'
done
echo "$MESSAGE"