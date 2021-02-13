#!/bin/sh


cd $(dirname $0)

if ! grep -q 10 /etc/issue.net; then exit 0;fi 

echo *****************************flatpak***************************************

unsquashfs -d /var/lib/flatpack ./flatpak.squashfs

apt-get -y install flatpak
#flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
