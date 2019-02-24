set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'mileszs/ack.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'itchyny/lightline.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdtree'
Plugin 'jackstapleton/vim-qkdb-syntax-gruvbox'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" split settings/mappings
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>   " down
nnoremap <C-K> <C-W><C-K>   " up
nnoremap <C-L> <C-W><C-L>   " right
nnoremap <C-H> <C-W><C-H>   " left

" key mappings
map ; :Files<CR>
map <C-o> :NERDTreeToggle<CR>
nmap ]c <Plug>GitGutterNextHunk
nmap [c <Plug>GitGutterPrevHunk
nmap <Leader>hs <Plug>GitGutterStageHunk
nmap <Leader>hu <Plug>GitGutterUndoHunk

" colour schemes
set background=dark
colorscheme gruvbox
set t_Co=256

" lightline config
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ }

" tab settings
set tabstop=4
set shiftwidth=4
set smartindent
set pastetoggle=<F3>

set number

set showmatch " matching brackets

set incsearch " higlight search as you type 
