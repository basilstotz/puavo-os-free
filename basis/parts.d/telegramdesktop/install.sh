#/bin/sh
cd $(dirname $0)


#download and unpack

if ! test -d Telegram;then
    wget https://github.com/telegramdesktop/tdesktop/releases/download/v2.5.8/tsetup.2.5.8.tar.xz
    tar -xf tsetup.2.5.8.tar.xz
fi


#install
test -d /opt/telegram || mkdir -p /opt/telegram/
cp Telegram/* /opt/telegram/.
cp telegram.desktop /usr/share/applications/.
cp telegram.png /usr/share/pixmaps/.

