if exists("header_loaded")
	finish "stop loading the header loaded"
endif
let	header_loaded = 1

let s:global_cpo = &cpo "store current compatible-mode
						"in local variable
set cpo&vim				"go into nocompatible-mode

"======================================

let		s:templatePath = "~/.vimsrcs/templates"
let		s:author = "elhmn"

function		s:ReplaceString(str, src)
	let l:replace = ""

	for e in range(0, len(a:str) - 1)
		let l:replace .= " "
	endfor
	execute "normal! /".a:str."\<cr>"
	execute "%s/".a:str."/".l:replace."/gi"
	execute "normal! \<c-o>R".a:src
	unlet l:replace
endfunction

function!		GetHeaderFromTemplate(headerFileName)
	let		l:variables = {"filename":"<+FILENAME+>","author":"<+AUTHOR+>", "editor":"<+EDITOR+>", "creationdate":"<+CREATIONDATE+>", "updatedate":"<+UPDATEDATE+>"}
	let		l:editor = $USER
	let		l:creationDate = system('stat -qx '.expand("%").' | grep -E  "^Access:" | cut -d ":" -f 2- | cut -d " " -f 2- | tr -d "\n"')
	echom "fileName : ".s:templatePath."/".a:headerFileName
	execute ":r ".s:templatePath."/".a:headerFileName
	execute "normal! ggdd\<c-o>\<c-o>"
	call s:ReplaceString(l:variables["filename"], expand("%:t"))
	call s:ReplaceString(l:variables["author"], s:author)
	call s:ReplaceString(l:variables["editor"], l:editor)
	call s:ReplaceString(l:variables["creationdate"], l:creationDate)
	call s:ReplaceString(l:variables["updatedate"], strftime("%a %b %d %H:%M:%S %Y"))
endfunction

function!		AddHeader()
	let l:fileType = expand("%:e")
	let	l:cHeaderFileName = "cHeader.tpl"

	if l:fileType =~# 'c\|cpp\|php\|js\|h\|hpp\|cc'
		execute "normal! ggO"
		call GetHeaderFromTemplate(l:cHeaderFileName)
"		echo "file type is c"
	else
		echom "unhandled file type is ".expand("%:e")
	endif
endfunction

noremap <Sid>AddHeader : call <Sid>AddHeader()<cr>
noremap <silent> <c-h><c-h> : call AddHeader()<cr>

"======================================

let &cpo = s:global_cpo	"must be added at the end of the script
