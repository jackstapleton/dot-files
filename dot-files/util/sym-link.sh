#!/bin/bash -x

echo "Running $0"

BASEDIR=$(dirname $0)

DOTFILESDIR=$BASEDIR/..

DOTFILES="ackrc bash_aliases bash_envvars bash_profile gitconfig tmux.conf"

for dotfile in $DOTFILES;
do
    path=$DOTFILESDIR/$dotfile
    if [[ $path != "/"* ]]; then
        path=$(pwd)/$path
    fi
    ln -s $path $HOME/.$dotfile
done

echo "$0 Complete"
