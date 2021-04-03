#!/bin/sh

#downlaod

if ! test -d brands;then
   wget https://amxa.ch/debian/tars/printer-brands.tar.gz
   tar -xzf printer-brands.tar.gz
fi

echo -n "printer-ppds installing ....."

cd $(dirname $0)

for P in brands/*; do
    $P/install.sh
done


echo "done"



  


