#!/bin/sh

cd $(dirname $0)

cp -r ./root/.puavo /root/

mkdir -p /usr/local/sbin/
cp ./puavo-init-pkg-extra /usr/local/sbin/.

cp ./puavo-init-pkg-extra.service /etc/systemd/system/.
systemctl enable puavo-init-pkg-extra.service






