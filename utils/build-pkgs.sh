#!/bin/bash -x

echo "Running $0"

base_dir=$(dirname $0)
build=$1
repos_dir=$2

source $HOME/miniconda/etc/profile.d/conda.sh
conda activate base

for package in kdb-core kdb-schema kdb-pubsub kdb-eventbus kdb-rdb
do
    repo=$repos_dir/$package

    cd $repo
    git pull

    version=$(python $base_dir/version.py --build-type $build --repo-dir $repo)
    echo "Incremented $package version to $version"

    git add info/recipe/meta.yaml
    git commit -m "update package version to - $version"
    git push origin master

    conda build info/recipe/

    mv $CONDA_PREFIX/conda-bld/linux-64/$package-$version-* $HOME/build/conda-channel/linux-64/
done

conda index $HOME/build/conda-channel
conda build purge

echo "$0 complete"
