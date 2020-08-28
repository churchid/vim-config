" Command 'BC' to close a buffer without closing the window it is located in
"
" Put this into .vimrc or make it a plugin.
" Mapping :Bclose to some keystroke would probably be more useful.
" I like the way buflisted() behaves, but some may like the behavior
" of other buffer testing functions.

command! BC call <SID>BufcloseCloseIt()

function! <SID>BufcloseCloseIt()
let l:currentBufNum = bufnr("%")
let l:alternateBufNum = bufnr("#")

if buflisted(l:alternateBufNum)
buffer #
else
bnext
endif

if bufnr("%") == l:currentBufNum
new
endif

if buflisted(l:currentBufNum)
execute("bdelete ".l:currentBufNum)
endif
endfunction

