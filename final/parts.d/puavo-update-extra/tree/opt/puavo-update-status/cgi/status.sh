#!/bin/sh

printf "Content-Type: text/plain\n"
printf "Status: 200 OK\n\n"

update=$(cat /images/image_update.stats|xargs)

power=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0|grep "state:\|percentage:"|sed -e "s/://g"|xargs)

printf "host %s %s %s\n" "$(hostname)" "$update" "$power"




# =;eth0;IPv4;puavo\032laptop\032zeus-011-2;SSH-Fernzugriff;local;zeus-011-2.local;192.168.1.197;22;
