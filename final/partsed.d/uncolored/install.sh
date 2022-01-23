#/bin/sh
cd $(dirname $0)


#download and unpack

if test -z "$(ls|grep .deb)";then
    wget https://github.com/n457/Uncolored/releases/download/v.0.10.2/Uncolored-v.0.10.2-linux-x64.deb
fi

           

#install
dpkg -i *.deb   
