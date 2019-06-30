" command mappings
command WQ wq
command Wq wq
command W w
command Q q

inoremap <c-e> <esc>
nnoremap ; :
let mapleader = " "

" ack
noremap <leader>a <esc>:w<cr>:Ack!<space>
noremap <leader>aw <esc>:w<cr>:Ack!<space><c-r><c-w><cr>
" ale mappings
nmap <silent> <leader>an <Plug>(ale_next_wrap)
nmap <silent> <leader>ap <Plug>(ale_previous_wrap)
" auto insertions
nnoremap <cr> o<esc>
nnoremap <s-cr> <s-o><esc>
nnoremap <s-E> $a
nnoremap <leader>dbg o'dbg;<esc>
nnoremap <leader>; $a;<esc>
nnoremap <leader>bb ggi#!/bin/bash -x<cr><esc>
" buffers
nnoremap <leader>o :only<cr>
nnoremap <leader>gy :Goyo<cr>
" margins
nnoremap <leader>gg :GitGutterToggle<cr>
nnoremap <leader>no :set nonumber norelativenumber<cr>
nnoremap <leader>nu :set number norelativenumber<cr>
nnoremap <leader>nr :set number relativenumber<cr>
" netrw
nnoremap <leader>t :Vexplore<cr>
" save and run current file
nnoremap <leader>bs :w<cr>:!bash %<cr>
nnoremap <leader>p :w<cr>:!python %<cr>
nnoremap <leader>q :w<cr>:!q %<cr>
" search and replace
nnoremap <leader>s :%s/\<<c-r><c-w>\>/<c-r><c-w>/g<left><left>
nnoremap <leader>r :.s///<left><left>
" splits
nnoremap <leader>\| :vsp<cr>
nnoremap <leader>\ :vsp<cr>
nnoremap <leader>- :sp<cr>
nnoremap <c-h> <c-w><c-h>
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>
" vimrc files
nnoremap <leader>vrc :e ~/.vimrc<cr>
nnoremap <leader>map :e ~/.vim/plugin/mappings.vim<cr>
nnoremap <leader>set :e ~/.vim/plugin/settings.vim<cr>
" zap whitespace
nnoremap <leader>zz :%s/\s\+$//g<cr>
nnoremap <leader>zt :%s/\t/    /g<cr>
