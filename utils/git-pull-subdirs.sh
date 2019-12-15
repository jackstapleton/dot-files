#!/bin/bash

CUR_DIR=$(pwd)

DIR=$1

# Let the person running the script know what's going on.
echo -e "\nPulling in latest changes for all repositories in $DIR\n"

# Find all git repositories and update it to the master latest revision
for i in $(find $DIR -maxdepth 2 -name ".git"); do
    echo "";
    echo "$i";

    # We have to go to the .git parent directory to call the pull command
    cd $i/..;

    # finally pull
    git pull

    # lets get back to the CUR_DIR
    cd $CUR_DIR
done

echo -e "\nComplete!"
