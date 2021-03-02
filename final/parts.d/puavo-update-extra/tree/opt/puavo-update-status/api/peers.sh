#!/bin/sh

printf "Content-Type: text/plain\n"
printf "Status: 200 OK\n\n"


dev=$(ip route|grep default|head -n1|xargs|cut -d\  -f5)
myip=$(ip addr|grep -v :|grep $dev|xargs|cut -d\  -f2|cut -d/ -f1)

list=$(avahi-browse -artp|grep "=;${dev};IPv4" | grep "laptop" | cut -d";" -f8)

answer="$myip"
for a in $list; do
    test "$myip" = "$a" || answer=" $answer $a"
done

echo $answer

exit



