" change highlighting
function! MyHighlights() abort
"	highlight Normal ctermfg=223 ctermbg=234 guifg=#ebdbb2 guibg=#282828
	highlight DiffAdd term=bold cterm=bold ctermfg=142 ctermbg=234 gui=bold guifg=#b8bb26 guibg=#282828
	highlight DiffChange term=bold cterm=bold ctermfg=108 ctermbg=234 gui=bold guifg=#8ec07c guibg=#282828
	highlight DiffDelete term=bold cterm=bold ctermfg=167 ctermbg=234 gui=bold guifg=#fb4934 guibg=#282828
	highlight DiffText term=bold cterm=bold ctermfg=214 ctermbg=234 gui=bold guifg=#fabd2f guibg=#282828

	hi! link GruvboxRedBold GruvboxRed
	hi! link GruvboxGreenBold GruvboxGreen
	hi! link GruvboxYellowBold GruvboxYellow
	hi! link GruvboxBlueBold GruvboxBlue
	hi! link GruvboxPurpleBold GruvboxPurple
	hi! link GruvboxAquaBold GruvboxAqua
	hi! link GruvboxOrangeBold GruvboxOrange
endfunction

augroup MyColors
    autocmd!
    autocmd ColorScheme * call MyHighlights()
augroup END

" highlight bad whitespace
match Error /\s\+$/
