" Plugins
call plug#begin('~/.config/nvim/plugged')
    Plug 'tomasiser/vim-code-dark'          " VS Code theme
    Plug 'vim-airline/vim-airline'          " Improved status bar
    Plug 'tpope/vim-commentary'             " Selection commenting
    Plug 'windwp/nvim-autopairs'            " Pair delimiters

    " LSP
    Plug 'neovim/nvim-lspconfig'
    Plug 'williamboman/mason.nvim'
    Plug 'williamboman/mason-lspconfig.nvim'

    " Autocompletion
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-vsnip'
    Plug 'hrsh7th/vim-vsnip'
call plug#end()

" Basics
filetype on
filetype plugin on
filetype indent on
set nocompatible
 syntax on 
set number              " Show line number
set directory^=$HOME/.cache/nvim//

" Cursor settings
set cursorline
hi clear CursorLine
hi CursorLine ctermbg=236
hi clear CursorLineNR
hi CursorLineNR ctermbg=236

" Match paren
let g:matchparen_timeout = 20
let g:matchparen_insert_timeout = 20

" Indentation
set expandtab           " Use spaces instead of tabs
set tabstop=4           " Use four spaces in a tab
set shiftwidth=4        " Number of spaces
set smartindent         " Use smart indentation
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o  " Disable new line comment

" Searching
set ignorecase          " Non case-sensitive searches
set smartcase           " Pattern is case sensitive if uppercase
set hlsearch            " Automatically highlight

set showcmd
set showmode
set showmatch
set history=500
set list
set lcs+=space:·
set mousehide

" Performance
set ttyfast
set lazyredraw
set timeoutlen=1000
set foldmethod=manual
set ttimeoutlen=0

" Plugin options
let g:SuperTabDefaultCompletionType = "<c-n>"   " SupeTab from top to bottom
source ~/.config/nvim/lua_init.lua

" vim-airline
let g:airline_theme = 'codedark'
let g:airline_powerline_fonts = 1

" Theming
source ~/.config/nvim/cool.vim
