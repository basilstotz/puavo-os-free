if puavo.profiles.list| grep "laptop,personal" ;then
   systemctl --user start xdg-desktop-portal-gtk.service || true
fi
