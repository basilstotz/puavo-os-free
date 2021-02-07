#/bin/sh
cd $(dirname $0)

cp -r Abbozza-Tool /opt/arduino-ide/tools/Abbozza
cp -r Abbozza-Library /opt/arduino-ide/libraries/Abbozza

echo 'if ! test -d $HOME/.abbozza; then cp -r /opt/arduino-ide/tools/Abbozza/dot.abbozza $HOME/.abbozza;fi'>/etc/profile.d/abbozza-cfg.sh
