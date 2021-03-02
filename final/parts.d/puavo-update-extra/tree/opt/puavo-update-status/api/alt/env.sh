#!/bin/bash

#http://www.yolinux.com/TUTORIALS/BashShellCgi.html

echo "Content-type: text/html"
echo ""

echo '<html>'
echo '<head>'
echo '<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">'
echo '<title>Environment Variables</title>'
echo '</head>'
echo '<body>'
echo 'Environment Variables:'
echo '<pre>'
/usr/bin/env

# REQUEST_URI=/cgi/env.sh/uhu/gaga/mmmmmm?ooo=iiiiiiiii&uuuu=7
# SCRIPT_NAME=/cgi/env.sh
# PATH_INFO=/uhu/gaga/mmmmmm
# QUERY_STRING=ooo=iiiiiiiii&uuuu=7
# REMOTE_ADDR=127.0.0.1
# SERVER_ADDR=127.0.0.1
echo
echo
mpath(){
#    local idx=$1
    echo $PATH_INFO | cut -d"/" -f $1
}

index=1
case ( mpath $index ) in
    network)
	echo network
	;;
    device)
	echo device
	;;
    *)
	echo ??????
	;;
esac




echo '</pre>'
echo '</body>'
echo '</html>'

exit 0

HTTP_ACCEPT_ENCODING=gzip, deflate
SERVER_NAME=zeus-011.basel.opinsys.fi
SCRIPT_NAME=/cgi/env.sh
GATEWAY_INTERFACE=CGI/1.1
SERVER_SOFTWARE=webfs/1.21
PATH_INFO=/uhu/gaga/mmmmmm
DOCUMENT_ROOT=/opt/puavo-update-status
HTTP_UPGRADE_INSECURE_REQUESTS=1
PWD=/
REQUEST_URI=/cgi/env.sh/uhu/gaga/mmmmmm?ooo=iiiiiiiii&uuuu=7
QUERY_STRING=ooo=iiiiiiiii&uuuu=7
HTTP_ACCEPT_LANGUAGE=de,en-US;q=0.7,en;q=0.3
HTTP_ACCEPT=text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8
REMOTE_PORT=41670
SERVER_ADMIN=root@localhost
HTTP_HOST=localhost:1649
HTTP_CONNECTION=keep-alive
SERVER_ADDR=127.0.0.1
HTTP_USER_AGENT=Mozilla/5.0 (X11; Linux x86_64; rv:84.0) Gecko/20100101 Firefox/84.0
SHLVL=1
SERVER_PROTOCOL=HTTP/1.1
SERVER_PORT=1649
SCRIPT_FILENAME=/opt/puavo-update-status/cgi/env.sh
REMOTE_ADDR=127.0.0.1
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin
REQUEST_METHOD=GET
_=/usr/bin/env
