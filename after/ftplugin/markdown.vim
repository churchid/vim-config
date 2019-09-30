" Dan Churchill markdown-specific customizations
set expandtab
set tw=132
set sw=4
set autoindent
setlocal spell spelllang=en_us

if !exists("g:markdown_build_cmd")
    let g:markdown_build_cmd = "perl /cygdrive/c/Users/dchurchill/Documents/Projects/Utilities/Markdown/Markdown.pl"
endif

function! BuildHtml()
    execute "!" . g:markdown_build_cmd . " \"" . @% . "\" >\"" . expand('%:r') . ".html\""
endfunction

map <F7> :call BuildHtml()<cr>

