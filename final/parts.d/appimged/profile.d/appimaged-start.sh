if puavo.profiles.list| grep -q "laptop,personal" ;then
   systemctl --user start appimaged.service || true
fi
