
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

# vim installs
ln -s ~/repos/dot-files/bashprofile ~/.bash_profile
ln -s ~/repos/dot-files/gitconfig ~/.gitconfig
ln -s ~/repos/dot-files/tmuxconfig ~/.tmux.conf

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -s ~/repos/dot-files/vimrc ~/.vimrc

# anaconda installs
wget https://repo.continuum.io/archive/Anaconda3-2018.12-Linux-x86_64.sh -O ~/conda.sh
bash ~/conda.sh -b -p ~/anaconda3
rm ~/conda.sh
export PATH=$PATH:~/anaconda3/bin
echo 'export PATH=$PATH:"~/anaconda3/bin"' >> ~/.bash_profile
source ~/.bash_profile

# kdb installs
conda install -c kx kdb
conda install -c kx embedpy
conda install -c kx jupyterq
yes | pip install qpython

# rlwrap install
sudo rpm -ivh ~/repos/dot-files/epel-release-latest-7.noarch.rpm
sudo yum install rlwrap -y

echo 'bootstrap.sh completed successfully'
