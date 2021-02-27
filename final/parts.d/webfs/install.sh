#/bin/sh
echo "installing amxa-webfsd*******************************************"
cd $(dirname $0)

if ! test -d /opt/webfsd; then
  mkdir -p /opt/webfsd/
fi

cat <<EOF >/etc/systemd/system/amxa-webfsd.service
[Unit]
Description=WebfsD
After=syslog.target network.target nss-lookup.target

[Service]
Type=simple
ExecStart=/usr/bin/webfsd -F -p 8080 -r /opt/webfsd


[Install]
WantedBy=multi-user.target
EOF


systemctl enable amxa-webfsd.service


echo "done***************************************************************"
