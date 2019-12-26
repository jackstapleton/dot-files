#!/bin/bash

IP=$1
BASEDIR=$(dirname $0)


rsync -av $BASEDIR/install-scripts ubuntu@$IP:/home/ubuntu/
ssh ubuntu@$IP "chmod 777 /home/ubuntu/install-scripts/*"

rsync -av --exclude "*authorised_keys*" $HOME/.ssh/* ubuntu@$IP:/home/ubuntu/.ssh/

ssh ubuntu@$IP "sudo /home/ubuntu/install-scripts/apt-installs.sh"

ssh ubuntu@$IP "sudo /home/ubuntu/install-scripts/setup-user.sh jack kdb"
ssh ubuntu@$IP "sudo /home/ubuntu/install-scripts/setup-user.sh kdb-app kdb"

ssh jack@$IP "/home/ubuntu/install-scripts/install-miniconda.sh"

ssh ubuntu@$IP "sudo /home/ubuntu/install-scripts/install-ripgrep.sh"

ssh jack@$IP "/home/ubuntu/install-scripts/setup-repos-dir.sh"

ssh jack@$IP "/home/jack/repos/environments-setup/dot-files/util/init.sh"
ssh kdb-app@$IP "/home/jack/repos/environments-setup/dot-files/util/init.sh"

rsync -av $HOME/conda-channel jack@$IP:/home/jack/

ssh jack@$IP "/home/ubuntu/install-scripts/create-env-kdb-dev.sh"

ssh ubuntu@$IP "sudo chown jack:kdb /opt"
ssh jack@$IP "/home/ubuntu/install-scripts/create-env-kdb.sh"

ssh jack@$IP "/home/ubuntu/install-scripts/create-ami.sh kdb-dev"
