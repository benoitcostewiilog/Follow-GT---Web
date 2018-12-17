#!/bin/sh
cd /var/www/vhosts/mobilestock.fr/gt-logistics.mobilestock.fr

#effectue un dump de la base en parametre
mysqldump --user=usrgttst --password=pass2015gt gt_log_tst01 > gt.sql

#controle de l heure d execution & compression du fichier .sql
DATE=$(date +%d-%m-%Y)
H=$(date +%H) #heure d'execution du script
MATIN=14      #heure reference matin
CRTC="A"

if [ $H -le $MATIN ]
then
	CRTC="M"
fi

tar -zcvf GtRatier_${CRTC}_${DATE}.tgz gt.sql

#supression du fichier .sql
rm gt.sql

#upload du fichier vers le ftp de sauvegarde
#puis suppression du fichier creer il y a x jours
HOST='83.166.138.31'
PORT='21'
USER='axcu_dumpbdpresta'
PASSWD='welcome14'
ftp -i -n $HOST $PORT > /dev/null 2>&1 << END_SCRIPT
quote USER $USER
quote PASS $PASSWD
cd data/GtRatier
put GtRatier_${CRTC}_$(date +%d-%m-%Y).tgz
delete GtRatier_M_$(date -d "30 days ago" "+%d-%m-%Y").tgz
delete GtRatier_A_$(date -d "30 days ago" "+%d-%m-%Y").tgz
bye
END_SCRIPT

#supression du fichier .tgz
rm GtRatier_${CRTC}_$(date +%d-%m-%Y).tgz