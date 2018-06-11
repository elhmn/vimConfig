if exists("loaded_myscript")
	finish "stop loading the script"
	"or instead delete/unload function contained in the script
	"delfunction MyglobalFunction
endif
let	loaded_myscript=1
let s:global_cpo = &cpo "store current compatible-mode
						"in local variable
set cpo&vim				"go into nocompatible-mode

let &cpo = s:global_cpo	"must be added at the end of the script
