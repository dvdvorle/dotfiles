"here is a more exotic version of my original Kwbd script
"delete the buffer; keep windows; create a scratch buffer if no buffers left
function s:MoveToCallingWindow()
    execute s:callingWindowNumber . 'wincmd w'
endfunction

function s:ReplaceCallingBufferForWindow()
    if(bufnr("%") == s:callingBufferNumber)
      let prevbufvar = bufnr("#")
      if(prevbufvar > 0 && buflisted(prevbufvar) && prevbufvar != s:callingBufferNumber)
        b #
      else
        bn
      endif
    endif
endfunction

function s:CountListedBuffers()
  let l:bufferCount = bufnr("$")
  let l:i = 1
  while(l:i <= l:bufferCount)
    if(l:i != s:callingBufferNumber)
      if(buflisted(l:i))
        let s:buflistedLeft += 1
      else
        if(bufexists(l:i) && !strlen(bufname(l:i)) && !s:bufFinalJump)
          let s:bufFinalJump = l:i
        endif
      endif
    endif

    let l:i += 1
  endwhile
endfunction

function s:Kwbd()
  let s:callingBufferNumber = bufnr("%")
  if(!buflisted(s:callingBufferNumber))
    bd!
    return
  endif

  let s:callingWindowNumber = winnr()
  windo call s:ReplaceCallingBufferForWindow()
  call s:MoveToCallingWindow()

  let s:buflistedLeft = 0
  let s:bufFinalJump = 0
  call s:CountListedBuffers()

  if(!s:buflistedLeft)
      if(s:bufFinalJump)
      windo if(buflisted(winbufnr(0))) | execute "b! " . s:bufFinalJump | endif
  else
      enew
      let l:newBuf = bufnr("%")
      windo if(buflisted(winbufnr(0))) | execute "b! " . l:newBuf | endif
    endif
    call s:MoveToCallingWindow()
  endif

  if(buflisted(s:callingBufferNumber) || s:callingBufferNumber == bufnr("%"))
      "really delete callingBufferNumber
    execute "bd! " . s:callingBufferNumber
  endif

  if(!s:buflistedLeft)
    set buflisted
    set bufhidden=delete
    set buftype=
    setlocal noswapfile
  endif
endfunction

command! Kwbd call s:Kwbd()
nnoremap <silent> <Plug>Kwbd :<C-u>Kwbd<CR>

