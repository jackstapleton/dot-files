
#!/bin/bash
sudo yum update -y 
sudo yum install gcc -y 

# anaconda installs
wget https://repo.continuum.io/archive/Anaconda3-2018.12-Linux-x86_64.sh
bash Anaconda3-2018.12-Linux-x86_64.sh
rm Anaconda3-2018.12-Linux-x86_64.sh

# kdb installs
conda install -c kx kdb
conda install -c kx embedpy
conda install -c kx jupyterq
pip install qpython

# git install
sudo yum install git
git clone https://jackstapleton:Sq2h0hDA@github.com/jackstapleton/advanced-kdb-cmtp.git
git clone https://jackstapleton:Sq2h0hDA@github.com/jackstapleton/vim-qkdb-syntax-gruvbox.git
git clone https://jackstapleton:Sq2h0hDA@github.com/jackstapleton/dot-files.git

# vim installs
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -s dot-files/vimrc .vimrc
vim +PluginInstall +qall
