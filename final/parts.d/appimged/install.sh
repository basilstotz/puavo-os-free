#!/bin/bash

cd $(dirname $0)

# Remove pre-existing similar tools
#systemctl --user stop appimaged.service || true
#sudo apt-get -y remove appimagelauncher || true

# Clear cache
#rm "$HOME"/.local/share/applications/appimage*

# Optionally, install Firejail (if you want sandboxing functionality)

# Download
if test -z "$(find . -name 'appimaged-*.AppImage')";then
   wget -c https://github.com/$(wget -q https://github.com/probonopd/go-appimage/releases -O - | grep "appimaged-.*-x86_64.AppImage" | head -n 1 | cut -d '"' -f 2)
   chmod +x appimaged-*.AppImage
fi

# Launch
#./appimaged-*.AppImage

mkdir -p /opt/appimaged/
cp ./appimaged-*.AppImage /opt/appimaged/.
cp  appimaged.service     /etc/systemd/user/appimaged.service
cp ./profile.d/* /etc/profile.d/

exit

