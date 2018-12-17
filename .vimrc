"*****************************************************************************
                        " VIMRC
"*****************************************************************************
set nocompatible
filetype plugin on 


"*****************************************************************************
                        " PLUGIN MANAGEMENT
"*****************************************************************************
call plug#begin('~/.vim/plugins')

Plug 'Valloric/YouCompleteMe'
Plug 'junegunn/vim-easy-align'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
" Plug 'tpope/vim-eunuch', {'on': 'EunuchToggle'}
Plug 'tpope/vim-commentary'
" Plug 'tpope/vim-vinegar', {'on': 'VinegarToggle'}
" Plug 'terryma/vim-multiple-cursors', {'on': 'VMC-toggle'}
" Plug 'easymotion/vim-easymotion', {'on': 'EMToggle'}
" Plug 'vimwiki/vimwiki'
Plug 'vim-syntastic/syntastic'
" Plug 'Townk/vim-autoclose'
" Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'ervandew/supertab'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/goyo.vim', {'on': 'Goyo'}
" Plug 'nathanaelkane/vim-indent-guides'
" Plug 'lilydjwg/colorizer'
Plug 'SirVer/ultisnips'
Plug 'michaeljsmith/vim-indent-object'
" Plug 'WolfgangMehner/c-support'
Plug 'junegunn/fzf',
Plug 'flazz/vim-colorschemes'
Plug 'majutsushi/tagbar'
Plug 'tell-k/vim-autopep8'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'arcticicestudio/nord-vim'
" Plug 'honza/vim-snippets'

" Powerline setup from pip installation
" python3 from powerline.vim import setup as powerline_setup
" python3 powerline_setup()
" python3 del powerline_setup

call plug#end()
"*****************************************************************************


"*****************************************************************************
                        " NATIVE OPTIONS
"*****************************************************************************
syntax on 
set t_Co=256
set background=dark
let g:solarized_termcolors=256
let g:solarized_contrast="high"
colorscheme nord
hi Search term=reverse cterm=reverse guibg=Grey
hi Visual term=reverse cterm=reverse guibg=Grey
set backspace=indent,eol,start
set autoindent
set nobackup
set history=50
set ruler
set showcmd
set incsearch
set hlsearch
set noacd
set ws
set magic
set ignorecase
set wrap
set linebreak "break line at words
set nolist "list breaks linebreak
set noshiftround
set scrolloff=5 "2 lines above/below cursor when scrolling
set nrformats-=octal
set noswapfile "no swaps
set wildmenu
set scs
set number
set swb=newtab
set mouse=a
set more 
set confirm
set clipboard=unnamed
set complete=.,w,b,u,i,t
set matchpairs=(:),{:},[:]
set tabstop=4
set shiftwidth=4
set sta
set softtabstop=4
set expandtab
set cindent
set cinkeys=0{,0},0),:,0#,!^F,o,0,e
set cinwords=if,else,while,do,for,switch
set indentkeys=if,else,while,do,for,switch
set noci
set modelines=0
set endofline
set fixendofline
set laststatus=2
set write
set writebackup
set autowrite
set tags=~/.vim;~/.tags
set encoding=utf-8
set timeoutlen=500
set ttimeoutlen=500

set path=.,/usr/include,/usr/include/sys/,/usr/include/linux/,/usr/include/gnu/,/usr/include/misc,/usr/include/,/usr/lib/gcc/x86_64-redhat-linux/8/include/,,
"clear search highlight
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

"delete comment character when joining commented lines
if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j 
endif
"*****************************************************************************


"*****************************************************************************
                       " MAPPINGS
"*****************************************************************************
let mapleader = ',,'
let maplocalleader = '\\'

"clears the previous search's highlights
nnoremap<silent> <CR> :nohlsearch<CR><CR>

"swap line with below 
noremap <leader>j ddkP

"select word visually
nnoremap <leader><space> viw

"delete line in insert mode 
inoremap <leader><c-d> <esc>ddi

"convert word to uppercase in insert mode
inoremap <leader><c-u> <esc>viwUi

"convert word to uppercase in normal mode 
nnoremap <leader><c-u> <esc>viwU<esc>

"open vimrc in a split for quick edit
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

"source the vimscript 
nnoremap <leader>sv :source $MYVIMRC<cr>

"move to beginning of line in normal mode 
nnoremap <leader>bl 0

"move to end of line in normal mode 
nnoremap <leader>el $

"fighting carpal tunnel, one mapping at a time
inoremap jk <esc>
vnoremap jk <esc>

"insert line below in normal mode 
nnoremap <leader>ilb o<esc>

"insert line above in normal mode 
nnoremap <leader>ila O<esc>

"sane C-style function brackets
nnoremap <leader>ifb i{<Enter>}<esc>O<tab> 

"change half-page scrolls to avoid <c-b> conflict with tmux
nnoremap <c-n> <c-f>
nnoremap <c-p> <c-b>

"format paste to match surrounding indentation
"this one pastes after the text, ala p
 nnoremap fp ]p

"this one pastes before the text, ala P
nnoremap FP ]P

"strip spcs from a token
"cursor must be on token in question
nnoremap sw hxlx

" insert c function comment 
nnoremap <leader>cfc i/*******************************************************************************<cr><bs>******************************************************************************/<esc>ko

inoremap <leader>cfc /*******************************************************************************<cr><bs>******************************************************************************/<esc>ko
"TODO: delete surrounding punctuation AND contents


"~~~YCM MAPPINGS~~~
"MNENOMICS: gt for 'go-to' commands; G for 'get' commands

"smart GoTo; ycm will perform the most sensible GoTo operation given the context
nnoremap <leader>gt :YcmCompleter GoTo<CR>

"fast-smart GoTo; doesn't recompile file. risky in big codebases
nnoremap <leader>gti :YcmCompleter GoToImprecise<CR>

"look up symbol under the cursor and jump to its declaration
nnoremap <leader>gtd :YcmCompleter GoToDeclaration<CR>

"look up the symbol under the cursor and jump to its definition
nnoremap <leader>gtD :YcmCompleter GoToDefinition<CR>

"attempts to find all of the project's references to the identifier under the
"cursor. populates a quickfix list with the locations of the identifier
nnoremap <leader>gtr :YcmCompleter GoToReferences<CR>

"echoes the type of the variable or method under the cursor 
"and its derived type
nnoremap <leader>Gt :YcmCompleter GetType<CR>

"same as GetType, but imprecise (in the same vein as GoToImprecise), i.e. no
"recompiling so it is much faster, but dangerous on large, complex codebases
nnoremap <leader>Gti :YcmCompleter GetTypeImprecise<CR>

"GetDoc subcommand. The preview window displays quick info about the
"identifier under the cursor.
nnoremap <leader>Gd :YcmCompleter GetDoc<CR>

"Imprecise GetDoc command. Probably more useful than standard GetDoc
nnoremap <leader>Gdi :YcmCompleter GetDocImprecise<CR>

" write as super user 
cmap w!! w !sudo tee > /dev/null %
" ***IABBREVS***
iabbrev and  and 
iabbrev waht what
iabbrev tehn then
iabbrev @@ boydb91@outlook.com
iabbrev ccopy Copyright 2018 Brian Boyd, all rights reserved

"*****************************************************************************


"*****************************************************************************
                        " AUTOCMDS
"*****************************************************************************
"TODO
"*****************************************************************************


"*****************************************************************************
                        " PLUGIN CONFIGURATIONS
"*****************************************************************************
" ***SUPERTAB CONFIG***
"let g:SuperTabDefaultCompletionType="context"


" ***AIRLINE CONFIG***
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif

let g:airline_symbols.space = "\ua0"
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'
" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = '|'
let g:airline#extensions#syntastic#enabled = 1 

let g:airline_theme='nord'
" ***PYTHON-SYNTAX CONFIG***
" let g:python_hightlight_all = 1


" ***SUPERTAB CONFIG***
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:SuperTabCrMapping = 0


" ***ULTISNIPS CONFIG***
let g:UltiSnipsExpandTrigger = "<c-j>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardsTrigger = "<s-tab>"


" ***YCM CONFIG***
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

" ***EASYALIGN CONFIG***
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <leader><Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap <leader>ea <Plug>(EasyAlign)

" ***POWERLINE CONFIG***
" let g:powerline_pycmd="py3"
" let g:powerline_pyeval="py3eval"
"*****************************************************************************

