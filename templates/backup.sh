#!/bin/bash
BACKUP_CNF=/etc/cron.daily/backup.d/ckan.cnf
BACKUP_DIR=/srv/backups/ckan

# How many days worth of tarballs to keep around
num_days_to_keep=5

#----------------------------------------------------------
# Backups
#----------------------------------------------------------
now=`date +%s`
today=`date +%F`

if [ ! -d $BACKUP_DIR/$today ]
	then mkdir $BACKUP_DIR/$today
fi

PGPASSFILE=$BACKUP_CNF pg_dump -w -U ckan -h localhost -d ckan > $BACKUP_DIR/$today/ckan.sql
PGPASSFILE=$BACKUP_CNF pg_dump -w -U ckan -h localhost -d datastore > $BACKUP_DIR/$today/datastore.sql

cd $BACKUP_DIR
tar czf $today.tar.gz $today
rm -Rf $today

# Purge any backup tarballs that are too old
for file in `ls`
do
	atime=`stat -c %Y $file`
	if [ $(( $now - $atime >= $num_days_to_keep*24*60*60 )) = 1 ]
	then
		rm $file
	fi
done
