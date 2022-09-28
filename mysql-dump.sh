#!/bin/bash
#=================================================================================
# Title: mysql-dump.sh
# Description : This script will : 
#                   - dump all tables of all databases in directories
#                   - tar each database directory and delete it
#                   - send the tar file to a backup server
#                   - remove old backups
# Date: 20201217
# Author: pjpoirson@gmail.com
# Version: 1    
# Usage: bash mysql-dump.sh
#=================================================================================

#!/bin/bash
date=`date +%Y%m%d-%H%M%S`
DATABASESLIST="$(echo "show databases;" | mysql | grep -vwE "(DATABASE|Database|information_schema|mysql|performance_schema|sys)")"

for database in $DATABASESLIST;
do
        TABLESLIST="$(echo "use $database;show tables;" | mysql | grep -vwE "(Tables_in_$database)")"
        mkdir /my/local/backup/directory/$database-$date
        for table in $TABLESLIST
        do
                mysqldump --single-transaction -h localhost $database $table > /my/local/backup/directory/$database-$date/$table.sql;
        done
        cd /my/local/backup/directory/ && tar -zcvf $database-$date.tar.gz /my/local/backup/directory/$database-$date/ && rm -rf $database-$date/;
        sshpass -p 'xxxxxxxx' rsync --progress -avz --stats -r --delete-after --verbose -e 'ssh -oStrictHostKeyChecking=no -p xxxxx' /my/local/backup/directory/$database-$date.tar.gz user@hostname.com:/the/target/directory/ > /tmp/mysql-backup-rsync.log
done

# Removing old backups (
find /my/local/backup/directory/* -type f -mtime +2 -delete
