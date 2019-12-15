#!/bin/bash


REPODIR=$HOME/repos1
mkdir -p $REPODIR

GIT=git@github.com:jackstapleton


for repo in notes kdb-core kdb-eventbus kdb-rdb kdb-pubsub kdb-schema kdb-hdb kdb-gateway ff-app vim-qkdb-syntax-gruvbox
do
    echo "cloning $repo"
    git clone $GIT/$repo.git $REPODIR/$repo
done

echo 'installed repos'
