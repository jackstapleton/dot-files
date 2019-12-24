#!/bin/bash

echo "Running $0"

BASEDIR=$(dirname $0)

DOTFILESDIR=$BASEDIR/..

DOTFILES="ackrc bash_aliases bash_envvars bash_profile gitconfig tmux.conf"

for dotfile in $DOTFILES;
do
    ln -s $(pwd)/$DOTFILESDIR/$dotfile $HOME/.$dotfile
done

echo "$0 Complete"
