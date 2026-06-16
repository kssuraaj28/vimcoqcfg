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

"set statusline+=%{gutentags#statusline()}
"
execute 'luafile' fnamemodify(resolve(expand('<sfile>:p')),':h') . '/coqpin.lua'
