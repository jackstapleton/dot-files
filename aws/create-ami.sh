#!/bin/bash -x

echo "Running $0"

yum update -y

# set up $USER user
export USER=jack
useradd $USER
export HOME=/home/$USER
mkdir -p $HOME
usermod -d $HOME $USER
chown -R $USER:$USER $HOME

# set up ssh
mkdir -p $HOME/.ssh
cp -r /home/ec2-user/.ssh $HOME
chown -R $USER:$USER $HOME/.ssh

# set up s3 access
# TODO get REGION TAG
mkdir -p $HOME/.aws
echo -e '[default]\nregion=eu-west-1\noutput=json' > $HOME/.aws/config
chown -R $USER:$USER $HOME/.aws

# pull down packages from S3
# sudo -i -u $USER aws s3 cp --recursive s3://jack.stapleton.kdb.deployments/ $HOME

# install miniconda
mkdir -p /opt/$USER/kdb
tar -xzf /home/ec2-user/aws-installs/kdb_env.tar.gz -C /opt/$USER/kdb
chown -R $USER:$USER /opt/$USER
# bash $HOME/aws-installs/Miniconda3-latest-Linux-x86_64.sh -b -p /opt/$USER/miniconda

# activate conda in the bash profile
echo "" >> $HOME/.bash_profile
echo "source /opt/$USER/kdb/bin/activate" >> $HOME/.bash_profile

AMIDATE=`date +%D`
AMINAME=`ec2_get_instance_region`-dev-ec2.ami-$AMIDATE

source /opt/$USER/kdb/bin/activate
source $CONDA_PREFIX/core/util/ec2-utils.sh

INSTANCEID=`ec2_get_instance_id`
sudo -i -u $USER aws ec2 create-image --instance-id $INSTANCEID --name $AMINAME
