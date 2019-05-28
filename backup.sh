#!/bin/bash
DBNAME=/data/MyDatabaseName.FDB
BCKDIR=/backup/`date +%Y`/
BCKNAME=$BCKDIR/MyDatabaseName-`date +%F`.fbk
LOGNAME=$BCKDIR/log/MyDatabaseName-`date +%F`.log
if [ ! -d $BCKDIR ]; then
mkdir $BCKDIR
fi
if [ ! -d $BCKDIR/log ]; then
mkdir $BCKDIR/log
fi
rm -f $BCKNAME.gz
rm -f $LOGNAME.gz
(gbak -b -v localhost:$DBNAME -user sysdba -pass masterkey $BCKNAME 2>&1) > $LOGNAME
#echo "Backup complete"
gzip $BCKNAME
gzip $LOGNAME
#echo "Compresion complete"

# Upload to FTP server
# Curl needs to be installed in order to use command below

#curl -sS -T $BCKNAME.gz ftp://username:password@10.x.x.x/folder/
