#!/bin/sh

cd $(dirname $0)

if ! grep -q 10 /etc/issue.net; then exit 0;fi 

echo *****************************obs***************************************

# download and unpack
if ! test -d v4l2loopback;then
   git clone https://github.com/umlaeute/v4l2loopback
fi    


#install
#OPTS="devices=1 video_nr=10 card_label='OBS-Cam' exclusive_caps=1"

OPTS="devices=2 video_nr=10,20 card_label='OBS-Cam','OpenBoard-Cam' exclusive_caps=1,1"
echo "options v4l2loopback $OPTS" > /etc/modprobe.d/v4l2loopback.conf
echo "v4l2loopback" > /etc/modules-load.d/v4l2loopback.conf

if ! lsmod|grep -q v4l2loopback; then 
   cd v4l2loopback
   make && make install     
   depmod -a
fi

modprobe -r v4l2loopback 
modprobe v4l2loopback $OPTS


exit 0


