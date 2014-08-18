" VimCompletesMe.vim - For super simple tab completion
" Maintainer:          Akshay Hegde <http://github.com/ajh17>
" Version:             0.3
" Website:             <http://github.com/ajh17/VimCompletesMe>

" Vimscript Setup: {{{1
if exists("g:loaded_VimCompletesMe") || v:version < 703 || &compatible
    finish
endif
let g:loaded_VimCompletesMe = 1

" Functions: {{{1
function! s:vimCompletesMe(type)
    let shift_exists = a:type ==? "shift_tab"

    let pos = getpos('.')
    let substr = matchstr(strpart(getline(pos[1]), 0, pos[2]-1), "[^ \t]*$")
    if strlen(substr) == 0
        if shift_exists && !g:vcm_s_tab_behavior
            return "\<C-d>"
        else
            return "\<tab>"
        endif
    endif

    if shift_exists
        return "\<C-p>"
    else
        return "\<C-n>"
    endif
endfunction

" Maps: {{{1
inoremap <expr> <Tab> <SID>vimCompletesMe("")
inoremap <expr> <S-Tab> <SID>vimCompletesMe("shift_tab")
