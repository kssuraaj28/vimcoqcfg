function s:CoqMaps()
    " I would like to have a way to just check till the next, and also move my
    " cursor there..
  nmap <buffer> <leader>; <Plug>RocqToLine
  nmap <buffer> <leader>i <Plug>RocqInterrupt
  nmap <buffer> <leader>k <Plug>RocqJumpToEnd 
  nmap <buffer> <leader>j <Plug>RocqJumpToError
endfunction

" I don't like this too much. Ideally, I'd like to do this based on filetype.
" Maybe an ftplugin
au BufRead,BufNewFile *.v call s:CoqMaps()

" TODO: Make sure that I put coc as a dependency..
" lsp is useless. It is better to do incremental type checking
" call coc#config('languageserver', {
" 	\ 'coq': {
" 	\   "command": "coq-lsp",
" 	\   "filetypes": ["coq"]
" 	\ }
" 	\})

let s:snippets_dir = fnamemodify(resolve(expand('<sfile>:p')),':h') . '/snippets/'
" TODO: Can I have multiple userSnippetsDirectory??
call coc#config('snippets.userSnippetsDirectory', s:snippets_dir  )
