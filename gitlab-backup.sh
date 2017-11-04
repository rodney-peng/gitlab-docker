echo "#### Creating backup ####"
docker exec -t gitlab gitlab-rake gitlab:backup:create
echo "##### Deleting old backups #####"
docker exec -t gitlab bash -c "cd /var/opt/gitlab/backups; ./backup.sh"
echo "##### Sync to local #####"
rsync -rltv --delete /mnt/data/gitlab/data/backups/ /temp/gitlab
echo "##### Sync to remote #####"
rsync -rltv --delete -e ssh /temp/gitlab nas:/share/Engineering/Backup
echo "#### Done #####"
