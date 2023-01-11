" Ref: https://neovim.io/doc/user/starting.html#init.vim

""" Settings

"" Load default vim configuration:
" https://neovim.io/doc/user/nvim.html#nvim-from-vim
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

""" Graveyard
" Use "true-color" in the terminal; nvm ugly https://github.com/neovim/neovim/wiki/FAQ
" set termguicolors
