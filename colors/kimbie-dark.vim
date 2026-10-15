" Vim color file
" Name:       kimbie-dark.vim
" Maintainer: Inspired by Jan T. Sott's Kimbie Dark
" For:        GVim (GUI mode only)

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "kimbie-dark"

" Main Editor Colors
hi Normal          guifg=#d3af86 guibg=#221a0f gui=NONE
hi Cursor          guifg=#221a0f guibg=#d3af86 gui=NONE
hi LineNr          guifg=#5e452b guibg=#221a0f gui=NONE
hi CursorLine      guifg=NONE    guibg=#362712 gui=NONE
hi CursorLineNr    guifg=#a57a4c guibg=#362712 gui=NONE
hi Selection       guifg=NONE    guibg=#5e452b gui=NONE
hi Visual          guifg=NONE    guibg=#5e452b gui=NONE

" UI Windows & Menus
hi StatusLine      guifg=#d3af86 guibg=#423523 gui=bold
hi StatusLineNC    guifg=#a57a4c guibg=#362712 gui=NONE
hi VertSplit       guifg=#362712 guibg=#362712 gui=NONE
hi Pmenu           guifg=#d3af86 guibg=#423523 gui=NONE
hi PmenuSel        guifg=#221a0f guibg=#a57a4c gui=NONE

" Syntax Highlighting
hi Comment         guifg=#a57a4c guibg=NONE    gui=italic
hi Keyword         guifg=#98676a guibg=NONE    gui=bold
hi Statement       guifg=#98676a guibg=NONE    gui=NONE
hi Conditional     guifg=#98676a guibg=NONE    gui=NONE
hi Repeat          guifg=#98676a guibg=NONE    gui=NONE

hi Identifier      guifg=#dc3958 guibg=NONE    gui=NONE
hi Function        guifg=#8ab1b0 guibg=NONE    gui=NONE
hi Type            guifg=#f06431 guibg=NONE    gui=NONE
hi Structure       guifg=#f06431 guibg=NONE    gui=NONE

hi String          guifg=#889b4a guibg=NONE    gui=NONE
hi Constant        guifg=#f79a32 guibg=NONE    gui=NONE
hi Number          guifg=#f79a32 guibg=NONE    gui=NONE
hi Boolean         guifg=#f79a32 guibg=NONE    gui=NONE
hi Special         guifg=#088649 guibg=NONE    gui=NONE

hi Todo            guifg=#221a0f guibg=#f79a32 gui=bold
hi Error           guifg=#dc3958 guibg=NONE    gui=undercurl
