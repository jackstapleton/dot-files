#!/bin/bash

echo "Running $0"

BASEDIR=$(dirname $0)

$BASEDIR/vim-install.sh
$BASEDIR/sym-link.sh

echo "$0 Complete"
