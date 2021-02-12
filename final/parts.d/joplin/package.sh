#!/bin/sh

cd $(dirname $0)

ROOT=$(basename $(pwd))

echo $PWD
echo $ROOT


APP="Joplin-1.7.11.AppImage"

#doenaload
if ! test -f $APP; then
   wget https://github.com/laurent22/joplin/releases/download/v1.7.11/$APP
fi

#install
BIN="usr/local/bin"
test -d $ROOT/$BIN || mkdir -p $ROOT/$BIN
test -d $ROOT/usr/share/applications/ || mkdir -p $ROOT/usr/share/applications/
test -d $ROOT/usr/share/pixmaps/ || mkdir -p $ROOT/usr/share/pixmaps/



test -d $ROOT/opt/joplin/ || mkdir -p $ROOT/opt/joplin
mv $APP $ROOT/opt/joplin/Joplin.AppImage
chmod +x $ROOT/opt/joplin/Joplin.AppImage

cp ./joplin.png $ROOT/usr/share/pixmaps/.

cat <<EOF > $ROOT/$BIN/joplin
#!/bin/sh
/opt/joplin/Joplin.AppImage
exit
EOF
chmod +x $ROOT/$BIN/joplin

cat <<EOF > $ROOT/usr/share/applications/joplin.desktop
[Desktop Entry]
Name=Joplin - Notes
Comment=Notizen verwalten (Evernote)
Exec=joplin
Icon=/usr/share/pixmaps/joplin.png
Terminal=false
X-MultipleArgs=false
Type=Application
Categories=Office;
EOF


find . -name ${ROOT}_*.deb -exec rm \{\} \;
debinstall ./$ROOT
rm -rf ./$ROOT

exit
