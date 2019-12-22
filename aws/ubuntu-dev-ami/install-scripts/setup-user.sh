#!/bin/bash -x

echo "Running $0"

# set up $USER user
export USER=$1
useradd -s /bin/bash -d /home/$USER/ -m -G sudo $USER
export HOME=/home/$USER

# set up ssh
mkdir -p $HOME/.ssh
cp -r /home/ubuntu/.ssh $HOME

# set up aws cli config
mkdir -p $HOME/.aws
echo -e '[default]\nregion=eu-west-1\noutput=json' > $HOME/.aws/config

# change home dir ownership
chown -R $USER:$USER $HOME
