#!/bin/sh


echo "puavomenu buster"

cd $(dirname $0)

#cp ./pixmaps/* /usr/share/pixmaps/.

./patch-menu.sh

cp ./puavo-menu-moreapps /usr/local/sbin/.

cp 91-*.json /etc/puavomenu/menudata/.

#cp 85-webapps.json /etc/puavomenu/menudata/.



