#!/bin/bash

conda activate base

# install packages
conda install -n kdb -c file:/$CORECHANNEL kdb --offline -y --override-channels
conda install -n kdb -c file:/$CORECHANNEL pandas --offline -y --override-channels
conda install -n kdb -c file:/$CORECHANNEL kdb-core --offline -y --override-channels
conda install -n kdb -c file:/$CORECHANNEL kdb-eventbus --offline -y --override-channels
conda install -n kdb -c file:/$CORECHANNEL kdb-rdb --offline -y --override-channels
conda install -n kdb -c file:/$CORECHANNEL pyyaml yaml --offline -y --override-channels
