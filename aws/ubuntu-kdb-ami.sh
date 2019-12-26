#!/bin/bash

echo "Running $0"

USER=kdb-app
BASEDIR=$(dirname $0)

ENVREPODIR=$(dirname $BASEDIR)
sudo -i -u jack $ENVREPODIR/utils/build-pkgs.sh

$BASEDIR/setup-user.sh $USER kdb

sudo -i -u $USER $ENVREPODIR/dotfiles/util/init.sh

sudo -i -u $USER $BASEDIR/create-env-kdb.sh

sudo -i -u $USER $BASEDIR/create-ami.sh kdb-app

echo "$0 complete"
