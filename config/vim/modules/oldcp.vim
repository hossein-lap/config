"  _  _ ___    
" | || | __|   H
" | __ | _|    A
" |_||_|___|   P
"              
"
" Global Section {{{
" Makefile:
au FileType * nnoremap <localleader>cc :!make<CR>
au FileType * nnoremap <localleader>cx :!make force<CR>
" Git:
au FileType * nnoremap <localleader>gs :!git status -s<CR>
au FileType * nnoremap <localleader>gl :!git log --oneline --stat --graph --all<CR>
au FileType * nnoremap <localleader>ga :!git add %<CR>
au FileType * nnoremap <localleader>gc :!git commit<CR>
" }}}
"
" C++ section {{{
"" run via \fw
autocmd FileType cpp nnoremap <localleader>fe :term %:p:r<CR>
"" compile via \fe
autocmd FileType cpp nnoremap <localleader>fw :term g++ %:p -o %:p:r<CR>
"" compile and run via \fq
autocmd FileType cpp nnoremap <localleader>fq :term g++ -Wall %:p -o %:p:r<CR>
" }}}
" C section {{{
"" compile via \fe
autocmd FileType c nnoremap <localleader>fe :!gcc %:r.c -o %:r<CR>
"" run via \fw
autocmd FileType c nnoremap <localleader>fw :!./%:r<CR>
"" compile and run via \fq
autocmd FileType c nnoremap <localleader>fq :!gcc %:r.c && ./%:r<CR>
" }}}
"
" LaTeX section {{{
"" using pdflatex
"autocmd Filetype tex nnoremap <localleader>fe :!pdflatex %:r.tex<CR>
"" using XeLaTeX
autocmd Filetype tex nnoremap <localleader>fe :!xelatex %:r.tex<CR>
" }}}
" groff section {{{
"" mspdf macro to pdf
autocmd Filetype nroff nnoremap <localleader>fe :!groff -mspdf -Tpdf %:r.ms > %:r.pdf<CR>
" }}}
" markdown section {{{
"" markdown to pdf via pandoc
"autocmd Filetype markdown nnoremap <localleader>fe :!pandoc %:r.md -o %:r.pdf<CR>
autocmd Filetype markdown,vimwiki nnoremap <localleader>fe :!glow -p %<CR>
autocmd Filetype markdown,vimwiki nnoremap <localleader>fw :!mdp %<CR>
" }}}
" rmarkdown section {{{
"" markdown to pdf via pandoc
"autocmd Filetype markdown nnoremap <localleader>fe :!pandoc %:r.md -o %:r.pdf<CR>
autocmd Filetype rmd nnoremap <localleader>fe :!Rscript -e "rmarkdown::render('%')"<CR>
"autocmd Filetype rmd nnoremap <localleader>fw :!mdp %<CR>
" }}}
" sent section {{{
autocmd Filetype text nnoremap <localleader>fe :!sent -f 'Liberation Serif' % &<CR>
" }}}
"
"" folding section {{{
""" save via zs
"autocmd Filetype *  nnoremap zs :mkview<CR>  
""" restore via zr
"autocmd Filetype *  nnoremap zr :loadview<CR>
"" }}}
"
" execute Python programs {{{
autocmd FileType python nnoremap <localleader>fe :!python3 %:p<CR>
" }}}
" execute Lua programs {{{
autocmd FileType lua nnoremap <localleader>fe :!lua5.4 %:p<CR>
" }}}
"
" shell {{{
autocmd FileType sh nnoremap <localleader>fe :!bash %:p<CR>
autocmd FileType sh nnoremap <localleader>fw :!dash %:p<CR>
autocmd FileType csh nnoremap <localleader>fq :!tcsh %:p<CR>
" }}}

