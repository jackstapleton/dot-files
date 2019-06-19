" change highlighting
function! MyHighlights() abort
	highlight IncSearch cterm=reverse ctermfg=109 ctermbg=237 guifg=#83a598 guibg=#3c3836
	highlight Search cterm=underline ctermfg=109 ctermbg=237 guifg=#83a598 guibg=#3c3836
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
