restore-xtrabackup
==================

Tool for restoring backup made with Percona XtraBackup.

Archives was generated with this command :

`innobackupex-1.5.1 --user='x' --password='x' --no-lock --stream=tar /dir/ | gzip - > /dir/mysql_'/bin/date +%Y-%d-%m-%H_%M'.tar.gz`

The script is for RedHat Linux only.


Script found on :
http://gotofreedom.org/success-story/sauvegarde-des-bases-mysqlmariadb-avec-xtrabackup/
