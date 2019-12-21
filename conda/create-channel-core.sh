#!/bin/bash

conda activate base

# create directory
mkdir -p $CORECHANNEL/linux-64
rm -rf $CORECHANNEL/linux-64/*

# base conda packages for kdb
wget https://anaconda.org/kx/kdb/3.6/download/linux-64/kdb-3.6-2019.08.20.tar.bz2 -P $CORECHANNEL/linux-64
wget https://repo.anaconda.com/pkgs/main/linux-64/setuptools-41.2.0-py37_0.tar.bz2 -P $CORECHANNEL/linux-64
wget https://repo.anaconda.com/pkgs/main/linux-64/python-3.7.4-h265db76_1.tar.bz2 -P $CORECHANNEL/linux-64
wget https://repo.anaconda.com/pkgs/main/linux-64/wheel-0.33.6-py37_0.tar.bz2 -P $CORECHANNEL/linux-64
wget https://repo.anaconda.com/pkgs/main/linux-64/sqlite-3.29.0-h7b6447c_0.tar.bz2 -P $CORECHANNEL/linux-64
wget https://repo.anaconda.com/pkgs/main/linux-64/pip-19.2.3-py37_0.tar.bz2 -P $CORECHANNEL/linux-64

wget https://anaconda.org/kx/embedpy/1.3.2/download/osx-64/embedpy-1.3.2-py37h1de35cc_0.tar.bz2 -P $CORECHANNEL/linux-64


# packages for conda
wget https://repo.anaconda.com/pkgs/main/linux-64/pandas-0.25.1-py37he6710b0_0.tar.bz2 -P $CORECHANNEL/linux-64
wget https://repo.anaconda.com/pkgs/main/linux-64/numpy-base-1.17.2-py37hde5b4d6_0.tar.bz2 -P $CORECHANNEL/linux-64
wget https://repo.anaconda.com/pkgs/main/linux-64/mkl_random-1.1.0-py37hd6b4f25_0.tar.bz2 -P $CORECHANNEL/linux-64
wget https://repo.anaconda.com/pkgs/main/linux-64/blas-1.0-mkl.tar.bz2 -P $CORECHANNEL/linux-64
wget https://repo.anaconda.com/pkgs/main/linux-64/mkl-service-2.3.0-py37he904b0f_0.tar.bz2 -P $CORECHANNEL/linux-64
wget https://repo.anaconda.com/pkgs/main/linux-64/python-dateutil-2.8.0-py37_0.tar.bz2 -P $CORECHANNEL/linux-64
wget https://repo.anaconda.com/pkgs/main/linux-64/mkl-2019.4-243.tar.bz2 -P $CORECHANNEL/linux-64
wget https://repo.anaconda.com/pkgs/main/linux-64/numpy-1.17.2-py37haad9e8e_0.tar.bz2 -P $CORECHANNEL/linux-64
wget https://repo.anaconda.com/pkgs/main/linux-64/mkl_fft-1.0.14-py37ha843d7b_0.tar.bz2 -P $CORECHANNEL/linux-64
wget https://repo.anaconda.com/pkgs/main/linux-64/libgfortran-ng-7.3.0-hdf63c60_0.tar.bz2 -P $CORECHANNEL/linux-64
wget https://repo.anaconda.com/pkgs/main/linux-64/intel-openmp-2019.4-243.tar.bz2 -P $CORECHANNEL/linux-64

# misc python
wget https://repo.anaconda.com/pkgs/main/linux-64/yaml-0.1.7-had09818_2.tar.bz2 -P $CORECHANNEL/linux-64
wget https://repo.anaconda.com/pkgs/main/linux-64/pyyaml-5.1.2-py37h7b6447c_0.tar.bz2 -P $CORECHANNEL/linux-64

# copy core package
cp $CONDA_HOME/conda-bld/linux-64/kdb-core* $CORECHANNEL/linux-64/

# copy app packages
cp $CONDA_HOME/conda-bld/linux-64/kdb-eventbus* $CORECHANNEL/linux-64/
cp $CONDA_HOME/conda-bld/linux-64/kdb-rdb* $CORECHANNEL/linux-64/

# index core channel
conda index $CORECHANNEL
