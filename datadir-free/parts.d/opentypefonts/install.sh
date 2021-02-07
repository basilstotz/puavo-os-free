#/bin/sh
cd $(dirname $0)


#download and unpack

#kleist fonts
if ! test -f Kleist-Fonts.zip;then
    wget http://kleist-digital.de/Fonts/Kleist-Fonts.zip
fi
#kps-fonts.ch
if ! test -d KPS-Fonts;then
    mkdir KPS-Fonts
    cd KPS-Fonts
    for L in $(cat ../kps-fonts.list);do
           wget http://kps-fonts.ch/kps_fonts/$L
    done
    cd ..
fi

exit

test -d /usr/share/fonts/otf || mkdir -p /usr/share/fonts/otf
unzip -d /usr/share/fonts/otf Kleist-Fonts.zip
cp -r ./KPS-Fonts /usr/share/fonts/otf
