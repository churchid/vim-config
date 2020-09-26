# vim-config
Vim plugin with my personal ViM preferences.

This is my vimrc, roughly:

    call plug#begin('~/vimfiles/plugins')

    Plug 'vim-syntastic/syntastic'
    Plug 'majutsushi/tagbar'
    Plug 'lifepillar/vim-solarized8'
    Plug 'vim-latex/vim-latex'
    " tabular is a prerequisite for plasticboy/vim-markdown
    Plug 'godlygeek/tabular'
    Plug 'plasticboy/vim-markdown'
    Plug 'churchid/vim-config'

    call plug#end()

    " These commands work around bugs running the Plug* commands under Windows.
    " See https://github.com/junegunn/vim-plug/issues/852#issuecomment-696431055 for details.
    " PlugUpdate
    command! MyPlugUpdate   :set shell=cmd.exe shellcmdflag=/c noshellslash guioptions-=! <bar> noau PlugUpdate
    " PlugInstall
    command! MyPlugInstall  :set shell=cmd.exe shellcmdflag=/c noshellslash guioptions-=! <bar> noau PlugInstall
    " PlugClean
    command! MyPlugClean    :set shell=cmd.exe shellcmdflag=/c noshellslash guioptions-=! <bar> noau PlugClean
