#!/bin/bash

echo "Running $0"

# pull all git repos
$HOME/repos/environment-setup/util/git-pull-subdirs.sh /home/jack/repos

# activate conda
source $HOME/miniconda/etc/profile.d/conda.sh
conda activate base

# create kdb-dev
BASEDIR=$(dirname $0)
conda env create --file=$BASEDIR/kdb.yml --prefix /opt/

conda remove --name kdb-dev --all

AMI=kdb
AMIDATE=$(echo $(date +%DD%T) | sed 's/\//./g' | sed 's/:/./g')
AZ=$(ec2metadata --availability-zone)

AMINAME=${AZ::-1}-prod-ec2.ami-$AMI-$AMIDATE

INSTANCEID=$(ec2metadata --instance-id)

aws ec2 create-image --instance-id $INSTANCEID --name $AMINAME
