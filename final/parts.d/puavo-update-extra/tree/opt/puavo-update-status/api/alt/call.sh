#!/bin/sh




printf "Content-Type: text/plain\n"
printf "Access-Control-Allow-Origin: *\n"
printf "Status: 200 OK\n\n"


echo ***$QUERY_STRING*****

action=$(echo $QUERY_STRING|cut -d"&" -f1|cut -d"=" -f2)
addr=$(echo $QUERY_STRING|cut -d"&" -f2|cut -d"=" -f2)

cmd="wget -O - http://$addr:1649/cgi/$action.sh"
echo $cmd


answer=$($cmd)

echo $answer

exit



