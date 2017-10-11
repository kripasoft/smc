# Create view

ade createview FUSIONAPPS -series FUSIONAPPS_PT.V2MIB_LINUX.X64
ade useview FUSIONAPPS
cd $ADE_VIEW_ROOT/fusionapps/dist/fusionapps/fa/deploy
ade expand *
ade mkrpivate *
ade mkprivate */*
ade mkprivate */*/*
ade mkprivate */*/*/*
ade mkprivate */*/*/*/*
find . -name ".ade_path" -exec rm {} \;

chmod -R 755 *
tar -cvhzf fa_deploy.tar.gz *.ear *.war

# deploying the ear to your SMC environment 

## shutdown all servers and make sure they are all down before working on the next set of tasks 
## ssh to the env

ssh lakrishn@rws66550fwks.us.oracle.com

cd /u01/APPLTOP/fusionapps/applications/fa

rm -r /u01/APPLTOP/instance/lcm/finops/backup_ear/deploy.backup

cp -R deploy /u01/APPLTOP/instance/lcm/finops/backup_ear/deploy.backup

cd deploy

scp lakrishn@rws66550fwks.us.oracle.com:/scratch/lakrishn/view_storage/lakrishn_FUSIONAPPS/fusionapps/dist/fusionapps/fa/deploy/fa_deploy.tar.gz .

tar -xzvf fa_deploy.tar.gz

# start all servers


