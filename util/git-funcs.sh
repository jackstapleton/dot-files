#!/bin/bash

gitpullall() {
    CUR_DIR=$(pwd)
    DIR=$1
    echo -e "\nPulling in latest changes for all repositories in $DIR\n"

    for i in $(find $DIR -maxdepth 2 -name ".git"); do
        echo "";
        echo "$i";
        cd $i/..;
        git pull
    done
    cd $CUR_DIR
    echo -e "\nComplete!"
}

gitstall() {
    CUR_DIR=$(pwd)
    DIR=$1
    echo -e "\nChecking git status of all repositories in $DIR\n"

    for i in $(find $DIR -maxdepth 2 -name ".git"); do
        cd $i/..;
        git st
        echo -e "\n$(dirname $i)\n\n";
        sleep 1
        cd $CUR_DIR
    done
    echo -e "\nComplete!"
}

gitpushbr() {
    if [ $# == 0 ]; then
        echo 'Error: must pass an argument'
        return
    elif [ $# == 1 ]; then
        branch=master
    elif [ $# == 2 ]; then
        branch=$2
    fi

    echo -e "\nPushing all unstaged changes on $branch\n"
    echo -e "\nStatus\n"
    git status

    echo -e "\nStaging\n"
    git add --all .
    git status

    echo -e "\nCommiting\n"
    git commit -m "$1"

    echo -e "\nPushing\n"
    git push origin $branch

    echo -e "\nComplete\n"
}
