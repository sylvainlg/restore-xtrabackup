#!/bin/bash

if [ -z "$1" ]
  then
        echo "usage ./restore.sh nomdufichier a restaurer"
        exit;
fi

file=$(basename $1)

#Arret du serveur Mysql
echo "Arret du serveur Mysql"
service mysqld stop

#Renommage du rep des data de mysql && suppression d'une vieille restauration
echo "Renommage du repertoire de donnees Mysql"
rm -Rf /var/lib/mysql_old
mv /var/lib/mysql /var/lib/mysql_old

#Creation du rep data de mysql
echo "creation du repertoire mysql"
mkdir /var/lib/mysql

#Copie de l'archive dans le rep data Mysql
echo "Copie de l'archive a restaurer"
cp $1 /var/lib/mysql

#Décompression de l'archive
echo "Decompression de l'archive"
cd /var/lib/mysql && tar xzfi $file

#Chgt des droits Mysql
echo "Changement de droits des fichiers"
chown -R mysql:mysql /var/lib/mysql
restorecon -R /var/lib/mysql

#Effacement de l'archive dans le dossier data
echo "Purge de l'archive dans le dossier data de mysql"
echo $file
rm -f /var/lib/mysql/$file

#Relance du serveur
echo "Relance du serveur"
service mysqld start
