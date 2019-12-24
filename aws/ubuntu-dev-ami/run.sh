#!/bin/bash

IP=$1
BASEDIR=$(dirname $0)

rsync -av $HOME/build/conda-channel ubuntu@$IP:/home/ubuntu/

rsync -av $BASEDIR/install-scripts ubuntu@$IP:/home/ubuntu/
ssh ubuntu@$IP "chmod 777 /home/ubuntu/install-scripts/*"

USER=jack

ssh ubuntu@$IP "sudo /home/ubuntu/install-scripts/apt-installs.sh"
ssh ubuntu@$IP "sudo /home/ubuntu/install-scripts/setup-user.sh $USER"

ssh $USER@$IP "/home/ubuntu/install-scripts/install-miniconda.sh"

ssh ubuntu@$IP "sudo /home/ubuntu/install-scripts/install-ripgrep.sh"

rsync -av --exclude "*authorised_keys*" $HOME/.ssh/* $USER@$IP:/home/$USER/.ssh/
ssh $USER@$IP "/home/ubuntu/install-scripts/git-clone.sh"

ssh $USER@$IP "/home/ubuntu/install-scripts/create-env-kdb-dev.sh"

ssh $USER@$IP "/home/ubuntu/install-scripts/create-ami.sh"
