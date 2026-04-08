Plug 'whonore/Coqtail'
Plug 'andymass/vim-matchup'
Plug 'tpope/vim-endwise' 
"endwise triggers at end of file..

Plug 'ludovicchabant/vim-gutentags'

Plug fnamemodify(resolve(expand('<sfile>:p')),':h').'/plugrt'
" When this is made the current directory, vim shits the bed. Why?

" neovim comes with treesitter support.
" nvim-treesitter makes it easy to install parsers
