#/bin/sh


exit 0

cd $(dirname $0)
test -n "$(ls ./profile.d)" && cp ./profile.d/* /etc/profile.d/.

