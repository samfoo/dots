" Description: a colour scheme inspired by flatui
" Maintainer:  sam@ifdown.net
" License:     gpl 3+
" Version:     0.1

set background=dark

if version > 580
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif

let colors_name = "samfoo"

hi Normal     guifg=#BDC3C7   guibg=#2C3E50   gui=none

hi Cursor     guifg=#2c3e50   guibg=#bdc3c7   gui=none
hi ErrorMsg   guifg=#ecf0f1   guibg=#e74c3c   gui=none
hi VertSplit  guifg=#d4e6f1   guibg=#2980b9   gui=none
hi IncSearch  guifg=#f6ddcc   guibg=#d35400   gui=italic,bold,underline
hi Search     guifg=#f6ddcc   guibg=#d35400   gui=bold
hi LineNr     guifg=#F1C40F   gui=none
hi NonText    guifg=#16A085   gui=none
hi Visual     guifg=#d4e6f1   guibg=#2980b9   gui=bold
hi WarningMsg guifg=#C0392B   gui=none

hi Comment    guifg=#2ECC71   gui=italic
hi Constant   guifg=#F39C12   gui=none
hi Identifier guifg=#3498DB   gui=none
hi Function   guifg=#E74C3C   gui=none
hi Statement  guifg=#9B59B6   gui=none
" hi PreProc      guifg=PaleVioletRed2 gui=none
" hi Type         guifg=tan1           gui=none
" hi Special      guifg=aquamarine2    gui=none
" hi Ignore       guifg=grey40         gui=none
" hi Todo         guifg=orangered      guibg=yellow2 gui=none
