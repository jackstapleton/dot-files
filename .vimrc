set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'jackstapleton/vim-qkdb-syntax-gruvbox'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" colour schemes
set background=dark
colorscheme gruvbox
set t_Co=256

set tabstop=4
set shiftwidth=4
set smartindent
set pastetoggle=<F3>

set showmatch " matching brackets

set incsearch " higlight search as you type 
