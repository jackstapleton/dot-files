#!/bin/bash -x

mkdir /opt/kdb
chown -R kdb:kdb /opt/kdb
bash $HOME/aws-installs/Miniconda3-latest-Linux-x86_64.sh -b -p /opt/kdb/miniconda

echo 'source /opt/kdb/miniconda/etc/profile.d/conda.sh' >> $HOME/.bash_profile
echo 'conda activate base' >> $HOME/.bash_profile

chmod -R kdb:kdb /opt/kdb/miniconda
