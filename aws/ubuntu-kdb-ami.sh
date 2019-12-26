#!/bin/bash

echo "Running $0"

USER=kdb-app
BASEDIR=$(dirname $0)

UTILSDIR=$(dirname $BASEDIR)/utils

sudo -i -u jack $UTILSDIR/build-pkgs.sh

$BASEDIR/setup-user.sh $USER kdb

sudo -i -u $USER $BASEDIR/create-env-kdb.sh

# create ami
sudo -i -u $USER $BASEDIR/create-ami.sh kdb

echo "$0 complete"
