" TODO: The things which I would like to have in coq - Nice infix operators

function s:CoqMaps()
  nmap <buffer> <leader>; <Plug>RocqToLine
  nmap <buffer> <leader>i <Plug>RocqInterrupt
  nmap <buffer> <leader>k <Plug>RocqJumpToEnd 
  nmap <buffer> <leader>j <Plug>RocqJumpToError
endfunction

" I don't like this too much. Ideally, I'd like to do this based on filetype.
" Maybe an ftplugin?
au BufRead,BufNewFile *.v call s:CoqMaps()
