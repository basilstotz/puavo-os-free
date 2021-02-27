#!/bin/sh



cd $(dirname $0)


bin=$(which puavo-install-and-update-ltspimages)
test -f $bin.ori || cp $bin $bin.ori

#grep 'image_server_by_dns=$(lookup_image_server_by_dns)' $bin.ori || leave
sed $bin.ori -e 's@--ca-certificate=/etc/puavo-conf/rootca.pem@--no-check-certificate@' > $bin

exit


leave(){
    echo "error"
    exit 1
}
