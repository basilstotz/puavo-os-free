if ! test "$UID" = 0; then
if puavo-conf puavo.profiles.list| grep -q "laptop,personal" ;then
   systemctl --user start xdg-desktop-portal-gtk.service || true
fi
fi
