#!/bin/bash

echo "Running $0"

# set up $USER user
export USER=$1
export GROUP=$2

groupadd $GROUP
useradd -s /bin/bash -d /home/$USER/ -g $GROUP -m -G sudo $USER
export HOME=/home/$USER

# add to kdb group
usermod -a -G $GROUP $USER

# set up ssh
mkdir -p $HOME/.ssh
cp -r /home/ubuntu/.ssh $HOME

# set up aws cli config
mkdir -p $HOME/.aws
echo -e '[default]\nregion=eu-west-1\noutput=json' > $HOME/.aws/config

# change home dir ownership
chown -R $USER:$GROUP $HOME

echo "$0 complete"
