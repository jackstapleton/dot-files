#!/bin/bash


echo -e "\nRunning $0\n"

BASEDIR=$(dirname $0)

bash $BASEDIR/apt-installs.sh
bash  $BASEDIR/setup-user.sh kdb-aws kdb

sudo -i -u kdb-aws bash $BASEDIR/install-miniconda.sh
sudo -i -u kdb-aws bash $BASEDIR/create-env-kdb-prod.sh /opt/kdb

mkdir -p /opt
chown kdb-prod:kdb /opt
sudo -i -u $BASEDIR/create-ami.sh kdb-prod 

echo -e "\nCompleted $0\n"
