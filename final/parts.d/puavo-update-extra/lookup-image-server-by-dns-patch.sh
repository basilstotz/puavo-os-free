#!/bin/sh




bin="/usr/lib/puavo-ltsp-client/lookup-image-server-by-dns"

test -x $bin || exit 0

test -x $bin.ori || cp $bin $bin.ori



rep='a=$(avahi-browse -artp|grep "bootserver" |grep "="|cut -d";" -f8|head -n1);if test -n "$a";then image_server="${a}:872";else exit 1;fi'


sed $bin.ori -e "s@exit 1@$rep@" > $bin

