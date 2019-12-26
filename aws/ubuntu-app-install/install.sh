#!/bin/bash -x

$HOME/repos/environments-setup/utils/git-pull-subdirs.sh

$HOME/repos/environments-setup/aws/ubuntu-app-install/create-env-kdb.sh
