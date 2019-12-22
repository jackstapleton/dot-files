#!/bin/bash

echo "Running $0"

BASEDIR=$(dirname $0)
source $HOME/miniconda/etc/profile.d/conda.sh
conda activate base

conda env create --file=$BASEDIR/dev-kdb.yml

conda activate kdb-dev

for dir in init core main
do
    echo "linking $dir"
    ln -s $HOME/repos/kdb-core/$dir $CONDA_PREFIX/q/$dir
done

for module in pubsub
do
    echo "linking $module"
    ln -s $HOME/repos/kdb-$module $CONDA_PREFIX/q/$module
done

echo "linking core"
mkdir $CONDA_PREFIX/core
ln -s $HOME/repos/kdb-core/config $CONDA_PREFIX/core/config
ln -s $HOME/repos/kdb-core/processes $CONDA_PREFIX/core/processes

for app in eventbus rdb
do
    echo "linking $app"
    ln -s $HOME/repos/kdb-$app $CONDA_PREFIX/$app
done

