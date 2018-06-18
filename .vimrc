" ************************************************************************** "
"                                                                            "
"   .vimrc                                                                   "
"                                                                            "
"   By: elhmn <www.elhmn.com>                                                "
"             <nleme@live.fr>                                                "
"                                                                            "
"   Created: Sun Jun 17 17:02:37 2018                        by elhmn        "
"   Updated: Sun Jun 17 19:12:53 2018                        by elhmn        "
"                                                                            "
" ************************************************************************** "

"My vim config

"Style
syntax on
"set mouse=a
set hls
set number
set incsearch
set foldenable
set foldmethod=syntax
source ~/.vimsrcs/custom_colors.vim
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

"completions code
inoremap {<CR>  {<CR>}<Esc>O
inoremap (<space> ()<esc>ha
inoremap "<space> ""<esc>ha
inoremap '<space> ''<esc>ha

"Statusline
set laststatus=2
set statusline=%f\ [FORMAT=%{&ff}]\ [POS=%04l,%04v]\ [LEN=%L]

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

"vim scripts test
source ~/.vimsrcs/header.vim

"Completion plugins
let g:completor_node_binary = '/usr/local/bin/node'
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"

"NERDTree
autocmd vimenter * NERDTree

"When vim is open without file
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"When opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

"Toggle NerdTree
map <C-n> :NERDTreeToggle<CR>

"When the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"netwr
"let g:netrw_liststyle = 3
"let g:netrw_banner = 0
"let g:netrw_browse_split = 4
"let g:netrw_altv = 1
"let g:netrw_winsize = 15

"noremap <c-e><c-e> :Vexplore <cr>
"noremap <c-x><c-x> :q! <cr>
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END

"vim-js
let g:javascript_plugin_jsdoc = 1

"eslint_d
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = 'eslint_d'

"vim plug : plugin manager

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue'] }


"for lint
Plug 'w0rp/ale'
"Plug 'joestelmach/lint.vim'

"tern
Plug 'marijnh/tern_for_vim'

"Completion
Plug 'maralla/completor.vim' , { 'do': 'make js'}

"Tree browser
Plug 'scrooloose/nerdtree'

"syntax
Plug 'pangloss/vim-javascript'

"tags
Plug 'ludovicchabant/vim-gutentags'

"colorscheme
Plug 'henrynewcomer/vim-theme-papaya'

"Comments
Plug 'scrooloose/nerdcommenter'

"Html5
Plug 'othree/html5.vim'

"Vim markdown
Plug 'plasticboy/vim-markdown'

"html emmet
Plug 'mattn/emmet-vim'


" Initialize plugin system
call plug#end()

"emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css,javascript,php EmmetInstall

"redefine triggerkey
let g:user_emmet_leader_key='<C-Y>'

"html5

"Disable event-handler attributes support:
" let g:html5_event_handler_attributes_complete = 0

" Disable RDFa attributes support:
" let g:html5_rdfa_attributes_complete = 0

"Disable microdata attributes support:
" let g:html5_microdata_attributes_complete = 0

"Disable WAI-ARIA attribute support:
" let g:html5_aria_attributes_complete = 0



"ale
let g:ale_completion_enabled = 1

" max line length that prettier will wrap on
" Prettier default: 80
let g:prettier#config#print_width = 80

" number of spaces per indentation level
" Prettier default: 2
let g:prettier#config#tab_width = 4

" use tabs over spaces
" Prettier default: false
let g:prettier#config#use_tabs = 'true'

" print semicolons
" Prettier default: true
let g:prettier#config#semi = 'true'

" single quotes over double quotes
" Prettier default: false
let g:prettier#config#single_quote = 'true'

" print spaces between brackets
" Prettier default: true
let g:prettier#config#bracket_spacing = 'false'

" put > on the last line instead of new line
" Prettier default: false
let g:prettier#config#jsx_bracket_same_line = 'false'

" avoid|always
" Prettier default: avoid
let g:prettier#config#arrow_parens = 'avoid'

" none|es5|all
" Prettier default: none
let g:prettier#config#trailing_comma = 'all'

" flow|babylon|typescript|css|less|scss|json|graphql|markdown
" Prettier default: babylon
let g:prettier#config#parser = 'babylon'

" cli-override|file-override|prefer-file
"let g:prettier#config#config_precedence = 'prefer-file'

" always|never|preserve
"let g:prettier#config#prose_wrap = 'preserve'

"NErdCommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
"let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
"let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
