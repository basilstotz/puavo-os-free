#!/bin/sh

cd $(dirname $0)
ROOT=$(basename $(pwd))
VERSION=$(date +%s)

test -f ./edulo_amd64.deb || wget -O ${ROOT}_${VERSION}_amd64.deb https://management.edulo.com/edulo_amd64.deb

exit

