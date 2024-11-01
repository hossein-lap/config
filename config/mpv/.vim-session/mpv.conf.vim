let SessionLoad = 1
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
inoremap <silent> <Plug>(fzf-maps-i) :call fzf#vim#maps('i', 0)
inoremap <expr> <Plug>(fzf-complete-buffer-line) fzf#vim#complete#buffer_line()
inoremap <expr> <Plug>(fzf-complete-line) fzf#vim#complete#line()
inoremap <expr> <Plug>(fzf-complete-file-ag) fzf#vim#complete#path('ag -l -g ""')
inoremap <expr> <Plug>(fzf-complete-file) fzf#vim#complete#path("find . -path '*/\.*' -prune -o -type f -print -o -type l -print | sed 's:^..::'")
inoremap <expr> <Plug>(fzf-complete-path) fzf#vim#complete#path("find . -path '*/\.*' -prune -o -print | sed '1d;s:^..::'")
inoremap <expr> <Plug>(fzf-complete-word) fzf#vim#complete#word()
nnoremap <silent>  :cprevzz
nnoremap <silent> <NL> :lnextzz
nnoremap <silent>  :lprevzz
nnoremap <silent>  :cnextzz
nnoremap <silent>  :qa!
nnoremap <silent>  :w!
nnoremap  fv :Ex
nnoremap  fa :25Lex
nmap  ss :setlocal spell!
noremap <silent>  gf :GFiles
noremap <silent>  pf :Files
nnoremap <silent>  bp :bprevious
nnoremap <silent>  bn :bnext
vnoremap <silent>  d "_d
nnoremap <silent>  d "_d
vnoremap <silent>  p "_dP
nnoremap <silent>  P "+p
nnoremap <silent>  y "+Y
vnoremap <silent>  y "+Y
nnoremap \ga :exe g:triggercmd.'git add %'
nnoremap \gl :exe g:triggercmd.'git log --oneline --stat --graph --all'
nnoremap \gs :exe g:triggercmd.'git status -s'
nnoremap \cb :exe g:triggercmd.'make build'
nnoremap \cf :exe g:triggercmd.'make force'
nnoremap \ca :exe g:triggercmd.'make all'
nnoremap \cc :exe g:triggercmd.'make'
xmap gx <Plug>NetrwBrowseXVis
nmap gx <Plug>NetrwBrowseX
nmap gcu <Plug>Commentary<Plug>Commentary
nmap gcc <Plug>CommentaryLine
omap gc <Plug>Commentary
nmap gc <Plug>Commentary
xmap gc <Plug>Commentary
xnoremap <silent> <Plug>NetrwBrowseXVis :call netrw#BrowseXVis()
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#BrowseX(netrw#GX(),netrw#CheckIfRemote(netrw#GX()))
nmap <silent> <Plug>CommentaryUndo :echoerr "Change your <Plug>CommentaryUndo map to <Plug>Commentary<Plug>Commentary"
onoremap <silent> <Plug>(fzf-maps-o) :call fzf#vim#maps('o', 0)
xnoremap <silent> <Plug>(fzf-maps-x) :call fzf#vim#maps('x', 0)
nnoremap <silent> <Plug>(fzf-maps-n) :call fzf#vim#maps('n', 0)
tnoremap <silent> <Plug>(fzf-normal) 
tnoremap <silent> <Plug>(fzf-insert) i
nnoremap <silent> <Plug>(fzf-normal) <Nop>
nnoremap <silent> <Plug>(fzf-insert) i
nnoremap <silent> <C-H> :cprevzz
nnoremap <silent> <C-L> :cnextzz
nnoremap <silent> <C-K> :lprevzz
nnoremap <silent> <C-J> :lnextzz
nnoremap <silent> <C-X><C-C> :qa!
nnoremap <silent> <C-X><C-S> :w!
cmap WW w !sudo tee % > /dev/null
abbr teh the
abbr hte the
abbr foss Free and Open Source Software
abbr fsf Free Software Foundation
let &cpo=s:cpo_save
unlet s:cpo_save
set autochdir
set autoindent
set background=dark
set backspace=2
set cindent
set complete=.,k,w,b,d
set completeopt=menu,menuone,noinsert
set fileencodings=ucs-bom,utf-8,default,latin1
set fillchars=vert:|,fold:-,eob:~,lastline:@,vert:¦
set helplang=en
set hidden
set history=1000
set incsearch
set laststatus=2
set listchars=tab:│\ 
set printoptions=paper:a4
set ruler
set runtimepath=~/.vim,~/.vim/modules/fzf,~/.vim/modules/fzf.vim,~/.vim/modules/syntastic,~/.vim/modules/vim-auto-popmenu,~/.vim/modules/vim-dict,~/.vim/modules/vim-commentary,~/.vim/modules/vim-hybrid,~/.vim/modules/vim-256noir,~/.vim/modules/restore.vim,/var/lib/vim/addons,/etc/vim,/usr/share/vim/vimfiles,/usr/share/vim/vim91,/usr/share/vim/vimfiles/after,/etc/vim/after,/var/lib/vim/addons/after,~/.vim/after
set scrolloff=4
set shiftwidth=4
set shortmess=filnxtToOSc
set showcmd
set showmatch
set smartindent
set softtabstop=4
set spelllang=en_us,de
set splitbelow
set splitright
set statusline=\ %.50F\ %m\ %r%=\ \ %c:%l/%L\ \ %{&ff}\ \ %{&ft}\ %#warningmsg#%{SyntasticStatuslineFlag()}
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set tabstop=4
set undodir=~/.vim/undo
set undofile
set updatetime=20000
set wildignore=*.swp,*.bak,*.pyc
set wildmenu
set window=28
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/dev/primejade/hos-workflow/configs/config/mpv
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +0 ~/dev/primejade/hos-workflow/configs/config/mpv/mpv.conf
argglobal
%argdel
$argadd mpv.conf
edit ~/dev/primejade/hos-workflow/configs/config/mpv/mpv.conf
argglobal
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal cindent
setlocal cinkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinscopedecls=public,protected,private
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=#\ %s
setlocal complete=.,k,w,b,d
setlocal completefunc=
setlocal concealcursor=
setlocal conceallevel=0
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal cursorlineopt=both
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'confini'
setlocal filetype=confini
endif
setlocal fillchars=
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
set foldlevel=99
setlocal foldlevel=99
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatoptions=croql
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal lispoptions=
setlocal lispwords=
set list
setlocal list
setlocal listchars=
setlocal makeencoding=
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
set relativenumber
setlocal relativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal scrolloff=-1
setlocal shiftwidth=4
setlocal noshortname
setlocal showbreak=
setlocal sidescrolloff=-1
setlocal signcolumn=auto
setlocal smartindent
setlocal nosmoothscroll
setlocal softtabstop=4
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en_us,de
setlocal spelloptions=
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'confini'
setlocal syntax=confini
endif
setlocal tabstop=4
setlocal tagcase=
setlocal tagfunc=
setlocal tags=
setlocal termwinkey=
setlocal termwinscroll=10000
setlocal termwinsize=
setlocal textwidth=0
setlocal thesaurus=
setlocal thesaurusfunc=
setlocal undofile
setlocal undolevels=-123456
setlocal varsofttabstop=
setlocal vartabstop=
setlocal virtualedit=
setlocal wincolor=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let &fdl = &fdl
let s:l = 19 - ((18 * winheight(0) + 13) / 27)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 19
normal! 0
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
set shortmess=filnxtToOSc
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
