function s:CoqCopyInfo()
    let l:info_bufname = b:coqtail_panel_bufs.info
    " info goal main
    let l:lines = '(*'.join(getbufline(l:info_bufname, 0 , '$'),'\n').'*)'
    let l:next = (line('.') + 1)
    call append(l:next, l:lines)
endfunction

function s:CoqMaps()
    " I would like to have a way to just check till the next, and also move my
    " cursor there..
  nmap <buffer> <leader>i <Cmd>call <SID>CoqCopyInfo()<CR>
  nmap <buffer> <leader>; <Plug>RocqToLine
  nmap <buffer> <leader>x <Plug>RocqInterrupt
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
