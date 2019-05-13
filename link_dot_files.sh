#!/bin/bash

config_dir=$1
home_dir=~/
config_files=`ls *.symlink`

for src in $config_files; do
	link=`echo ${src::-8}`
	echo "ln -s $config_dir$src ~/.$link" | bash
done
