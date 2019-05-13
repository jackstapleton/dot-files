
#!/bin/bash

PASS=$1
echo 'Running bootstrap.sh'

# yum installs
sudo yum update -y
sudo yum install gcc -y
sudo yum install tmux -y

# git install
sudo yum install git
git clone https://jackstapleton:$PASS@github.com/jackstapleton/advanced-kdb-cmtp.git ~/repos/advanced-kdb-cmtp.git
git clone https://jackstapleton:$PASS@github.com/jackstapleton/vim-qkdb-syntax-gruvbox.git ~/repos/im-qkdb-syntax-gruvbox.git
git clone https://jackstapleton:$PASS@github.com/jackstapleton/dot-files.git ~/repos/dot-files

# sym link dot files
~/repos/dot-files/link_dot_files.sh ~/repos/dot-files/

# install and run vundle
mkdir -p ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# anaconda installs
wget https://repo.continuum.io/archive/Anaconda3-2018.12-Linux-x86_64.sh -O ~/conda.sh
bash ~/conda.sh -b -p ~/anaconda3
rm ~/conda.sh
export PATH=$PATH:~/anaconda3/bin
echo 'export PATH=$PATH:"~/anaconda3/bin"' >> ~/.bash_profile
source ~/.bash_profile

# python packages
conda install -c anaconda cmake-binary
conda install -c anaconda gcc
conda install -c anaconda python3-dev

# kdb installs
conda install -c kx kdb
conda install -c kx embedpy
conda install -c kx jupyterq
yes | pip install qpython

# rlwrap install
sudo rpm -ivh ~/repos/dot-files/epel-release-latest-7.noarch.rpm
sudo yum install rlwrap -y

python3 ~/.vim/bundle/YouCompleteMe/install.py

echo 'bootstrap.sh completed successfully'
