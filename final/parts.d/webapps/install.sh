#!/bin/bash

cd $(dirname $0)

test -d ./tree && rm -r ./tree
mkdir -p ./tree/usr/share/applications/
mkdir -p ./tree/usr/local/bin/
mkdir -p ./tree/usr/share/pixmaps

INPUT="./webapps.csv"
while IFS= read -r LINE; do
    #echo "$LINE"
    NAME=$(echo $LINE|cut -d\; -f1)
    TEXT=$(echo $LINE|cut -d\; -f2)
    URL=$(echo $LINE|cut -d\; -f3)

    #echo " name $NAME text $TEXT url $URL"

    ICON=$(find ./icons/  -name $NAME.png)
    test -n "$ICON" || ICON="./icons/default.png"
    cp $ICON ./tree/usr/share/pixmaps/
    
    BIN=$(find ./bin/ -name $NAME)
    if test -z "$BIN";then
cat <<EOF > ./tree/usr/local/bin/$NAME
#!/bin/sh
chromium --app $URL
exit $?
EOF
    else
	cp ./bin/$NAME > ./tree/usr/local/bin/$NAME
    fi
    chmod +x ./tree/usr/local/bin/$NAME

    
cat <<EOF > ./tree/usr/share/applications/$NAME.desktop
[Desktop Entry]
Name=$NAME
Comment=$NAME
Exec=$NAME
Icon=$ICON
Terminal=false
X-MultipleArgs=false
Type=Application
Categories=Web;
EOF
        
done < "$INPUT"


cp -r tree/* /
