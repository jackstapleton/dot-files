#!/bin/bash
set -x

sudo apt install gcc g++ make -y
sudo apt install nodejs npm -y
sudo apt install rlwrap silversearcher-ag -y

sudo npm install -g @angular/cli@7.3.9
