" Ref: https://neovim.io/doc/user/starting.html#init.vim

" https://neovim.io/doc/user/nvim.html#nvim-from-vim
" Load default vim configuration:
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
