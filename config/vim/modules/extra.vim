"" Plugins And Extra Settings:

" auto complete {{{
let g:AFillOn=0
function! ToggleAutoFill()
	if !g:AFillOn
		call AutoFill()
		echo "AutoFill macro activated."
	else
		call AutoFillOff()
		echo "AutoFill macro deactivated."
	endif
endfunction

function! AutoFill()
	let g:AFillOn=1
	inoremap "  ""<Left>
	inoremap `  ``<Left>
	inoremap '  ''<Left>
	inoremap (  ()<Left>
	inoremap [  []<Left>
	inoremap {  {}<Left>
endfunction

function! AutoFillOff()
	let g:AFillOn=0
	iu "
	iu `
	iu '
	iu (
	iu [
	iu {
endfunction

nmap <space><space>a :call ToggleAutoFill()<CR>

au FileType c,cpp,sh,python,lua,markdown,latex,vim,csh
	\ call AutoFill()

"" Markdown complete
function! MDownFill()
"	echo "MDownFill macro activated."
	let g:AFillOn=1
	inoremap *  **<Left>
	inoremap _  __<Left>
endfunction

function! MDownFillOff()
"	echo "MDownFill macro deactivated."
	let g:AFillOn=0
	iu *
	iu _
endfunction

au FileType markdown,rmd call MDownFill()
"au FileType html,xml inoremap <  <><Left>
" }}}

" vim-plug {{{
call plug#begin('~/.vim/plugged/')
	" " transparent background
	" Plug 'tribela/vim-transparent'

	" Linter
	Plug 'vim-syntastic/syntastic'

	" Auto completion
	Plug 'hossein-lap/AutoComplPop'

	" comment
	Plug 'tpope/vim-commentary'
	" Plug 'vim-scripts/BlockComment.vim'

	" colorschemes
	Plug 'fxn/vim-monochrome'
	Plug 'hossein-lap/vim-256noir'
	" Plug 'hossein-lap/vim-hybrid'
	" Plug 'hossein-lap/vim-sunbather'
	Plug 'hossein-lap/vim-paramount'
	Plug 'hossein-lap/vim-lupper'
	Plug 'hossein-lap/vim-octave'
	Plug 'dikiaap/minimalist'
	Plug 'tomasiser/vim-code-dark'
	Plug 'ericbn/vim-solarized'
	Plug 'morhetz/gruvbox'
	Plug 'kristijanhusak/vim-hybrid-material'
	Plug 'arzg/vim-colors-xcode'
call plug#end()

"""" Some more plugins:
"""" Do not uncomment these here
"""" You should put them between [call plug#XXX] first


"  Plug 'Jorengarenar/miniSnip' " minimal snippet manager
"  Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' } " latex compile/preview
"  Plug 'lifepillar/vim-mucomplete'
"  Plug 'tpope/vim-markdown'
"  Plug 'vim-scripts/fountain.vim'
""  Plug 'ap/vim-css-color'			   " Color previews for CSS
""  Plug 'vim-scripts/AutoComplPop'	   " auto completion plugin
""  Plug 'itchyny/lightline.vim'		  " Lightline statusbar
""  Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
""  Plug 'arcticicestudio/nord-vim'
""  Plug 'neoclide/coc.nvim', {'branch': 'release'}
""  Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
""  Plug 'mcchrish/nnn.vim'

"" }}}

autocmd FileType make 
	\ set shiftwidth=4 tabstop=4 softtabstop=4

autocmd FileType c 
	\ set shiftwidth=8 tabstop=8 softtabstop=8

autocmd FileType asm 
	\ set shiftwidth=8 softtabstop=8 syntax=nasm

autocmd FileType vim,lua,nginx,sh 
	\ set shiftwidth=4 tabstop=4 softtabstop=4

autocmd FileType python,rmd,sent,markdown,latex
	\ set expandtab shiftwidth=4 tabstop=4 softtabstop=4

" extra whitespace
au BufRead,BufNewFile *
	\ match BadWhitespace /\s\+$/
highlight BadWhitespace ctermbg=NONE ctermfg=red cterm=underline

" linter
hi! SyntasticError        ctermfg=black      ctermbg=darkred    cterm=NONE
hi! SyntasticErrorSign    ctermfg=darkred    ctermbg=NONE       cterm=NONE
hi! SyntasticWarning      ctermfg=black      ctermbg=darkyellow cterm=NONE
hi! SyntasticWarningSign  ctermfg=darkyellow ctermbg=NONE       cterm=NONE
hi! SyntasticStyleError   ctermfg=red        ctermbg=NONE       cterm=NONE
hi! SyntasticStyleWarning ctermfg=blue       ctermbg=NONE       cterm=NONE
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%#errormsg#
"set statusline+=%*
let g:syntastic_error_symbol = '=>'
let g:syntastic_warning_symbol = '->'
let g:syntastic_style_error_symbol = '~>'
let g:syntastic_style_warning_symbol = '~>'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_balloons = 0
"	au FileType sh let b:syntastic_checkers = ["checkbashisms"]

" auto complation
set complete+=i
set complete+=d
set complete+=kspell
set completeopt=menuone,popup,noinsert  " always show popup menu
"set completeopt+=menuone
"set completeopt+=noinsert
let g:mucomplete#completion_delay = 0
autocmd FileType c,cpp,java 
		\set formatoptions+=ro
autocmd FileType c,cpp 
		\set omnifunc=ccomplete#Complete

" Terminal event
au TerminalWinOpen *
	\:setlocal signcolumn=no nonu noru
	\:hi! Normal ctermbg=NONE guibg=NONE
" au WinClosed *
" 	\ hi! Normal ctermbg=NONE
