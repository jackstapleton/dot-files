#!/bin/bash

echo "Running $0"

REPODIR=$HOME/repos
mkdir -p $REPODIR
touch $REPODIR/.ctrlp

GIT=git@github.com:jackstapleton

for repo in environments-setup kdb-core kdb-eventbus kdb-rdb kdb-gateway kdb-hdb kdb-pubsub kdb-query kdb-schema
do
    echo "cloning $repo"
    git clone $GIT/$repo.git $REPODIR/$repo
done

echo 'installed repos'
