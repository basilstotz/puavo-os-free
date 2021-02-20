#/bin/sh
cd $(dirname $0)

APP="SFViewer_1_8_4.sh"

#download and unpack
if ! test -f $APP;then
    wget https://www.amxa.ch/debian/tars/$APP
fi

           

#install
sh $APP -q   
