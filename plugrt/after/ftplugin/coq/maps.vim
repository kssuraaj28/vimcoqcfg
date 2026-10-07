" This file is sourced everytime you call set filetype=coq because it is in
" ftplugin/coq/... 
" coq_*.vim, coq.vim, coq/*.vim are all sourced

function s:CoqCopyInfo()
    let l:info_bufname = b:coqtail_panel_bufs.info
    " info goal main
    let l:lines = ['(*'] + getbufline(l:info_bufname, 0 , '$') + ['*)']

    call reverse(l:lines)
    let l:next = (line('.') )
    for l:line in l:lines 
        call append(l:next, l:line) "If you don't want to do any assign, you do this call
    endfor
endfunction

function s:CoqRestore()
  only 
  RocqRestorePanels 
  execute 'vertical resize '. (&columns * 3 / 4)
endfunction

nnoremap <buffer> <leader>i           <Cmd>call <SID>CoqCopyInfo()<CR>
nnoremap <buffer> <leader>j           <Cmd>RocqNext<CR><Cmd>RocqJumpToEnd<CR>
nnoremap <buffer> <leader>k           <Cmd>RocqUndo<CR><Cmd>RocqJumpToEnd<CR>
nnoremap <buffer> <leader>h           <Cmd>RocqJumpToError<CR>
nnoremap <buffer> <leader>;           <Cmd>RocqToLine<CR>
nnoremap <buffer> <leader>:           <Cmd>!dune build<CR><Cmd>RocqToTop<CR><Cmd>RocqToLine<CR>
nnoremap <buffer> <leader>x           <Cmd>RocqInterrupt<CR>
nnoremap <buffer> <leader><space>     <Cmd>call <SID>CoqRestore()<CR>
