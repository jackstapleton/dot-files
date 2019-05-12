set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" general plugins
Plugin 'flazz/vim-colorschemes'
Plugin 'kien/ctrlp.vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'itchyny/lightline.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'jackstapleton/vim-qkdb-syntax-gruvbox'

" pyhton plugins
Plugin 'nvie/vim-flake8'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-syntastic/syntastic'
Bundle 'Valloric/YouCompleteMe'

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


" Nerdtree
map ; :Files<CR>
map <C-t> :NERDTreeToggle<CR>


" GitGutternnoremap <C-g> 
noremap <C-G> :GitGutterToggle<CR>
inoremap <C-G> <C-O>:GitGutterToggle<CR>
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


" Enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <C-f> za


" tab settings
set tabstop=4
set shiftwidth=4
set smartindent


" Python Settings
let python_highlight_all=1
syntax on

au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/ " bad whitespace


" line numbers
noremap <F4> :set invnumber<CR>
inoremap <F4> <C-O>:set invnumber<CR>
set number

" misc
set showmatch " matching brackets
set incsearch " higlight search as you type 
set pastetoggle=<F3>
