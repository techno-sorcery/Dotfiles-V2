" Constants
hi Constant ctermfg=171 guifg=#d75fff
hi String ctermfg=215 guifg=#ffaf5f

" Statement
hi Statement ctermfg=205 guifg=#ff5faf
hi Operator ctermfg=75 guifg=#5fafff

" Misc
hi PreProc ctermfg=205 guifg=#ff5faf
hi Identifier ctermfg=228 guifg=#ffffaf
hi Type ctermfg=75 guifg=#5fafff
hi Special ctermfg=153 guifg=#afd7ff
hi Title ctermfg=231 guifg=#ffffff
hi Comment ctermfg=71 guifg=#5faf5f

" LSP semantic highlighting
hi @lsp.type.variable guifg=#afd7ff
hi @lsp.type.parameter guifg=#afd7ff

" Interface
hi LineNr ctermfg=241 guifg=#626262
hi NonText ctermfg=241 guifg=#626262
hi MatchParen ctermbg=243 guibg=#767676
hi Visual ctermbg=241 guibg=#626262
hi Search ctermbg=190 guibg=#d7ff00
hi Pmenu ctermbg=236 guibg=#303030
hi MoreMsg ctermfg=65 guifg=#5f875f
hi Question ctermfg=65 guifg=#5f875f
hi SpecialKey ctermfg=81 guifg=#5fd7ff
hi Directory ctermfg=81 guifg=#5fd7ff

" Spellbad
hi clear SpellBad
hi SpellBad gui=undercurl
hi SpellBad ctermbg=1 guisp=#af0000

" Error checking
hi DiagnosticUnderlineError gui=undercurl
hi DiagnosticUnderlineWarn gui=undercurl
hi DiagnosticUnderlineInfo gui=undercurl
hi DiagnosticUnderlineHint gui=undercurl

" CursorLine
hi clear CursorLine
hi CursorLine ctermbg=236 guibg=#303030
hi clear CursorLineNR
hi CursorLineNR ctermbg=236 guibg=#303030

" Blankline Indent
hi IndentBlanklineChar ctermfg=241 guifg=#626262
hi IndentBlanklineSpaceChar ctermfg=241 guifg=#626262
