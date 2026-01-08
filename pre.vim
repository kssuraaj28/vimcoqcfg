let g:coqtail_nomap = 1
let g:coqtail_noindent_comment = 1
let g:coqtail_noindent = 1
let g:coqtail_panel_layout = {'info': [['goal', 'above'], ['main', 'left']], 'goal': [['info', 'below'], ['main', 'left']]}

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
