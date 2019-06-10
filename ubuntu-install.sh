#!/bin/bash

sudo apt update -y
sudo apt upgrade -y

sudo apt install git

mkdir ~/repos
# download dot file settings
git clone https://jackstapleton:$PASS@github.com/jackstapleton/dot-files.git ~/repos/dot-files

# download code repositories
git clone https://jackstapleton:$PASS@github.com/jackstapleton/advanced-kdb-cmtp.git ~/repos/advanced-kdb-cmtp.git
git clone https://jackstapleton:$PASS@github.com/jackstapleton/advanced-kdb-cmtp.git ~/repos/ff-webscraper.git
