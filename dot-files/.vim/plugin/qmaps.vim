" make an empty q function definition
inoremap <leader>qfn :{[]};<left><left><left>

" make an empty q lambda
inoremap <leader>qla {[]};<left><left><left>

" make an empty if statement
inoremap <leader>qif if[;];<left><left><left>

" make an empty if else statement
inoremap <leader>qie $[;;];<left><left><left><left>

" make an empty while loop
inoremap <leader>qwh while[;];<left><left><left>

" make empty log functions
inoremap <leader>qlgo .lg.o[`;""];<left><left><left><left><left>
inoremap <leader>qlgw .lg.w[`;""];<left><left><left><left><left>
inoremap <leader>qlge .lg.e[`;""];<left><left><left><left><left>

" make empty functional selects
inoremap <leader>qsl ?[;;;]<left><left><left><left>
inoremap <leader>qup ![;;;]<left><left><left><left>
