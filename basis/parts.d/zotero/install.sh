#!/bin/sh


#if ! grep -q 10 /etc/issue.net; then exit 0;fi 

echo *****************************zotero***************************************
echo ************exit*********************************


# download and unpack
cd $(dirname $0)


app="Zotero-5.0.96_linux-x86_64.tar.bz2"


#install

test -d /opt/zotero && rm -r /opt/zotero


tar -xjf ./$app -C /opt/

mv /opt/Zotero* /opt/zotero

test -h /usr/share/pixmaps/zotero.ico && rm /usr/share/pixmaps/zotero.ico 
ln -s /opt/zotero/chrome/icons/default/default48.png /usr/share/pixmaps/zotero.ico

test -h /usr/bin/zotero && rm /usr/bin/zotero
ln -s /opt/zotero/zotero /usr/bin/.


cp ./zotero.desktop /opt/zotero/.

test -h /usr/share/applications/zotero.desktop && rm  /usr/share/applications/zotero.desktop
ln -s /opt/zotero/zotero.desktop /usr/share/applications/.




#bash -c "$(dirname $(realpath $(echo %k | sed -e 's/^file:\/\///')))/zotero -url %U"
