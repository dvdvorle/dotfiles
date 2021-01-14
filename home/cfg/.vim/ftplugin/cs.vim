set formatexpr=CS_fmt()
set formatoptions+=at
fun! CS_fmt()
    if v:char == '}'
        gg=G
    elseif
        return -1
    endif
endfun
