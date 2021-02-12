#!/bin/sh
cd $(dirname $0)
ROOT=$(basename $(pwd))
ls| grep -q ${ROOT}*.deb || ./package.sh
sudo dpkg -i $(ls |grep ${ROOT}*.deb)
exit


