"  _  _ ___
" | || | __|   H
" | __ | _|    A
" |_||_|___|   P
"
"
" <Leader> key section {{{
let mapleader=' '      " change the <Leader> Key
let maplocalleader='\'      " change the <Leader> Key
" }}}

" buffers {{{
noremap <silent> <leader>bn :bnext<CR> 
noremap <silent> <leader>bp :bprevious<CR> 
noremap <silent> <leader>bk :bdelete<CR> 
" }}}

" netrw toggle {{{
nmap <silent> <leader>fa  :24Lexplore<CR><C-w>w
" }}}

" use control-c instead of escape {{{
imap <C-c> <Esc>
" }}}

" spelling check {{{
nmap <leader>ss  :setlocal spell!<CR>
nmap <leader>se  :set spelllang=en_us<CR>
nmap <leader>sf  :set spelllang=fr<CR>
nmap <leader>sd  :set spelllang=de<CR>
" }}}

" split long single line apart {{{
nmap Q gqq
" }}}

" saving read-only files using doas/sudo and tee {{{
cmap WW w !sudo tee % > /dev/null
" }}}

" Spell {{{
inoremap <C-z> <C-x><C-s>
" }}}

" Q to qa {{{
cmap Q qa
" }}}

" ref to reaload vim config {{{
nnoremap <leader>hrr :source ~/.vim/vimrc<CR>
" }}}

" disable search highlight temporarily {{{
nnoremap <silent> <C-l> :set hlsearch!<CR>
" }}}

" yank / put {{{
vnoremap <silent> <leader>y "+Y
nnoremap <silent> <leader>y "+Y
nnoremap <silent> <leader>P "+p
xnoremap <silent> <leader>p "_dP
nnoremap <silent> <leader>d "_d
vnoremap <silent> <leader>d "_d
" }}}

" location/quickfix list {{{
nnoremap <silent> <C-n> :lnext<CR>
nnoremap <silent> <C-p> :lprev<CR>

nnoremap <silent> <C-j> :cnext<CR>
nnoremap <silent> <C-k> :cprev<CR>
" }}}

" move lines in v-mode {{{
vnoremap <silent> J :m '>+1<CR>gv=gv<CR>
vnoremap <silent> K :m '<-2<CR>gv=gv<CR>
" }}}

" " toggle paste mode {{{
" nmap <C-P> :set paste! nu! list!<CR>
" "nmap <C-P> :set list!<CR>
" " }}}
" " comment lines via - and uncomment via + {{{
" "" new-style
" "noremap <silent> - :<C-B>silent <C-E>s;\v^(\s*);\1<C-R>=escape(b:comment_leader,'\ ')<CR><CR>:nohlsearch<CR>
" "noremap <silent> + :<C-B>silent <C-E>s;\v^(\s*)<C-R>=escape(b:comment_leader,'\/')<CR>;\1;<CR>:nohlsearch<CR>
" "" old-style
" noremap <silent> - :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
" noremap <silent> + :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>
" " }}}
"" toggle ltr support "{{{
"nmap <leader>bd   :set termbidi!<CR>
" }}}
" " move into pane {{{
" nmap <C-h>  <C-w>h
" nmap <C-j>  <C-w>j
" nmap <C-k>  <C-w>k
" nmap <C-l>  <C-w>l
" " }}}
"" force save exit multi panes {{{
"map <Leader>zz    :xa!<CR>
" }}}
"" force exit multi panes and don't save {{{
"map <Leader>zq    :qa!<CR>
" }}}
"" force write to file {{{
"cmap W w!
" }}}
