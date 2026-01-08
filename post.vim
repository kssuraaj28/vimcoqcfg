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

function s:CoqMakeFile()
    "let l:target = fnamemodify(expand('%:t') , ':r'). '.vo'
    "let l:command = 'make '.l:target
    "echo system(l:command)
    " TODO: This does not work..
    echo system('rm *.vo')
    echo system('rocq makefile -f _CoqProject *.v -o Makefile')
    echo system('make')
    RocqStop
endfunction

function s:CoqRestore()
  only 
  RocqRestorePanels 
  execute 'vertical resize '. (&columns * 3 / 4)
endfunction

function s:CoqMaps()
    " I would like to have a way to just check till the next, and also move my
    " cursor there..
  nnoremap <buffer> <leader>i           <Cmd>call <SID>CoqCopyInfo()<CR>
  nnoremap <buffer> <leader>m           <Cmd>call <SID>CoqMakeFile()<CR>
  nnoremap <buffer> <leader>j           <Cmd>RocqNext<CR><Cmd>RocqJumpToEnd<CR>
  nnoremap <buffer> <leader>k           <Cmd>RocqUndo<CR><Cmd>RocqJumpToEnd<CR>
  nnoremap <buffer> <leader>h           <Cmd>RocqJumpToError<CR>
  nnoremap <buffer> <leader>;           <Cmd>RocqToLine<CR>
  nnoremap <buffer> <leader>x           <Cmd>RocqInterrupt<CR>
  nnoremap <buffer> <leader><space>     <Cmd>call <SID>CoqRestore()<CR>

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

"augroup CoqtailHighlight
"  autocmd!
"  autocmd ColorScheme *
"    \  hi def CoqtailChecked ctermbg=9
"    \| hi def CoqtailSent    ctermbg=11
"augroup END

"augroup coq_quickchick_syntax
"  autocmd!
"  autocmd FileType coq syntax keyword coqCommand QuickChick Derive Sample
"  autocmd FileType coq syntax keyword coqTactic forAll ==> suchThat
"augroup END

