" ↳ <c-v>u21b3
" Colorscheme
if has('gui_running')
	set background=light
	colorscheme kimbie-dark
	"colorscheme solarized8_high
	if(has('win32'))
		set gfn=Hack:h10:cANSI
	elseif(has('macunix'))
		set gfn=Hack-Regular:h14
	else
		set gfn=Hack\ 10
	endif

	set lines=50
	set columns=133
else
	colorscheme kimbie-dark
	set termguicolors
endif
augroup EnactLightlineConfig
	autocmd!
	"let g:lightline = { 'colorscheme': 'rosepine_dawn' }
	autocmd VimEnter * let g:lightline = { 'colorscheme': 'kimbie_dark' }
		\ | call lightline#init()
		\ | call lightline#update()
augroup END

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

" Support for stripping ANSI color codes from text
command! StripAnsi execute "keeppatterns %s/\\%x1b\\[[0-9;]*m//ge" | normal! ``
nnoremap <S-F6> :StripAnsi<C-m>
nnoremap <F6> :AnsiEsc<C-m>

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
" Prefix for wrapped lines
set sbr=↳\ 
set wrap

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

if(has('win32'))
	" Syntastic python support doesn't work right for me, and I haven't
	" pursued it.
	let g:syntastic_ignore_files= ['.py']
endif

" Show relative path to file in the statusline instead of just the file name
let g:lightline = {
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ }
      \ }
" Ensure the above setting takes effect even if lightline has already loaded
call lightline#init()

" This is an alternative to the relative path function below that doesn't show
" relative parent folders, but will show relative to home dir or root if
" current file is not located underneath the CWD.
"function! LightlineFilename()
"  " 'expand("%:~:.")' gets the path relative to the current working directory
"  "let l:path = expand('%:~:.')
"  "" 'fnamemodify' with ':.' forces a relative path, and will use ../ if needed
"  let l:path = fnamemodify(expand('%'), ':.')
"
"  " If it's an empty buffer, show [No Name]
"  let l:name = l:path !=# '' ? l:path : '[No Name]'
"
"  " Append modify (+) or read-only (-) flags automatically
"  let l:modified = &modified ? ' +' : ''
"  let l:readonly = &readonly ? ' -' : ''
"
"  return l:name . l:readonly . l:modified
"endfunction

" This shows the relative path of the current file to the CWD even if the file
" is above the current file in the path hierarchy.
function! LightlineFilename()
  let l:file = expand('%:p') " Get the full absolute path of the file
  if empty(l:file)
    return '[No Name]'
  endif

  let l:cwd = getcwd() . '/'

  " If the file is inside the current working directory or a subdirectory
  if l:file =~# '^' . l:cwd
    let l:path = substitute(l:file, '^' . l:cwd, '', '')
  else
    " If the file is in a parent directory, calculate the '../' segments
    let l:common = getcwd()
    let l:dots = ''
    while l:file !~# '^' . l:common && l:common !=# '/'
      let l:common = fnamemodify(l:common, ':h')
      let l:dots .= '../'
    endwhile

    let l:relative_part = substitute(l:file, '^' . l:common . '/', '', '')
    let l:path = l:dots . l:relative_part
  endif

  " Handle modified and read-only flags
  let l:modified = &modified ? ' +' : ''
  let l:readonly = &readonly ? ' -' : ''

  return l:path . l:readonly . l:modified
endfunction
