let g:coqtail_nomap = 1
let g:coqtail_noindent_comment = 1
let g:coqtail_noindent = 1
let g:coqtail_panel_layout = {'info': [['goal', 'above'], ['main', 'left']], 'goal': [['info', 'below'], ['main', 'left']]}

"let g:coqtail_tagfunc = 0
"let g:coqtail_nosyntax = 1 

"if &t_Co > 16
"  if &background ==# 'dark'
"    hi def CoqtailChecked ctermbg=red guibg=red
"    hi def CoqtailSent    ctermbg=red  guibg=red
"  else
"    hi def CoqtailChecked ctermbg=17 guibg=LightGreen
"    hi def CoqtailSent    ctermbg=60 guibg=LimeGreen
"  endif
"else
"  hi def CoqtailChecked ctermbg=4 guibg=LightGreen
"  hi def CoqtailSent    ctermbg=7 guibg=LimeGreen
"endif
"
"hi def link CoqtailError Error
"hi def link CoqtailOmitted coqProofAdmit




"vim.api.nvim_create_autocmd('User', { pattern = 'TSUpdate',
"callback = function()
"  require('nvim-treesitter.parsers').rocq = {
"    install_info = {
"      url = 'https://github.com/lamg/tree-sitter-rocq'
"    },
"  }
"end})
"
" Tags things
let s:stdlibtags = fnamemodify(resolve(expand('<sfile>:p')),':h').'/stdlib-tags'
let s:rocq_lib ='~/.opam/rocq9/lib/coq' 
"TODO: Make this a git submodule?
let s:rocq_ctag_opts = fnamemodify(resolve(expand('<sfile>:p')),':h').'coq.ctags'

let g:gutentags_ctags_options_file = s:rocq_ctag_opts
"let g:gutentags_trace = 0
"
let g:gutentags_ctags_exclude = ["_opam"]

" I feel like these pre files are being read multiple times. Why?

if ! filereadable(s:stdlibtags)
    let s:cmd = "find '". s:rocq_lib. "' -name '*.v' | ctags -L - -f '". s:stdlibtags ."' --options='". s:rocq_ctag_opts ."'"
    call system(s:cmd)
endif

execute 'set tags+='.s:stdlibtags
" Use ctrl-] to go to definition

let s:cache_dir = fnamemodify(resolve(expand('<sfile>:p')),':h').'/gutentags-cache'
let g:gutentags_cache_dir = s:cache_dir

let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0
