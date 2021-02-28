#!/bin/sh

cd $(dirname $0)

./patch/lookup-image-server-by-dns-patch.sh
./patch/install-and-update-ltspimages-patch.sh

cp -r ./tree/* /

systemctl enable puavo-avahi-publish.service



