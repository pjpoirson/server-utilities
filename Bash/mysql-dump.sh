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
# Version: 1.1    
# Usage: bash mysql-dump.sh
#=================================================================================

date=`date +%Y%m%d-%H%M%S`
databases_list="$(echo "show databases;" | mysql | grep -vwE "(database|information_schema|mysql|performance_schema)")"

for database in $databases_list;
do
        dir_path=/my/local/backup/directory/
        backup_name=$database-$date
        tables_list="$(echo "use $database;show tables;" | mysql | grep -vwE "(Tables_in_$database)")"
        mkdir $dir_path$backup_name
        for table in $tables_list
        do
                mysqldump --single-transaction -h localhost $database $table > $dir_path$backup_name/$table.sql;
        done
        cd $dir_path && tar -zcvf $database-$date.tar.gz $dir_path$backup_name/ && rm -rf $backup_name/;
        sshpass -p 'xxxxxxxx' rsync --progress -avz --stats -r --delete-after --verbose -e 'ssh -oStrictHostKeyChecking=no -p xxxxx' $dir_path$backup_name.tar.gz user@hostname.com:/the/target/directory/ > /tmp/mysql-backup-rsync.log
done

# Removing old backups (
find $dir_path* -type f -mtime +2 -delete
