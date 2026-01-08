
" I have no idea whether this is correct..
" Reset
syn region coqReset contains=coqIdent matchgroup=coqVernacCmd start="\<Reset\>" matchgroup=coqVernacPunctuation end="\.\_s" keepend

syn region coqReset contains=coqIdent matchgroup=coqVernacCmd start="\<QuickChick\>" matchgroup=coqVernacPunctuation end="\.\_s" keepend
