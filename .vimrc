"My vim config

"Style
syntax on
set hls
set number
set incsearch
set foldenable
set foldmethod=syntax
source ~/.vimsrcs/custom_colors.vim

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
nmap <c-x><c-t>	:tabclose<cr>
imap <c-x><c-t>	<esc>:tabclose<cr>

"move to place templates placeholders
nnoremap <c-j> /<+.\++><cr>c/+>/e<cr>
inoremap <c-j> <esc>/<+.\++><cr>c/+>/e<cr>

"tags move back
noremap <c-b> :pop<cr>
inoremap <c-b> <esc>:pop<cr>

"Match Limit column number
match ErrorMsg #\%>80v.\+#

"Match line ending with \t or space
2match ErrorMsg #[ \t]\+$#

"Statusline
set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%04l,%04v]\ [LEN=%L]

"Abbreviation
source ~/.vimsrcs/abbreviations.vim

"Load template
autocmd BufNewFile * silent! 0r ~/.vimsrcs/templates/%:e.tpl

"Comment vim file

"Session
autocmd VimEnter * call LoadSession()
autocmd VimEnter * source  ~/.vimsrcs/custom_colors.vim
autocmd VimLeave * call SaveSession()
autocmd SessionLoadPost * source ~/.vimsrcs/custom_colors.vim
function! SaveSession()
	execute 'mksession! $HOME/.vim/sessions/session.vim'
endfunction
function! LoadSession()
	if argc() == 0
		execute 'source $HOME/.vim/sessions/session.vim'
	endif
endfunction
