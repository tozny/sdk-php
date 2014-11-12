#!/bin/bash

# $1 is the output directory

if [ -z "$1" ]; then
  echo "usage: $0 <output directory>"
  exit 1;
fi

SCRIPT_DIR=packaging/debian

API_CLIENT_DEB_DIR=/tmp/tozny-api-php-client

rm    -rf $API_CLIENT_DEB_DIR
mkdir -p  $API_CLIENT_DEB_DIR/DEBIAN
mkdir -p  $API_CLIENT_DEB_DIR/var/www/library/tozny_client

cp $SCRIPT_DIR/control $API_CLIENT_DEB_DIR/DEBIAN
cp $SCRIPT_DIR/LICENSE $API_CLIENT_DEB_DIR/var/www/library/tozny_client
cp ./*.php             $API_CLIENT_DEB_DIR/var/www/library/tozny_client

fakeroot $SCRIPT_DIR/finish_package.sh $API_CLIENT_DEB_DIR $1