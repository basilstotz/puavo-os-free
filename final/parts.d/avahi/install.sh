#!/bin/sh

cd $(dirname $0)

cp -r ./tree/* /

systemctl enable puavo-avahi-publish.service



