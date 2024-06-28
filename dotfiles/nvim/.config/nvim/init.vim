set termguicolors

autocmd FileType markdown,text setlocal spell

augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
:  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
:augroup END

" Bindings
nnoremap <Space> <NOP>
let mapleader =" "      " Set leader to spacebar
map <leader>g :Goyo \| set spell \| set linebreak<CR>
map <leader>z : silent execute '!zathura %:r.pdf & '
map <leader>m : silent! execute "!pandoc -s -o %:r.tex % &" <bar> : execute "!pdflatex %:r.tex >/dev/null 2>&1" 


source ~/.config/nvim/lua_init.lua
source /usr/share/doc/fzf/examples/fzf.vim
autocmd! User GoyoLeave nested | colorscheme cool | set nospell
autocmd BufWritePost *.tex silent! execute "!pdflatex % >/dev/null 2>&1" | redraw!

