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

"replace a template placeholder with another string
"str : string to replace
"src : string to replace str with
function		s:ReplacePlaceholderString(str, src)
	let l:replace = ""

	for e in range(0, len(a:str) - 1)
		let l:replace .= " "
	endfor
	execute "normal! /".a:str."\<cr>"
	execute "%s/".a:str."/".l:replace."/gi"
	execute "normal! \<c-o>R".a:src
	unlet l:replace
endfunction

"Load header from specific template
function!		GetHeaderFromTemplate(headerFileName)
	let		l:variables = {"filename":"<+FILENAME+>","author":"<+AUTHOR+>", "editor":"<+EDITOR+>", "creationdate":"<+CREATIONDATE+>", "updatedate":"<+UPDATEDATE+>"}
	let		l:editor = $USER

	if IsMacOs() == 1
		let		l:creationDate = system('stat -qx '.expand("%").' | grep -E  "^Access:" | cut -d ":" -f 2- | cut -d " " -f 2- | tr -d "\n"')
	else
		let		l:creationDate = strftime("%a %b %d %H:%M:%S %Y", system('stat -c %Y '.expand("%")))
	endif

	echom "fileName : ".s:templatePath."/".a:headerFileName
	execute ":r ".s:templatePath."/".a:headerFileName
	execute "normal! ggdd\<c-o>\<c-o>"
	call s:ReplacePlaceholderString(l:variables["filename"], expand("%:t"))
	call s:ReplacePlaceholderString(l:variables["author"], s:author)
	call s:ReplacePlaceholderString(l:variables["editor"], l:editor)
	call s:ReplacePlaceholderString(l:variables["creationdate"], l:creationDate)
	call s:ReplacePlaceholderString(l:variables["updatedate"], strftime("%a %b %d %H:%M:%S %Y"))
endfunction

"Check if header already exist
function!		DoesHeaderExist()
	execute "normal! gg"
	if search('By:.*<.*>', 'cn', 20) == 0
		return 1
	endif
	return 0
endfunction

"Save update time
function		SaveUpdateTime()
	"Check if header already exist
	if DoesHeaderExist() != 0
		return 0
	endif
		execute '%s/\(Updated: \)\(.*[0-9]\{2}:[0-9]\{2}:[0-9]\{2} [0-9]\{4}\)\(.*by.*\)/\1'.strftime("%a %b %d %H:%M:%S %Y").'\3/gi'
	return 1
endfunction

"Add a header to a file
function!		AddHeader()
	"Check if header already exist
	if DoesHeaderExist() == 0
		return 0
	endif
	let l:fileType = expand("%:e")
	let	l:cHeaderFileName = "cHeader.tpl"

	if l:fileType =~# 'c\|cpp\|php\|js\|h\|hpp\|cc'
		execute "normal! ggO"
		call GetHeaderFromTemplate(l:cHeaderFileName)
"		echo "file type is c"
	else
		echom "unhandled file type is ".expand("%:e")
	endif
	return 1
endfunction

"Update header creation time
function!		UpdateHeaderCreationTime()

endfunction

function		IsMacOs()
	if has("unix") && system('uname') =~ 'Darwin'
		return 1
	endif
	return 0
endfunction


noremap <Sid>AddHeader : call <Sid>AddHeader()<cr>
noremap <silent> <c-h><c-h> : call AddHeader()<cr>
autocmd BufWritePost * call SaveUpdateTime()

"======================================

let &cpo = s:global_cpo	"must be added at the end of the script
