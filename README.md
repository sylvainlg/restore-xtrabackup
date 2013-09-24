restore-xtrabackup
==================

Tool for restoring backup made with Percona XtraBackup.

Archives was generated with this command :
innobackupex-1.5.1 --defaults-file=/etc/my.cnf --user='xxx' --password='xxx' --no-lock --stream=tar /data/sql/ | gzip - > /data/sql/mysql_`/bin/date +%Y-%d-%m-%H_%M`.tar.gz
