#!/bin/bash

sudo apt update -y
sudo apt upgrade -y

sudo apt install git -y

DIR=`dirname $0`
DIR/vim-vundle.sh

