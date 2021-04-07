#!/bin/sh

cd $(dirname $0)

#downlaod

if ! test -d brands;then
   wget https://amxa.ch/debian/tars/printer-brands.tar.gz
   tar -xzf printer-brands.tar.gz
fi

echo -n "printer-ppds installing ....."



for P in brands/*; do
    $P/install.sh
done


echo "done"



  


