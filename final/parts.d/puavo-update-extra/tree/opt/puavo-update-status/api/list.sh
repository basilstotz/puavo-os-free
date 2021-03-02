#!/bin/sh

printf "Content-Type: text/html\n"
printf "Status: 200 OK\n\n"

cat <<EOF
EOF


peers=$(wget  -O - http://localhost:1649/cgi/peers.sh 2>/dev/null|xargs)
myip=$(echo $peers|cut -d\  -f1)

for addr in $peers; do
    #name=$(echo $a|cut -d";" -f1)
    #name=$(basename -s .local $name)
    #addr=$(echo $a|cut -d";" -f2)

    if fping -a $addr >/dev/null 2>&1;then
        answer=$(wget -O - http://$addr:1649/cgi/status.sh 2>/dev/null|xargs)

        host=$(echo $answer|cut -d\  -f2)
        image=$(echo $answer|cut -d\  -f4)
        image=$(basename -s .img $image)
	#image="$(echo $image|cut -d- -f1-4)-<b>$(echo $image|cut -d- -f5-7)</b>-$(echo $image|cut -d- -f8-9)"
	image="$(echo $image|cut -d- -f3-7)"
        phase=$(echo $answer|cut -d\  -f6)
        progress=$(echo $answer|cut -d\  -f8)
	supply=$(echo $answer|cut -d\  -f10)
	battery=$(echo $answer|cut -d\  -f12)
        wlan=$(echo $answer|cut -d\  -f14)
        uptime=$(echo "$answer"|cut -d\  -f16)
        uptime=$(printf '%dd %dh %dm %ds\n' $((uptime/86400)) $((uptime%86400/3600)) $((uptime%3600/60))  $((uptime%60)) )
	
	action=""
	style="style=\"color:black\""
        test "$addr" = "$myip" && style="style=\"color:blue\""	
        if test "$phase" = "finished" -a "$progress" = "100";then
	    action="<img alt=\"\" src=\"../system-log-out.png\" onhover=\"alert("sdfsdfsdf")\" onclick=\"update( '$addr' )\">"
	    if test  "$addr" != "$myip";then
	        action="$action<img alt=\"\" src=\"../system-reboot.png\" onclick=\"restart( '$addr' )\"><img alt=\"\" src=\"../system-shutdown.png\" onclick=\"poweroff( '$addr' )\">"
	        style="style=\"color:grey\""
	    else
		style="style=\"color:lightblue\""
	    fi
	fi
	
        echo "  <tr $style><td>$host</td><td>$image</td><td>$phase</td><td>$progress</td><td>$uptime</td><td>$battery</td><td>$supply</td><td>$wlan</td><td>$action</td></tr>"
    fi
done

cat <<EOF
EOF




exit

SERVER_SIGNATURE=
HTTP_KEEP_ALIVE=300
HTTP_USER_AGENT=Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.7.12) Gecko/20050922 Fedora/1.7.12-1.3.1
SERVER_PORT=80
HTTP_HOST=localhost
DOCUMENT_ROOT=/var/www/html
HTTP_ACCEPT_CHARSET=ISO-8859-1,utf-8;q=0.7,*;q=0.7
SCRIPT_FILENAME=/var/www/cgi-bin/env.sh
REQUEST_URI=/cgi-bin/env.sh?namex=valuex&namey=valuey&namez=valuez
SCRIPT_NAME=/cgi-bin/env.sh
HTTP_CONNECTION=keep-alive
REMOTE_PORT=37958
PATH=/sbin:/usr/sbin:/bin:/usr/bin
PWD=/var/www/cgi-bin
SERVER_ADMIN=root@localhost
HTTP_ACCEPT_LANGUAGE=en-us,en;q=0.5
HTTP_ACCEPT=text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
REMOTE_ADDR=198.168.93.176
SHLVL=1
SERVER_NAME=localhost
SERVER_SOFTWARE=Apache/2.2.3 (CentOS)
QUERY_STRING=namex=valuex&namey=valuey&namez=valuez
SERVER_ADDR=192.168.93.42
GATEWAY_INTERFACE=CGI/1.1
SERVER_PROTOCOL=HTTP/1.1
HTTP_ACCEPT_ENCODING=gzip,deflate
REQUEST_METHOD=GET
_=/usr/bin/env




# =;eth0;IPv4;puavo\032laptop\032zeus-011-2;SSH-Fernzugriff;local;zeus-011-2.local;192.168.1.197;22;
