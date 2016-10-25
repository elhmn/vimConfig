"My vim config

"Style
syntax on
colorscheme slate
set cursorline
highlight CursorLine ctermbg=darkblue cterm=NONE
set hls
set number
set incsearch
set foldenable
set foldmethod=syntax

"Indentation
set shiftwidth=4
set tabstop=4
set autoindent
set smartindent

"Command map

"go to previous tab
map <c-left>	gT
imap <c-left>	<esc>gT

"go to next tab
map <c-right>	gt
imap <c-right>	<esc>gt

"new tab
nmap <c-t>	:tabnew<cr>
imap <c-t>	<esc>:tabnew<cr>

"close tab
nmap <c-x>	:tabclose<cr>
imap <c-x>	<esc>:tabclose<cr>

"move to place templates placeholders
nnoremap <c-j> /<+.\++><cr>c/+>/e<cr>
inoremap <c-j> <esc>/<+.\++><cr>c/+>/e<cr>

"Match Limit column number
match Error #\%>80v.\+#

"Match line ending with \t or space
2match Error #[ \t]\+$#

"Statusline
set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%04l,%04v]\ [LEN=%L]

"Abbreviation
source ~/.vimsrcs/abbreviations.vim

"Load template
autocmd BufNewFile * silent! 0r ~/.vimsrcs/templates/%:e.tpl

"Comment vim file
