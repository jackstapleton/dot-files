#!/bin/bash

IP=$1

rsync -av $HOME/build/ jack@$IP:/home/jack/
rsync -av --exclude "*authorised_keys*" --exclude "*known_hosts*" $HOME/.ssh/* jack@$IP:/home/jack/.ssh/
rsync -av $HOME/repos/environments-setup/bootstraps/git-clone.sh jack@$IP:/home/jack/
