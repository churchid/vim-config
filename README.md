# vim-config
Vundle plugin with my personal ViM preferences.

This is my .vimrc, roughly:

    " BEGIN VUNDLE-REQUIRED SECTION
    set nocompatible              " be iMproved, required
    filetype off                  " required

    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
    " alternatively, pass a path where Vundle should install plugins
    "call vundle#begin('~/some/path/here')

    " let Vundle manage Vundle, required
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'vim-syntastic/syntastic'
    Plugin 'majutsushi/tagbar'
    Plugin 'lifepillar/vim-solarized8'
    Plugin 'vim-latex/vim-latex'
    " tabular is a prerequisite for plasticboy/vim-markdown
    Plugin 'godlygeek/tabular'
    Plugin 'plasticboy/vim-markdown'
    Plugin 'churchid/vim-config'

    " All of your Plugins must be added before the following line
    call vundle#end()            " required
    filetype plugin indent on    " required
    " To ignore plugin indent changes, instead use:
    "filetype plugin on
    "
    " Brief help
    " :PluginList       - lists configured plugins
    " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
    " :PluginSearch foo - searches for foo; append `!` to refresh local cache
    " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
    "
    " see :h vundle for more details or wiki for FAQ
    " Put your non-Plugin stuff after this line
    " END VUNDLE-REQUIRED SECTION

    source ~/.vim/vimrc
