" ************************************************************************** "
"                                                                            "
"   .vimrc                                                                   "
"                                                                            "
"   By: elhmn <www.elhmn.com>                                                "
"             <nleme@live.fr>                                                "
"                                                                            "
"   Created: Sun Jun 17 17:02:37 2018                        by elhmn        "
"   Updated: Wed Dec 11 15:58:23 2019                        by bmbarga      "
"                                                                            "
" ************************************************************************** "

"My vim config

"disable beep
set noeb vb t_vb=


"Style
syntax on
"set mouse=a
set hls
set number
set relativenumber
set incsearch
set foldenable
set foldmethod=syntax

"Indentation
set noexpandtab
set copyindent
set preserveindent
set softtabstop=0
set shiftwidth=4
set tabstop=4
set autoindent
set smartindent
set smarttab
set listchars=tab:\--

" set cindent
autocmd FileType javascript setlocal tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
autocmd FileType python setlocal softtabstop=4 tabstop=4 noexpandtab shiftwidth=4 list

" add yaml stuffs
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

"Command map

"go to previous tab
map <c-left>	gT
imap <c-left>	<esc>gT

"go to next tab
map <c-right>	gt
imap <c-right>	<esc>gt

"new tab
nmap ot	:tabnew<cr>

"close tab
nmap ct	:tabclose<cr>

"move to place templates placeholders
nnoremap <c-j> /<+.\++><cr>c/+>/e<cr>
inoremap <c-j> <esc>/<+.\++><cr>c/+>/e<cr>

"tags move back
noremap <c-b> :pop<cr>
inoremap <c-b> <esc>:pop<cr>

"Match Limit column number
autocmd BufEnter * match ErrorMsg #\%>80v.\+#

"Match line ending with \t or space
 autocmd BufEnter * 2match ErrorMsg #[ \t]\+$#

"Clean spaces after end of line
autocmd BufWritePost * execute ':silent! %s/[ \t]\+$//g'
nnoremap <leader>l :%s/[ \t]\+$//g<cr>

"completions code
inoremap {<CR>  {<CR>}<Esc>O
" inoremap ( ()<esc>ha
" inoremap " ""<esc>ha
" inoremap ' ''<esc>ha

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

"vim scripts header
source ~/.vimsrcs/header.vim
source ~/.vimsrcs/comments.vim

"Completion plugins
let g:completor_node_binary = '/usr/local/bin/node'
"If go completion does not work change gocode bin path
let g:completor_gocode_binary = '~/go/bin/gocode'
inoremap <expr> <Down> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up> pumvisible() ? "\<C-p>" : "\<Up>"
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
" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_javascript_eslint_exec = 'eslint_d'

"vim plug : plugin manager

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

"php completion
""Plug 'shawncplus/phpcomplete.vim'

" post install (yarn install | npm install) then load plugin only for editing supported files
" Don't forget to change add --no--editorconfig for single_quote
"
"            \ get(a:config, 'configPrecedence', g:prettier#config#config_precedence) .
"            \ ' --stdin-filepath ' .
"            \ simplify(expand("%:p")) .
" +          \ ' --no-editorconfig '.
" +          \ ' --loglevel "error" '.
"            \ ' --stdin '
"    return l:cmd
"
" Plug 'prettier/vim-prettier', {
"   \ 'do': 'yarn install',
"   \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue'] }

"Colorschem
Plug 'fcpg/vim-orbital'
Plug 'jacoborus/tender.vim'

"for lint
Plug 'w0rp/ale'

"tern
Plug 'marijnh/tern_for_vim'

"Completion
Plug 'maralla/completor.vim' , { 'do': 'make js'}

"Tree browser
Plug 'scrooloose/nerdtree'

"Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'ctrlpvim/ctrlp.vim'

"syntax
Plug 'pangloss/vim-javascript'

"git
Plug 'zivyangll/git-blame.vim'
Plug 'tpope/vim-fugitive'

"tags
Plug 'ludovicchabant/vim-gutentags'
let g:gutentags_cache_dir="~/.tags"
let g:gutentags_file_list_command = {
    \ 'markers': {
        \ '.git': 'git ls-files',
    \ },
\ }

"Comments
Plug 'scrooloose/nerdcommenter'

"Html5
Plug 'othree/html5.vim'

"Vim markdown
Plug 'plasticboy/vim-markdown'

"html emmet
Plug 'mattn/emmet-vim'

"Find files
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"vim-go config
let g:go_metalinter_autosave = 1
let g:go_metalinter_command = "golangci-lint"
let g:go_list_type = 'quickfix'
let g:go_metalinter_autosave = 1
let g:go_metalinter_enabled = ["vet","golint","errcheck"]
" let g:go_metalinter_enabled = ["deadcode", "errcheck", "gosimple", "ineffassign", "staticcheck", "structcheck", "typecheck", "unused", "varcheck"]
" let g:go_metalinter_autosave_enabled = ["govet","golint","errcheck"]
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_decls_includes = "func,type"

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

let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier', 'eslint']
" let g:ale_fix_on_save = 1

let g:ale_linters = {}
let g:ale_linters['javascript'] = ['eslint']
let g:ale_linters['c'] = ['gcc']
let g:ale_linters['c++'] = ['g++']
let g:ale_c_gcc_options="-Wall -Werror -Wextra"

" max line length that prettier will wrap on
" Prettier default: 80
"let g:prettier#config#print_width = 80

" number of spaces per indentation level
" Prettier default: 2
" let g:prettier#config#tab_width = 4

" use tabs over spaces
" Prettier default: false
" let g:prettier#config#use_tabs = 'false'

" print semicolons
" Prettier default: true
" let g:prettier#config#semi = 'true'

" single quotes over double quotes
" Prettier default: false
" let g:prettier#config#single_quote = 'true'

" print spaces between brackets
" Prettier default: true
" let g:prettier#config#bracket_spacing = 'false'

" put > on the last line instead of new line
" Prettier default: false
" let g:prettier#config#jsx_bracket_same_line = 'false'

" avoid|always
" Prettier default: avoid
" let g:prettier#config#arrow_parens = 'avoid'

" none|es5|all
" Prettier default: none
" let g:prettier#config#trailing_comma = 'all'

" flow|babylon|typescript|css|less|scss|json|graphql|markdown
" Prettier default: babylon
" let g:prettier#config#parser = 'babylon'

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

"Style color scheme
source ~/.vimsrcs/custom_colors.vim

"quickfix search on two level
command! -nargs=+ Silent
\   execute 'silent <args>'
\ | redraw!

map fw :Silent execute "grep -RE ".expand("<cword>")." . " <Bar> cw<CR>

"FZF
map ff :Silent execute "FZF" <cr>

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~20%' }

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

"must be uncommented only for editing bw-frontend projects
"set suffixesadd+=.js
"set suffixesadd+=.template
"set suffixesadd+=.css

"set path+=public

set backspace=2 " make backspace work like most other programs
"set backspace=indent,eol,start


filetype indent off
filetype plugin indent off
" Enable filetype plugins
filetype plugin on

"Always at end of vimrc
set exrc
set secure
