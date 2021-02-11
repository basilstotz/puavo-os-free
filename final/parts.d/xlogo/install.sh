#/bin/sh

cd $(dirname $0)

VERSION="3.6.5"
TAR="XLogo-linux-x64.tar.gz"

test -f $TAR || wget https://www.abz.inf.ethz.ch/xlogoonline/$VERSION/$TAR
tar -xf $TAR

test -d /opt/xlogo/ || mkdir -p /opt/xlogo/
cp -r   XLogo-linux-x64/* /opt/xlogo/

echo "/opt/xlogo/XLogo" > /usr/local/bin/xlogo

cp xlogo.png /usr/share/pixmaps/.
cp xlogo.desktop /usr/share/applications/.


cp xlogo-online.desktop /usr/share/applications/.
