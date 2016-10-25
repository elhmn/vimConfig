"My vim config

syntax on
set number
set shiftwidth=4
set tabstop=4
set autoindent
set smartindent

"vim look color sheme
colorscheme slate

"abreviation code
iabbrev if if ()
iabbrev while while ()
iabbrev { {<cr>}<up>
"iabbrev ( ()<right>
iabbrev return return (0);

"key map"
map <C-d> :s/\s*$/\/\/Debug/g<cr>

"buffer select map
"map <C-left> <ESC>:bp<CR>
"map <C-right> <ESC>:bn<CR>

"command map
map <C-n> :cn <cr>
map <C-p> :cp <cr>

"match
" limit column number
match Error #\%>80v.\+#
