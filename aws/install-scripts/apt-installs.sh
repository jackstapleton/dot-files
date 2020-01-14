#!/bin/bash -x

echo "Running $0"

apt update -y
apt upgrade -y

apt install awscli -y
apt install gcc g++ make -y
apt install rustc cargo -y
apt install rlwrap silversearcher-ag ack -y
apt install tree -y
apt-get install libncurses5-dev libncursesw5-dev -y
