" Folds.
" set foldmethod to see what foldmethod is used. Usually manual
"
" Fold operation
" - `za` — **toggle** the fold under the cursor (the one to remember) (a  for alternate)
" - `zo` / `zc` — open / close one fold. l also
" - `zR` / `zM` — open **all** folds / close **all** folds (Reduce / More folding)
" - `zr` / `zm` — open/close one *level* everywhere (incremental)
" - `zO` / `zC` — open/close fold recursively (all nested folds under cursor)

" Manual Fold creation 
" - `zf` — To create a fold manually (only in manual / marker foldmethod )
" - `zd` zE — To delete
"
" Fold navigation
" - [z
" - ]z
" - zj
" - zk
"
" :mkview saves view fold file in viewdir. You can :loadview 
"
" Options
" - `foldlevelstart=99` — start with everything **open** when opening a file (common preference)
" - `foldnestmax=N` — cap nesting depth
" - `foldcolumn=4` — show a clickable gutter on the left indicating folds
" - `foldtext` — customize the text shown on a closed fold line
"
"   Indent is a good foldmethod
"

function! CoqProofFold(lnum)
  let l = getline(a:lnum)
  " One-liner (Proof. ... Qed. on a single line): don't fold
  if l =~ '^\s*\%(Proof\|Next Obligation\)\>.*\<\%(Qed\|Defined\|Admitted\|Abort\)\>'
    return '='
  elseif l =~ '^\s*\%(Proof\|Next Obligation\)\>'
    return '>1'
  elseif l =~ '^\s*\%(Qed\|Defined\|Admitted\|Abort\)\>'
    return '<1'
  endif
  return '='
endfunction

setlocal foldmethod=expr
setlocal foldexpr=CoqProofFold(v:lnum)
setlocal foldtext=getline(v:foldstart)
" - `>1` starts a level-1 fold *on the `Proof.` line*, so when closed you still see `Proof.`.
" - `<1` ends the fold *on the `Qed.` line* (that line is the last one included).
" - `foldtext=getline(v:foldstart)` shows the `Proof.` line as the fold label.
