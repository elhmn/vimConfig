if exists("header_loaded")
	finish "stop loading the header loaded"
endif
let	header_loaded = 1

let s:global_cpo = &cpo "store current compatible-mode
						"in local variable
set cpo&vim				"go into nocompatible-mode

"======================================

let		s:templatePath = "~/.vimsrcs/templates"

function!		GetHeaderFromTemplate(cHeaderFileName)
	echom "fileName : ".s:templatePath."/".a:cHeaderFileName
	execute ":r ".s:templatePath."/".a:cHeaderFileName
	execute "normal! ggdd"
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
