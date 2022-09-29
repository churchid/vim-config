# vim-config
Vim plugin with my personal ViM preferences.

For a new installation, begin by installing [`vim-plug`](https://github.com/junegunn/vim-plug).

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
    command! MyPlugUpdate   :set shell=cmd.exe shellcmdflag=/c noshellslash <bar> noau PlugUpdate
    " PlugInstall
    command! MyPlugInstall  :set shell=cmd.exe shellcmdflag=/c noshellslash <bar> noau PlugInstall
    " PlugClean
    command! MyPlugClean    :set shell=cmd.exe shellcmdflag=/c noshellslash <bar> noau PlugClean

    " Because some plugins above insist on screwing up the shell variables under Windows to be Linux defaults,
    " set up these versions to pass through the correct thing...might consider just resetting these variables
    " after the plugins are done loading so the real commands can be used directly.
    command! MyPluginUpdate  :set shell=cmd.exe shellcmdflag=/c noshellslash <bar> noau PluginUpdate
    command! MyPluginInstall :set shell=cmd.exe shellcmdflag=/c noshellslash <bar> noau PluginInstall
    command! MyPluginSearch  :set shell=cmd.exe shellcmdflag=/c noshellslash <bar> noau PluginSearch
    command! MyPluginClean   :set shell=cmd.exe shellcmdflag=/c noshellslash <bar> noau PluginClean
