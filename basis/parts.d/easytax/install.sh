#/bin/sh
cd $(dirname $0)




TAR="EasyTax2020BL_unix_1_0.tar.gz"

#download and unpack
if ! test -f $TAR;then
    wget  https://easytax.breitband.ch/files/$TAR 
fi

           

#install
test -d /opt/easytaxbl && rm -r /opt/easytaxbl

mkdir -p /opt/easytaxbl
tar -C /opt/easytaxbl/ -xzf $TAR

cp EasyTax2020BL.desktop /usr/share/applications/.

