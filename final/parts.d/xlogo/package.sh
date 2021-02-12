#/bin/sh

#präamble
cd $(dirname $0)
ROOT=$(basename $(pwd))
BIN="/usr/bin"
mkdir -p $ROOT/$BIN
mkdir -p $ROOT/usr/share/pixmaps/
mkdir -p $ROOT/usr/share/applications/


VERSION="3.6.5"
TAR="XLogo-linux-x64.tar.gz"

test -f $TAR || wget https://www.abz.inf.ethz.ch/xlogoonline/$VERSION/$TAR

test -d $ROOT/opt/xlogo/ || mkdir -p $ROOT/opt/xlogo/
tar  -C $ROOT/opt/xlogo/ -xf $TAR
rm $TAR

echo "/opt/xlogo/XLogo" > $ROOT/$BIN/xlogo-offline
chmod +x $ROOT/$BIN/xlogo-offline

cp xlogo.png $ROOT/usr/share/pixmaps/.
cp xlogo.desktop $ROOT/usr/share/applications/.
cp xlogo-online.desktop $ROOT/usr/share/applications/.

#postamble
find . -name ${ROOT}_*.deb -exec rm \{\} \;
debinstall ./$ROOT
rm -rf ./$ROOT
