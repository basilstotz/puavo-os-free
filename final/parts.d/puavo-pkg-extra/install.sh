#!/bin/sh

cd $(dirname $0)

cp -r ./root/.puavo /root/

# should run bin.d here too!!

cp ./newapps.png /usr/share/pixmaps/newapps.png

mkdir -p /usr/local/sbin/
cp ./puavo-init-pkg-extra /usr/local/sbin/.
cp ./puavo-patch-50-default-json /usr/local/sbin
cp ./puavo-menu-moreapps /usr/local/sbin/

cp ./puavo-init-pkg-extra.service /etc/systemd/system/.
systemctl enable puavo-init-pkg-extra.service






