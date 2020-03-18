set foldmethod=expr

function! FoldDepth(lnum)
	if getline(a:lnum) =~? '\v^\s*$'
		return '-1'
	endif

	if getline(a:lnum) =~ '^--BEGIN LOG ENTRY--'
		return '>1'
	else
		return '1'
	endif
endfunction

set foldexpr=FoldDepth(v:lnum)

function! MyFoldText()
	let l:numlines = v:foldend - v:foldstart + 1
	let l:width = winwidth(0)-  &foldcolumn - (&number ? 8 : 0)
	for l:i in range(v:foldstart, v:foldend)
		let l:line = getline(l:i)
		if l:line =~ '^Message:'
			let l:text = '+-- ' . Padding(2, l:numlines) . l:numlines . ' ' . substitute(l:line, '/^Message:\s+', '', '')
			return l:text
		endif
	endfor
endfunction

function! Padding(w, val)
	return repeat(' ', a:w - strwidth(a:val))
endfunction

set foldtext=MyFoldText()


