" Colorscheme
if has('gui_running')
	colorscheme solarized8_high
else
	colorscheme peachpuff
endif

syntax on

" Global kep mappings
"   Compilar output window and motion
	map <F1> :copen<C-m>
	map <S-F1> :cclose<C-m>
	map <F2> :cn<C-m>
	map <S-F2> :cp<C-m>
"   Location-List output window and motion
	map <F3> :Error<C-m>
	map <S-F3> :lclose<C-m>
	map <F4> :lnext<C-m>
	map <S-F4> :lprev<C-m>
map <F5> :Explore<C-m>
map <S-F5> :Sexplore<C-m>
map <F9> :BC<C-m>
map <F11> :bp<C-m>
map <F12> :bn<C-m>

	" Movement between tags
	map <C-n> :tn<C-m>
	map <C-p> :tp<C-m>

" RECOMMENDED STARTING SETTINGS FOR SYNTASTIC
set statusline=%<%f\ %h%m%r%=%-14.(%l/%L,%c%V%)\ %P     " Set initial "default" statusline
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

" Free the backspace key to be useful
set backspace=indent,eol,start

" Pretty whitespace listing characers
set listchars=tab:»·,trail:·,extends:¬

" Enable modelines
set modeline "reads settings from files when they are present
set modelines=100000

" Always show the statusline
set laststatus=2

" Highlight all matches in the file to last search pattern
set hls

" Line wrapping preferences
set sbr=«\      " Prefix for wrapped lines
set nowrap

" Selection behavior
behave xterm               " vs. mswin behavior
set selectmode=mouse       " auto-start with mouse drags only

" Printing options
set printoptions=syntax:no

" Allow edited files to be hidden
set hidden

" Setup shell to use a custom rcfile (primarily to set aliases and PS1 var)
set shell=/bin/bash\ --rcfile\ ~/.vimbashrc

" Auto-convert *.bin files for hex editing.
augroup Binary
	au!
	au BufReadPre  *.bin let &bin=1
	au BufReadPost *.bin if &bin | %!xxd
	au BufReadPost *.bin set ft=xxd | endif
	au BufWritePre *.bin if &bin | %!xxd -r
	au BufWritePre *.bin endif
	au BufWritePost *.bin if &bin | %!xxd
	au BufWritePost *.bin set nomod | endif
augroup END

