" Plugins
call plug#begin('~/.config/nvim/plugged')
    Plug 'tomasiser/vim-code-dark'              " VS Code theme
    Plug 'vim-airline/vim-airline'              " Improved status bar
    Plug 'tpope/vim-commentary'                 " Selection commenting
    Plug 'windwp/nvim-autopairs'                " Pair delimiters
    Plug 'lukas-reineke/indent-blankline.nvim'  " Indentation lines
    Plug 'junegunn/goyo.vim'                    " Comfortable formatting
    Plug 'dhruvasagar/vim-table-mode'           " Table rendering
    Plug 'nvim-tree/nvim-web-devicons'          " Icon pack
    Plug 'stevearc/oil.nvim'                    " File browser in buffer
    Plug 'vimwiki/vimwiki'                      " To-do lists and organization

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
filetype indent on      " Indent based on filetype
set nocompatible        " Ignore defaults
syntax on               " Use syntax highlighting
set directory^=$HOME/.cache/nvim//  " Set cache directory
set cursorline          " Use cursorline
set number              " Show line number

" Switch between relative and absolute
augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
:  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
:augroup END

" Bindings
nnoremap <Space> <NOP>
let mapleader =" "      " Set leader to spacebar
map <leader>g :Goyo \| set spell \| set linebreak<CR>
map <leader>p :PlugInstall<cr>

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
source /usr/share/doc/fzf/examples/fzf.vim

" Enable Goyo by default for mutt writing
autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo | set bg=light
autocmd BufRead,BufNewFile /tmp/neomutt* map ZZ :Goyo\|x!<CR>
autocmd BufRead,BufNewFile /tmp/neomutt* map ZQ :Goyo\|q!<CR>
autocmd! User GoyoLeave nested | colorscheme cool | set nospell
let g:goyo_width = 115

" vim-airline
let g:airline_theme = 'codedark'
let g:airline_powerline_fonts = 1

" Theming
source ~/.config/nvim/cool.vim
colorscheme cool
