" TODO: The things which I would like to have in coq - Nice infix operators

function! s:bind_input(key, result)
    let l:prefix = '\'
    let str = "<buffer> " . l:prefix . substitute(a:key, "|", "<bar>", "g") . " " . a:result

    exec "silent inoremap" . str
    exec "silent cnoremap" . str
endfunction

function! s:bind_inputs()
    call s:bind_input("cmt", "(* *)")  " I would like to have this be a snippet. Or add a textobject
    call s:bind_input("[[", "⟦")
    call s:bind_input("]]", "⟧")
    call s:bind_input("top", "⊤")
    call s:bind_input("bot", "⊥")
endfunction

function s:CoqMaps()
  nmap <buffer> <leader>; <Plug>RocqToLine
  nmap <buffer> <leader>i <Plug>RocqInterrupt
  nmap <buffer> <leader>k <Plug>RocqJumpToEnd 
  nmap <buffer> <leader>j <Plug>RocqJumpToError
  call s:bind_inputs()
endfunction

" I don't like this too much. Ideally, I'd like to do this based on filetype.
" Maybe an ftplugin
au BufRead,BufNewFile *.v call s:CoqMaps()
