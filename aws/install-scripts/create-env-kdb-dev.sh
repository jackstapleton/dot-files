#!/bin/bash

echo "Running $0"

# activate conda
source $HOME/miniconda/etc/profile.d/conda.sh
conda activate base

# create kdb-dev
BASEDIR=$(dirname $0)
conda env create --file=$BASEDIR/kdb-dev.yml
conda activate kdb-dev

echo "" >> $HOME/.bash_profile
echo "source $HOME/miniconda/etc/profile.d/conda.sh" >> $HOME/.bash_profile
echo "conda activate kdb-dev" >> $HOME/.bash_profile

# link repos into conda env
SRC=$CONDA_PREFIX/q/src
mkdir -p $SRC

for dir in init core
do
    echo "linking $dir"
    ln -s $HOME/repos/kdb-core/q/src/$dir $SRC
done


for module in pubsub
do
    echo "linking $module"
    ln -s $HOME/repos/kdb-$module/q $SRC/$module
done


echo 'linking main'
ln -s $HOME/repos/kdb-core/q/main $CONDA_PREFIX/q

echo 'linking bin'
ln -s $HOME/repos/kdb-core/bin/* $CONDA_PREFIX/bin

echo 'linking util'
ln -s $HOME/repos/kdb-core/util $CONDA_PREFIX

echo 'linking python/aws'
ln -s $HOME/repos/kdb-core/python/aws $CONDA_PREFIX/lib/python3.7


echo "linking core"
mkdir -p $CONDA_PREFIX/core
ln -s $HOME/repos/kdb-core/config $CONDA_PREFIX/core/config
ln -s $HOME/repos/kdb-core/processes $CONDA_PREFIX/core/processes


for app in eventbus rdb
do
    echo "linking $app"
    ln -s $HOME/repos/kdb-$app $CONDA_PREFIX/$app
done

echo "$0 Complete"
