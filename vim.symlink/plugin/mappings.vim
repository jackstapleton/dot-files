" leader mappings
"
let mapleader = " "

" toggle git gutter
nnoremap <leader>g :GitGutterToggle<cr>

" buffers
nnoremap <leader><leader> <c-^>             " Open last buffer.
nnoremap <leader>o :only<cr>
nnoremap <leader>d :echo expand('%')<cr>    " Show the path of the current file
nnoremap <leader>q :quit<cr>
nnoremap <leader>w :write<cr>
nnoremap <leader>e :xit<cr>

" goyo mapping
nnoremap <leader>g :Goyo<cr>

" new line stay in normal mode
nnoremap <cr> o<esc>
nnoremap <s-cr> <s-o><esc>

" toggle line numbers
nnoremap <leader>4 :set invnumber<cr>
" toggle paste 
nnoremap <leader>3 :set pastetoggle<cr>i

" search and replace
nnoremap <leader>s :%s/\<<c-r><c-w>\>/<c-r><c-w>/g<left><left>

" save and run current file 
nnoremap <leader>p :w<cr>:!python %<cr>
nnoremap <leader>q :w<cr>:!q %<cr>

" split settings/mappings
nnoremap <leader>r :vsp<cr>
nnoremap <leader>d :sp<cr>
nnoremap <leader>h <C-W><C-H>   " move left
nnoremap <leader>j <C-W><C-J>   " move down
nnoremap <leader>k <C-W><C-K>   " move up
nnoremap <leader>l <C-W><C-L>   " move right

" edit/src vimrc
nnoremap <leader>q :e ~/.vimrc<cr>
nnoremap <leader>w :source ~/.vimrc<cr>
nnoremap <leader>e :PluginInstall<cr>
