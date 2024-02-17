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
source ~/.config/nvim/lua_init.lua
source /usr/share/doc/fzf/examples/fzf.vim
autocmd! User GoyoLeave nested | colorscheme cool | set nospell
