#!/bin/sh

cd $(dirname $0)

if ! test -d snapbtrex/;then
    git clone https://github.com/yoshtec/snapbtrex/
fi

cp snapbtrex/snapbtrex.py /usr/local/bin/snapbtrex



