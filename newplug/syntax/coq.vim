
" I have no idea whether this is correct..
syn region coqReset contains=coqIdent matchgroup=coqVernacCmd start="\<Reset\>" matchgroup=coqVernacPunctuation end="\.\_s" keepend

syn region coqQuickChick contains=coqIdent matchgroup=coqVernacCmd start="\<QuickChick\>" matchgroup=coqVernacPunctuation end="\.\_s" keepend
