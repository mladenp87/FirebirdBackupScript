# FirebirdBackupScript
A simple bash script that you can use to backup your Firebird Database on Linux or inside a linux docker container

Replace "MyDatabaseName.FDB" with the name of your database!

To run it with a cronjob on a host mashine while your firebird Server is running in a docker container, put this script somewhere that is visible to a docker container and add this line to your /etc/crontab on host:

00 00 * * * root docker exec -i myDockerContainerName /backup/scripts/backup.sh
