#!/bin/sh

printf "Content-Type: text/html\n"
printf "Status: 200 OK\n\n"

cat <<EOF
<!doctype html>
<html lang="de">
<head>
  <meta charset="utf-8">
  <title>Puavo Update Status</title>
  <meta name="description" content="Puavo Update Status">
  <meta name="author" content="amxa.ch">
  <style>
  body {
    font-family: arial, sans-serif;
  }
  img {
    width: 24px;
    padding: 0px;
    padding-right: 10px;
    margin: 0px;
  }
  table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
  }
  th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
    background-color: #aaaaaa;
  }
  td {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
  }
  tr:nth-child(odd) {
    background-color: #eeeeee;
  }
</style>
<script>
function reload() {
  location.replace("http://localhost:1649/cgi/list.sh")
}
function update(addr) {
  location.replace("http://"+addr+":1649/cgi/update.sh")
}
function poweroff(addr) {
  location.replace("http://"+addr+":1649/cgi/poweroff.sh")
}
function restart(addr) {
  location.replace("http://"+addr+":1649/cgi/restart.sh")
}
</script>
</head>
<body>
<h1>Puavo Update Status</h1>
<table>
  <tr><th>Hostname</th><th>Image</th><th>Phase</th><th>Progress</th><th>Battery</th><th>State</th><th>Action</th></tr>
EOF

dev=$(ip route|grep default|head -n1|xargs|cut -d\  -f5)
myip=$(ip addr|grep -v :|grep $dev|xargs|cut -d\  -f2|cut -d/ -f1)



for a in $(avahi-browse -artp|grep "=;${dev};IPv4" | grep "laptop" | cut -d";" -f7-9); do
    name=$(echo $a|cut -d";" -f1)
    name=$(basename -s .local $name)
    addr=$(echo $a|cut -d";" -f2)

    if fping -a $addr >/dev/null 2>&1;then
        answer=$(wget -O - http://$addr:1649/cgi/status.sh 2>/dev/null|xargs)

        image=$(echo $answer|cut -d\  -f2)
        image=$(basename -s .img $image)
        phase=$(echo $answer|cut -d\  -f4)
        progress=$(echo $answer|cut -d\  -f6)
	supply=$(echo $answer|cut -d\  -f8)
	battery=$(echo $answer|cut -d\  -f10)

	action=""
	style="style=\"color:black\""
        test "$addr" = "$myip" && style="style=\"color:blue\""	
        if test "$phase" = "finished" -a "$progress" = "100";then
	    action="<img alt=\"\" src=\"../system-log-out.png\" onclick=\"update( $addr )\">"
	    if test  "$addr" != "$myip";then
	        action="$action<img alt=\"\" src=\"../system-reboot.png\" onclick=\"restart( $addr )\"><img alt=\"\" src=\"../system-shutdown.png\" onclick=\"poweroff( $addr )\">"
	        style="style=\"color:grey\""
	    else
		style="style=\"color:lightblue\""
	    fi
	fi
	
        echo "  <tr $style><td>$name</td><td>$image</td><td>$phase</td><td>$progress</td><td>$battery</td><td>$supply</td><td>$action</td></tr>"
    fi
done

cat <<EOF
</table>
<br/>
<button onclick="reload()">Seite neu laden</button>
</body>
</html>
EOF






# =;eth0;IPv4;puavo\032laptop\032zeus-011-2;SSH-Fernzugriff;local;zeus-011-2.local;192.168.1.197;22;
