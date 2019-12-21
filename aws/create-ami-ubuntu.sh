#!/bin/bash -x

echo "Running $0"

apt update -y
apt upgrade -y
apt install awscli -y

# set up $USER user
export USER=jack
useradd -s /bin/bash -d /home/$USER/ -m -G sudo jack
export HOME=/home/$USER

# set up ssh
mkdir -p $HOME/.ssh
cp -r /home/ubuntu/.ssh $HOME

# set up s3 access
# TODO get REGION TAG
mkdir -p $HOME/.aws
echo -e '[default]\nregion=eu-west-1\noutput=json' > $HOME/.aws/config

# change home dir ownership
chown -R $USER:$USER $HOME

# install miniconda
mkdir -p /opt/$USER
wget https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh -O ~/miniconda.sh
bash ~/miniconda.sh -b -p /opt/$USER/miniconda
rm ~/miniconda.sh

# activate conda in the bashrc
echo "" >> $HOME/.bashrc
echo "source /opt/jack/miniconda/etc/profile.d/conda.sh" >> $HOME/.bashrc
echo "conda activate base" >> $HOME/.bashrc

# source /opt/jack/miniconda/etc/profile.d/conda.sh
# conda activate base

# AMIDATE=`date +%D`
# AMINAME=`ec2_get_instance_region`-dev-ec2.ami-$AMIDATE

# INSTANCEID=`ec2_get_instance_id`
# sudo -i -u $USER aws ec2 create-image --instance-id $INSTANCEID --name $AMINAME
