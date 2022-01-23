#!/bin/sh

echo "saving state of applications"
test -d /var/local/puavo-img-tool/ || mkdir -p /var/local/puavo-img-tool/
#if ! test -f /var/local/puavo-img-tool/application.list;then
    ls /usr/share/applications/ > /var/local/puavo-img-tool/applications.list
#fi

exit 0
