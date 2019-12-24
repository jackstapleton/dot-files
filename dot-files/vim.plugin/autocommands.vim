
augroup MyGroup
    autocmd!

    autocmd BufEnter,BufNew * call MyEnterBuffer()
    autocmd BufLeave,WinLeave * call MyLeaveBuffer()

    " autocmd FocusGained * :highlight Normal ctermfg=223 ctermbg=234 guifg=#ebdbb2 guibg=#282828
    " autocmd FocusLost * :highlight Normal ctermfg=223 ctermbg=230 guifg=#ebdbb2 guibg=#282828
augroup end


function MyEnterBuffer()
    setlocal cursorline relativenumber number
endfunction

function MyLeaveBuffer()
    setlocal nocursorline nonumber norelativenumber
endfunction
