#!/bin/bash -x

export USER=jack
export HOME=/home/$USER
source $HOME/.bash_profile

# load utility functions
source $CONDA_PREFIX/core/util/ec2-utils.sh
echo "source $HOME/core/util/ec2-utils.sh" >> $HOME/.bash_profile

export INSTANCEID=`ec2_get_instance_id`
export APP=`ec2_get_instance_tag APP`
export STACK=`ec2_get_instance_tag aws:cloudformation:stack-name`

echo "" >> $HOME/.bash_profile
echo "export INSTANCEID=$INSTANCEID" >> $HOME/.bash_profile
echo "export APP=$APP" >> $HOME/.bash_profile
echo "export STACK=$STACK" >> $HOME/.bash_profile
