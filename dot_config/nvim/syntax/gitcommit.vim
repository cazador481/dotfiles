set ft=markdown
syn match gitcommitComment "^;.*"  
" syn match gitcommitFirstLine  "\%^[^#].*"  nextgroup=gitcommitBlank skipnl
" syn match gitcommitSummary    "^.\{0,50\}" contained containedin=gitcommitFirstLine nextgroup=gitcommitOverflow contains=@Spell 
" syn match gitcommitOverflow   ".*" contained contains=@Spell
" syn match gitcommitBlank      "^[^#].*" contained contains=@Spell
