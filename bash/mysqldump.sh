#!/bin/bash
#ogcyb3r mysql dump over shell (localhost) / server
#dont know how to use it :( leave it
#host=$1 #user=$2 #pass=$3
mysqldump --all-databases --single-transaction --quick --lock-tables=false > full-backup-$(date +%F)-$2.sql -h $1 -u $2 -p$3
echo "full-backup-$(date +%F)-$2.sql"
