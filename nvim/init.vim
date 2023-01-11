""" Thor's neovim configuration file
" neovim docs: https://neovim.io/doc/user/index.html
" prefer to keep nvim-specific config here, and vim general config in .vimrc
py3do return "%s\t%d" % (line[::-1], len(line))
""" Settings
"" Load default vim configuration:
" https://neovim.io/doc/user/nvim.html#nvim-from-vim
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

""" Graveyard
" Use "true-color" in the terminal; nvm ugly https://github.com/neovim/neovim/wiki/FAQ
" set termguicolors
