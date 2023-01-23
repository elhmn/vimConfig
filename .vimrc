" ************************************************************************** "
"
"                                                                            "
"   .vimrc                                                                   "
"                                                                            "
"   By: elhmn <www.elhmn.com>                                                "
"             <nleme@live.fr>                                                "
"                                                                            "
"   Created: Sun Jun 17 17:02:37 2018                        by elhmn        "
"   Updated: Sun May 22 14:01:42 2022                        by codespace    "
"                                                                            "
" ************************************************************************** "

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

Plug 'OmniSharp/omnisharp-vim'
"in case unityengine autocompletion fails add  to your shellrc file
"export FrameworkPathOverride=/lib/mono/4.5

" Octo nvim / octo.nvim
if has("unix")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
	if has('nvim')
		Plug 'pwntester/octo.nvim'
		Plug 'nvim-lua/plenary.nvim'
		Plug 'nvim-telescope/telescope.nvim'
		Plug 'kyazdani42/nvim-web-devicons'
	endif
  endif
endif

"Colorschem
Plug 'fcpg/vim-orbital'
Plug 'jacoborus/tender.vim'

"vimspector nice for debugging
Plug 'puremourning/vimspector'

"for lint
" Plug 'w0rp/ale'

"tern
Plug 'marijnh/tern_for_vim'

"vim-snippets
Plug 'honza/vim-snippets'

"diffview.nvim
"diffview depends on plenary
Plug 'nvim-lua/plenary.nvim'
Plug 'sindrets/diffview.nvim'

"History vim-mundo
Plug 'simnalamburt/vim-mundo'

"vista
Plug 'liuchengxu/vista.vim'


"Completion
"Plug 'maralla/completor.vim' , { 'do': 'make js'}

"Tree browser
Plug 'scrooloose/nerdtree'

"Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'ctrlpvim/ctrlp.vim'

"Markdown-preview
" if your markdown preview is not working run `:call mkdp#util#install()`
" as mentioned in this comment -> https://github.com/iamcco/markdown-preview.nvim/issues/188#issuecomment-1161115873
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

au! FileType go map <c-x><c-x>d <esc>:GoDeclsDir<cr>

"syntax
Plug 'pangloss/vim-javascript'

"git
Plug 'zivyangll/git-blame.vim'
Plug 'tpope/vim-fugitive'

"Comments
Plug 'scrooloose/nerdcommenter'

"Html5
Plug 'othree/html5.vim'

"Vim markdown
"Plug 'plasticboy/vim-markdown'

"html emmet
Plug 'mattn/emmet-vim'

"Find files
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'yuki-yano/fzf-preview.vim'
" Plug 'voldikss/vim-floaterm'

"LSP Language server protocol support
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

"statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'sheerun/vim-polyglot'

"markdown fold
Plug 'masukomi/vim-markdown-folding', { 'for': 'markdown' }

"ack.vim
" on mac install ack with `brew install ack`
Plug 'mileszs/ack.vim'

"context.vim
Plug 'wellle/context.vim'

"vim-visual-multi
"Plug 'mg979/vim-visual-multi', {'branch': 'master'}


" Initialize plugin system
call plug#end()

"My vim config

"disable beep
set noeb vb t_vb=


"Style
syntax on
"set mouse=a
set hls
set number
" set relativenumber
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
set listchars=tab:\-->

" set cindent
autocmd FileType javascript setlocal tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
autocmd FileType python setlocal softtabstop=4 tabstop=4 noexpandtab shiftwidth=4 list

" add yaml stuffs
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd BufWritePost *{.yaml,yml} retab!

"Command map

"copilot map to another key
" i am currently  not using it as it is not working well
" imap <silent><script><expr> <C-J> copilot#Accept("<CR>")
" let g:copilot_no_tab_map = v:true
" let g:copilot_assume_mapped = v:true

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
set statusline+=%f\ [FORMAT=%{&ff}]\ [POS=%04l,%04v]\ [LEN=%L]

"Abbreviation
source ~/.vimsrcs/abbreviations.vim

"Load template
autocmd BufNewFile * silent! 0r ~/.vimsrcs/templates/%:e.tpl

colorscheme orbital

" autocmd VimEnter * source  ~/.vimsrcs/custom_colors.vim
" autocmd VimEnter * AirlineTheme orbital
" autocmd SessionLoadPost * source ~/.vimsrcs/custom_colors.vim
"Session
autocmd VimEnter * call LoadSession()
autocmd VimLeave * call SaveSession()
function! SaveSession()
	execute 'mksession! $HOME/.vim/sessions/session.vim'
endfunction
function! LoadSession()
	if argc() == 0
		execute 'source $HOME/.vim/sessions/session.vim'
	endif
endfunction

"vim scripts header
"source ~/.vimsrcs/header.vim
"Comment vim file
source ~/.vimsrcs/comments.vim

"Completion plugins
" let g:completor_node_binary = '/usr/local/bin/node'
"If go completion does not work change gocode bin path
" let g:completor_gocode_binary = '~/go/bin/gocode'
" inoremap <expr> <Down> pumvisible() ? "\<C-n>" : "\<Down>"
" inoremap <expr> <Up> pumvisible() ? "\<C-p>" : "\<Up>"
" inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"

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


"coc======================= START
let g:coc_disable_startup_warning = 1
let g:coc_global_extensions=[ 'coc-omnisharp', 'coc-yaml', 'coc-json', 'coc-html', 'coc-css', 'coc-emmet', 'coc-prettier', 'coc-tsserver', 'coc-css', 'coc-pyright', 'coc-diagnostic', 'coc-markdownlint', 'coc-rust-analyzer', 'coc-sh', 'coc-snippets']

"disable coc for *.cs
" autocmd BufNew,BufEnter *.cs execute "silent! CocDisable"
" autocmd BufLeave *.cs execute "silent! CocEnable"

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
  endfunction

  " Insert <tab> when previous text is space, refresh completion if not.
  inoremap <silent><expr> <TAB>
	\ coc#pum#visible() ? coc#pum#next(1):
	\ <SID>check_back_space() ? "\<Tab>" :
	\ coc#refresh()
  inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"


" map with snippets
" inoremap <silent><expr> <TAB>
"     \ coc#pum#visible() ? coc#_select_confirm() :
"     \ coc#expandableOrJumpable() ?
"     \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"     \ <SID>check_back_space() ? "\<TAB>" :
"     \ coc#refresh()
"
" let g:coc_snippet_next = '<tab>'

"Use <c-space> to trigger completion:
  if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
  else
    inoremap <silent><expr> <c-@> coc#refresh()
  endif

" Use <c-n> to trigger completion.
inoremap <expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
" nmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
let g:airline#extensions#coc#enabled = 1
let airline#extensions#coc#error_symbol = 'E:'
let airline#extensions#coc#warning_symbol = 'W:'
let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'


nmap cd :CocDiagnostic<cr>

"
"coc======================= END

"omnisharp
"let g:OmniSharp_server_use_mono = 1

"vim-go config
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_metalinter_command = "golangci-lint"
let g:go_list_type = 'quickfix'
let g:go_decls_mode="fzf"
let g:go_metalinter_autosave = 1
" let g:go_metalinter_enabled = ["govet","whitespace", "errcheck"]
let g:go_metalinter_enabled = ["govet","whitespace", "errcheck", "unused", "deadcode", "gosimple", "staticcheck", "structcheck", "typecheck", "varcheck"]
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_decls_includes = "func,type"
let g:go = "func,type"

"emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css,javascript,php EmmetInstall

"redefine triggerkey
let g:user_emmet_leader_key=','

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
" let g:ale_completion_enabled = 1

let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier', 'eslint']
" " let g:ale_fix_on_save = 1
"
let g:ale_linters = {}
let g:ale_linters['javascript'] = ['eslint']
let g:ale_linters['cs'] = ['OmniSharp']
" let g:ale_linters['c'] = ['gcc']
" let g:ale_linter_aliases = {'h': 'c'}
" let g:ale_linter_aliases['hpp'] = ['cpp']
" let g:ale_go_bingo_executable = 'gopls'
" let g:ale_linters['c'] = ['gcc']
" let g:ale_linters = {
" 	\ 'go': ['gopls'],
" 	\}
" let g:ale_linters['cpp'] = ['g++']
" let g:ale_c_gcc_options="-Wall -Werror -Wextra"
" let g:ale_c_parse_makefile=1
"
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

"airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#close_symbol = '×'
let g:airline#extensions#tabline#show_close_button = 0
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#displayed_head_limit = 20

"quickfix search on two level
command! -nargs=+ Silent
\   execute 'silent <args>'
\ | redraw!

"find word
map fw :Ack<cr>

"find file -- FZF
map ff :Silent execute "FZF" <cr>

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~20%' }

"Style color scheme
"source ~/.vimsrcs/custom_colors.vim

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

"ack
"use ack with ag
"install ag using `brew install the_silver_searcher`
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

let g:ack_mappings = {
      \  'v':  '<C-W><CR><C-W>L<C-W>p<C-W>J<C-W>p',
      \ 'gv': '<C-W><CR><C-W>L<C-W>p<C-W>J' }

"vista
let g:vista_default_executive = 'coc'
"show vista
map fv :Vista<cr>
"hide vista
map vf :Vista!<cr>
"vista finder
map fd :Vista finder<cr>

"mundo
nnoremap mu :MundoToggle<CR>

"context.vim
let g:context_enabled = 0
let g:context_filetype_blacklist = []
let g:context_max_height = 10
let g:context_max_per_indent = 5

"Octo nvim / octo.nvim
if has("unix")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
	if has('nvim')
		lua require('octo').setup()
	endif
  endif
endif


"vimspector nice for debugging
func! AddToWatch()
	let word = expand("<cexpr>")
	call vimspector#AddWatch(word)
endfunction

noremap dl :call vimspector#Launch()<cr>
noremap dR :call vimspector#Reset()<cr>
noremap dr :call vimspector#Restart()<cr>
noremap dn :call vimspector#Continue()<cr>
noremap dnc :call vimspector#RunToCursor()<cr>
noremap db :call vimspector#ToggleBreakpoint()<cr>
noremap dbx :call vimspector#ClearBreakpoints()<cr>
noremap dbc :call vimspector#ToggleConditionalBreakPoint()<cr>
nnoremap daw :call AddToWatch()<CR>
noremap so :call vimspector#StepOut()<cr>
"step over represent the next step
noremap sn :call vimspector#StepOver()<cr>
noremap si :call vimspector#StepInto()<cr>
noremap su :call vimspector#UpFrame()<cr>
noremap sd :call vimspector#DownFrame()<cr>

" Add VimspectorInstall <your_gadget> to setup a language

"must be uncommented only for editing bw-frontend projects
"set suffixesadd+=.js
"set suffixesadd+=.template
"set suffixesadd+=.css

"set path+=public

set backspace=2 " make backspace work like most other programs
"set backspace=indent,eol,start

set cursorline

"highlight CursorLine ctermbg=NONE cterm=NONE
filetype indent off
filetype plugin indent off
" Enable filetype plugins
filetype plugin on

"Always at end of vimrc
set exrc
set secure
