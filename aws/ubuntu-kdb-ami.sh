#!/bin/bash


echo -e "\nRunning $0\n"


IP=$1
BASEDIR=$(dirname $0)

rsync -av $BASEDIR/install-scripts ubuntu@$IP:/home/ubuntu/
rsync -av $HOME/conda-channel ubuntu@$IP:/home/ubuntu/
rsync -av --exclude "*authorised_keys*" $HOME/.ssh/* ubuntu@$IP:/home/ubuntu/.ssh/

ssh ubuntu@$IP "sudo /home/ubuntu/install-scripts/build-ami-prod.sh"


echo -e "\nCompleted $0\n"
