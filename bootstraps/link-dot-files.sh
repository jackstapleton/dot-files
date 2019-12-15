#!/bin/bash

BASEDIR=$(dirname $0)
DOTFILESDIR=$BASEDIR/../dot-files
DOTFILES=$(ls -a $DOTFILESDIR)

for dotfile in $DOTFILES; do
    if [[ $dotfile == "." ]]; then
        continue
    elif [[ $dotfile == ".." ]]; then
        continue
    else
        echo "ln -s $(pwd)/$DOTFILESDIR/$dotfile $HOME/$dotfile"
    fi
done
