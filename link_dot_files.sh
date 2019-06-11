#!/bin/bash

config_dir=~/repos/dot-files
config_files=`ls $config_dir`

for src in $config_files; do
	if [[ "$src" == *"symlink" ]]; then
		link=`echo ${src::-8}`
		echo "ln -s $config_dir/$src ~/.$link"
		ln -s $config_dir/$src ~/.$link
	fi
done
