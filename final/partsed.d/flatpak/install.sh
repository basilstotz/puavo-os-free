#!/bin/sh


cd $(dirname $0)

if ! grep -q 10 /etc/issue.net; then exit 0;fi 

echo *****************************flatpak***************************************

#test -d /var/lib/flatpak || mkdir -p /var/lib/flatpak/
#tar -C /var/lib/flatpack -xzf ./flatpak-bundle.tgz

cp ./profile.d/* /etc/profile.d/.

#apt-get -y install flatpak
#flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
