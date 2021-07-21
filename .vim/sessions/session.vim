let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Work/vimConfig
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
argglobal
%argdel
$argadd .vim/sessions/session_LOCAL_89172.vim
$argadd .vim/sessions/session_BASE_89172.vim
$argadd .vim/sessions/session_REMOTE_89172.vim
$argadd .vim/sessions/session.vim
edit .vim/sessions/session_LOCAL_89172.vim
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
split
1wincmd k
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
2wincmd h
wincmd w
wincmd w
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '1resize ' . ((&lines * 18 + 20) / 41)
exe 'vert 1resize ' . ((&columns * 52 + 79) / 158)
exe '2resize ' . ((&lines * 18 + 20) / 41)
exe 'vert 2resize ' . ((&columns * 52 + 79) / 158)
exe '3resize ' . ((&lines * 18 + 20) / 41)
exe 'vert 3resize ' . ((&columns * 52 + 79) / 158)
exe '4resize ' . ((&lines * 18 + 20) / 41)
argglobal
setlocal fdm=diff
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 113 - ((8 * winheight(0) + 9) / 18)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 113
normal! 0
wincmd w
argglobal
2argu
balt .vim/sessions/session_LOCAL_89172.vim
setlocal fdm=diff
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 54 - ((8 * winheight(0) + 9) / 18)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 54
normal! 0
wincmd w
argglobal
3argu
balt .vim/sessions/session_LOCAL_89172.vim
setlocal fdm=diff
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 52 - ((8 * winheight(0) + 9) / 18)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 52
normal! 0
wincmd w
argglobal
4argu
if bufexists(".vim/coc-settings.json") | buffer .vim/coc-settings.json | else | edit .vim/coc-settings.json | endif
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
1
normal! zo
let s:l = 16 - ((15 * winheight(0) + 9) / 18)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 16
normal! 0
wincmd w
4wincmd w
exe '1resize ' . ((&lines * 18 + 20) / 41)
exe 'vert 1resize ' . ((&columns * 52 + 79) / 158)
exe '2resize ' . ((&lines * 18 + 20) / 41)
exe 'vert 2resize ' . ((&columns * 52 + 79) / 158)
exe '3resize ' . ((&lines * 18 + 20) / 41)
exe 'vert 3resize ' . ((&columns * 52 + 79) / 158)
exe '4resize ' . ((&lines * 18 + 20) / 41)
tabnext 1
badd +1 .vim/sessions/session_LOCAL_89172.vim
badd +0 .vim/sessions/session_BASE_89172.vim
badd +0 .vim/sessions/session_REMOTE_89172.vim
badd +1 .vim/sessions/session.vim
badd +1 .vim/coc-settings.json
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToOSAc
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
