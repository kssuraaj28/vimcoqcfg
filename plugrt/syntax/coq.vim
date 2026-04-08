" Remove hints
syn region coqReset contains=coqIdent matchgroup=coqVernacCmd start="\<Remove Hints\>" matchgroup=coqVernacPunctuation end="\.\_s" keepend

" I have no idea whether this is correct..
syn region coqReset contains=coqIdent matchgroup=coqVernacCmd start="\<Reset\>" matchgroup=coqVernacPunctuation end="\.\_s" keepend

" QuickChick things. I would like to make this a function..
syn region coqQuickChick contains=coqIdent matchgroup=coqVernacCmd start="\<QuickChick\>" matchgroup=coqVernacPunctuation end="\.\_s" keepend
syn region coqQuickChick contains=coqIdent matchgroup=coqVernacCmd start="\<Sample\>" matchgroup=coqVernacPunctuation end="\.\_s" keepend
