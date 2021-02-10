#!/bin/sh


if ! grep -q 10 /etc/issue.net; then exit 0;fi 

echo *****************************obs***************************************

# download and unpack
cd $(dirname $0)


if ! test -d v4l2loopback;then
   git clone https://github.com/umlaeute/v4l2loopback
fi    
if ! test -f v4l2loopback-init;then
   make v4l2loopback-init
fi    

 
#install
test -d /opt/v4l2loopback || mkdir -p /opt/v4l2loopback
cp -r ./v4l2loopback /opt/v4l2loopback/.

cp ./v4l2loopback-init /usr/local/bin/.
chmod a+s /usr/local/bin/v4l2loopback-init


cd /opt/v4l2loopback

cp ./v4l2loopback/udev/60-persistent-v4l2loopback.rules  /etc/udev/rules.d/.

cat <<'EOF' > ./install.sh
#
OPTS="devices=2 video_nr=10,20 card_label='OBS-Cam','OpenBoard-Cam' exclusive_caps=1,1"
#
cd /opt/v4l2loopback/v4l2loopback
make && make install && make install-utils     
depmod -a
modprobe -r v4l2loopback  
modprobe v4l2loopback $OPTS
EOF
chmod +x ./install.sh


exit 0



#OPTS="devices=1 video_nr=10 card_label='OBS-Cam' exclusive_caps=1"
#echo "options v4l2loopback $OPTS" > /etc/modprobe.d/v4l2loopback.conf
#echo "v4l2loopback" > /etc/modules-load.d/v4l2loopback.conf

cat <<EOF > /etc/systemd/system/v4l2loopback.service
[Unit]
Description=installls and loads kernel module v4l2loopback
After=syslog.target network.target nss-lookup.target

[Service]
Type=oneshot 
ExecStart=/opt/v4l2loopback/install.sh

[Install]
WantedBy=multi-user.target
EOF
systemctl enable v4l2loopback.service



