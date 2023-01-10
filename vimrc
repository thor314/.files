""" Thor's vimrc
" 
" Mainly does 2 things: install vim-plug, an extension manager, a couple
" extensions, and set some **sane defaults**, as copied from numerous places
" around the interwebs. DOCUMENT THOROUGHLY! I won't remember what these do.


""" Keybindings
" escapes if I forget to escape
imap jj <Esc> 
imap kk <Esc>
imap jk <Esc>
imap kj <Esc>

" Undo, Redo, and Navigate inside page:
" Don't overwrite <C-u> or <C-d> for file movement, or <C-o>,<C-i> for back/forward movement within document. 
" <C-r> is for search-replace. u/U for undo/redo. 
nmap U :redo
vmap <C-r> :s/

" ergonomic macro button
nmap ` @
nmap H ^
omap H ^
nmap L $
omap L $
nmap t xhhpll
nmap T dawbP

nmap <Space> <leader>
nmap <leader><Space> :w<CR>
nmap <leader>j 4j
nmap <leader>q :wq<CR>

""" Settings
""" ref: https://www.freecodecamp.org/news/vimrc-configuration-guide-customize-your-vim-editor/
""" Also see https://www.shortcutfoo.com/blog/top-50-vim-configuration-options/
"" Misc
set clipboard=unnamedplus " set default yank register to system clipboard
set nocompatible      " Disable compatibility with old vi, avoid issues 
set hidden            " Allow hidden buffers, don't limit to 1 file per window/split
"" Appearance and Syntax Highlighting
syntax on             " Turn syntax highlighting on.
filetype on           " Enable type file detection. Vim will try to detect the type of file in use.
filetype plugin on    " Enable plugins and load plugin for the detected file type.
filetype indent on    " Load an indent file for the detected file type.
set cursorline        " Uncomment to highlight respectively, current row, current column.
" set cursorcolumn      " highlight column. warning, annoying.
" Set shift width (<,> keys) and tab-width to 2 spaces; use spaces > tab indents.
set shiftwidth=4 " <,> shift keys
set tabstop=2
set expandtab
" Do not save backup files.
set nobackup
" Comment out to remove line-numbers
set number
" Break lines at word, at the space character, at 120-width. Hardwrap, don't allow scroll-off line. 
set linebreak
set showbreak=" "
set textwidth=120
" set nowrap - allow line to extend as far as it goes, don't wrap-around
" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=1
" use visual bell instead of beeps
set visualbell

""" Search
set incsearch " While searching though a file incrementally highlight matching characters as you type.
" Search: use smart matching
set smartcase
"set ignorecase - Ignore capital letters during search.
" Show partial command you type in the last line of the screen.
set showcmd
" Show the mode you are on the last line.
set showmode
" Show matching words/braces during a search.
set showmatch
" highlighting when doing a search.
set nohlsearch
" Set the commands to save in history default number is 20.
set history=1000
set smartindent	" Enable smart-indent
set smarttab	" Enable smart-tabs
set backspace=indent,eol,start	" Backspace behaviour
" Enable auto completion menu after pressing TAB.
set wildmenu
" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest
" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

""" Plugin Management
" ref: https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
" Install vim-plug plugin manager if not found on system
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" List the plugins to install
call plug#begin()
" nerdtree file manager, sparsely used
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } 
" vim-surround - manipulate surrounding symbolics ergonomically
Plug 'tpope/vim-surround'
" gc gC operators for commenting lines
Plug 'tpope/vim-commentary'
" provide ae and ie, to select entire buffer contents: bug, doesn't install?
" Plug 'kana/vim-textobj-entire'
" motion inside camel/snakecase words with leader
Plug 'bkad/CamelCaseMotion'
" location jumping with s (z in operator mode)
Plug 'justinmk/vim-sneak'
" use indentation level as a noun
Plug 'michaeljsmith/vim-indent-object'
" plugin for editing gpg encrypted files
Plug 'jamessan/vim-gnupg'
call plug#end()

""" Graveyard
" use default mappings;; 2023-01-10 what the fuck is this
" let g:camelcasemotion_key = '<leader>'

