#!/bin/bash
#=================================================================================
# Title: disk-usage-report.sh
# Description : This script will :
#                   - Send un email when the used space is over 80%
#                     of the total disk capacity
# Date: 20180910
# Author: pjpoirson@gmail.com
# Version: 1
# Usage: bash disk-usage-report.sh
#=================================================================================
# Date format:[10/Sep/2018:09:28:02 +0200]
DATE="`date -d'now' +[%d/%b/%Y:%H:%M:%S` `date -d'now' +%z]`"
MESSAGE="$DATE `hostname`"

HD_LMT=80%

list=`df | sort -n`
list=($list) #Create list from string
len=${#list[*]} #Calculate length of list

for ((i=0; i<len; i++)) #Iterate over list
do
    if [[ ${list[i]} == /dev/sd*  ]] || [[ ${list[i]} == /dev/root  ]] #Partial string matching for /dev drives
    then
        if [ ${list[i+4]} \> $HD_LMT ] #Check utilisation. > needs to be escaped
        then
            disk=$(basename ${list[i]})
            MESSAGE="$MESSAGE ALERT  Disk:$disk ${list[i+4]}"
            echo -e `hostname` "Disk:"$disk "\n\n" `date` | mail -s "[REPORT] Disk usage ${list[i+4]} "`hostname` User adress1@hostname.com,adress2@hostname.com
        fi
    fi
done
echo $MESSAGE
