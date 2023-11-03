" Main Settings:
""""""""""""""""
" set number                       " show numbers in the left
" set nowrap                       " disable line wraping

set nocp                         " disable vi compatiblities
if version >= 600                " check the vim version
	filetype plugin indent on    " enable finding file type
endif
syntax enable                    " colorful texts
"" Popup Menu:
set wildmenu                     " enable
set wildmode=longest:list,full   " popup style
" set wildmode=lastused:full       " popup style
" set wildmode=list:full           " popup style
set showcmd              " show enterd key
set showmode             " diable showing mode in the old way
set autochdir            " change current dir to file's dir
set showmatch            " show match brackets, parantesies, etc..

"" tab settings
set tabstop=4            " tap size in this case is (4)
set shiftwidth=4         " -
set softtabstop=4        " -
set noexpandtab          " insert actual tab

set autoindent           " enable line indentaion
set smartindent          " -
set cindent              " -

set encoding=utf-8       " set encoding to utf-8

set hlsearch             " enable search highlighting
set incsearch            " incerimental search highlighting

set bs=2                 " makes the backspace work functinal

" set clipboard=unnamed         " set clipboard register to system clipboard
" set clipboard=unnamedplus     " -

" set mouse=a                   " enable mouse function

set noswapfile                " disable swapfile
set nobackup                  " disable auto-backup

set scrolloff=5               " start srolling from 5 lines to the end

set t_Co=256                  " set vim to use 256 colors
set background=dark           " use the dark theme

" set cursorcolumn              " highlight the cursor horizontally
set cursorline                " highlight the cursor vertically
set colorcolumn=80            " set the horizontal max column char
set signcolumn=yes

set updatetime=80             " update / reload time

" show qss highlighting like css:
au BufRead,BufNewFile *.qss set filetype=css
" show xml highlighting like html:
au BufRead,BufNewFile *.xml set filetype=html
" show vifm/vi  highlighting like vim:
au BufRead,BufNewFile *.vifm set filetype=vim
" au BufRead,BufNewFile *.vi set filetype=vim
au BufRead,BufNewFile *.h set filetype=c

" auto comment and uncomment with - and +
autocmd FileType sh,ruby,python,conf,make,yaml,zsh,csh,toml,rmd 
	\ let b:comment_leader = '#'
autocmd FileType c,cpp,java,scala,json 
	\ let b:comment_leader = '//'
autocmd FileType vim,vifm             let b:comment_leader = '"'
autocmd FileType haskell,lua          let b:comment_leader = '--'
autocmd FileType tex,plaintex         let b:comment_leader = '%'
autocmd FileType nroff                let b:comment_leader = '\"'

" split char
set fillchars+=vert:\|
" set fillchars+=vert:\¦|│

" spell check
set spelllang=en_us,de

" keybinding

" code folding                " z-f   create
" set foldmethod=manual       " z-a   toggle
" set foldmethod=marker         " z-d   delete
set foldmethod=syntax         " z-d   delete
set foldenable                "" custom keybind:
set foldnestmax=15            " z-s   save
set foldlevel=0               " z-z   restore

" splits in the bottom/right
set splitbelow
set splitright

" show hidden characters (EOL, BOL, etc...)
if version >= 900              " check the vim version
	set hidden
	set list
	" set listchars=tab:¦\ ,lead:·,trail:⋅
	" set listchars=tab:›\ ,lead:·,trail:⋅
	set listchars=tab:›\ 
endif
