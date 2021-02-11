#!/bin/sh
cd $(dirname $0)

echo *****************************thymio***************************************

if ! grep -q 10 /etc/issue.net; then exit 0;fi

test -f thymio-suite.tgz || wget https://www.amxa.ch/debian/tars/thymio-suite.tgz
test -f thymio-suite.tgz || exit 1

test -d /opt/thymio-suite || mkdir -p /opt/thymio-suite

tar -C /opt/thymio-suite/ -xz -f thymio-suite.tgz

cp /opt/thymio-suite/org.mobsya.ThymioSuite.desktop /usr/share/applications/.
cp /opt/thymio-suite/share/icons/hicolor/48x48/apps/org.mobsya.ThymioSuite.png /usr/share/pixmaps/.





