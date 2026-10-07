Plug 'kssuraaj28/Coqtail'
Plug 'kssuraaj28/chill.nvim'
Plug 'kssuraaj28/mirror.nvim' " Mirror depends on chill. We do too
Plug 'andymass/vim-matchup'
Plug 'tpope/vim-endwise' 
Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"endwise triggers at end of file..

" Plug 'ludovicchabant/vim-gutentags'

Plug fnamemodify(resolve(expand('<sfile>:p')),':h').'/plugrt'
" When this is made the current directory, vim shits the bed. Why?

" neovim comes with treesitter support.
" nvim-treesitter makes it easy to install parsers
