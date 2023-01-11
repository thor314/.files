" Thor's vimrc
" Sets Keybindings, Settings, Plugins, and Language defaults, in that order. Attempt to be well-documented.
" Docs: https://vimhelp.org/quickref.txt.html
"
""" Keybindings
" Docs 1: https://vimhelp.org/map.txt.html#mapping
" Docs 2: https://vim.fandom.com/wiki/Mapping_keys_in_Vim_-_Tutorial_(Part_1)
" Note that operators like d,g,c, etc. sometimes cannot be remapped.
map <C-a> ggVG
"map <A-a> 
"map <C-o>
"map <A-o>
"map <C-e>
"map <A-e>
nmap U :redo<CR>
"map <C-u> " up
"map <A-u> 
"map <C-i> " back
"map <A-i> " todo: increment?
"map <C-d> "down
nmap <A-d> yyp
noremap H ^
"map <C-h> " backspace; replace
"map <A-h>
"nmap <leader>h " todo: goto left split
nmap <leader><A-h> :set hlsearch<CR>
nmap <leader><A-H> :set nohlsearch<CR>
nmap t xhhpll
nmap T ~
"map <C-t>
"map <A-t>
noremap n nzz " Center when searching
noremap N Nzz
"map <C-n>
"map <A-n>
"map <C-s>
"map <A-s> " unsure, some weird ex-command
"map -/_  " (prev) line start
"map <C--> " Alacritty: smaller
"map <A--> " unsure, some weird ex-command
"map <C-'>
"map <A-'>
"map <C-,> " todo: open config
map <A-,> <C-o>
"map <C-.>
map <A-.> <C-i>
"map <C-p>
"map <A-p>
"map <C-y>
"map <A-y>
"map <C-f> " forward
"map <A-f>
"map <C-g>
"map <A-g>
"map <C-c> " exit
"map <A-c>
vmap <C-r> :s/
"map <C-r> " todo: search/replace
"map <A-r>
noremap L $
"map <C-l>
"map <A-l>
"map <C-/> " todo: toggle comments
"map <A-/>
"map <C-=>
"map <A-=>
"map <C-\>
"map <A-\>
"map <C-;>
"map <A-;>
" todo: fix macros (see experiments)
nmap <leader>q :wq<CR>
"map <C-q>
"map <A-q>
imap jj <Esc> 
imap kk <Esc>
imap jk <Esc>
imap kj <Esc>
nmap <leader>j 10j
nmap <leader>k 10k
"map <C-j>
"map <A-j>
"map <C-k>
"map <A-k>
"map <C-x>
"map <A-x>
"map <C-b>
"map <A-b>
"map <C-w>
"map <A-w>
"map <C-v>
"map <A-v>
"map <C-z>
"map <A-z>
"map <C-[>
"map <A-[>
"map <C-]>
"map <A-]>
" space
nmap <Space> <leader>
nmap <leader><Space> :w<CR>
"" F-keys
nnoremap <F3> :NERDTreeToggle<CR>

"" Experiments:
" nmap <A-<BS>> vbd " no, bug
" ergonomic macro button
" nnoremap Q q@ " bug
" nnoremap q @@ " bug


""" Settings 
" Search following list of options, or type `:help <option>`: https://vimhelp.org/options.txt.html
" Ref: https://www.freecodecamp.org/news/vimrc-configuration-guide-customize-your-vim-editor/
" 
"" Misc
set clipboard=unnamedplus " set default yank register to system clipboard
set nocompatible      " Disable compatibility with old vi, avoid issues 
set hidden            " Allow hidden buffers, don't limit to 1 file per window/split
set nobackup          " Do not save backup files.

"" Appearance and Syntax Highlighting
syntax on             " Turn syntax highlighting on.
filetype on           " Enable type file detection. Vim will try to detect the type of file in use.
filetype plugin on    " Enable plugins and load plugin for the detected file type.
filetype indent on    " Load an indent file for the detected file type.
set cursorline        " Uncomment to highlight respectively, current row, current column.
" set cursorcolumn      " highlight column. warning, annoying.
set shiftwidth=2      " <,> shift keys
set tabstop=2         " tab width
set expandtab         " spaces > tabs
set smartindent     	" Enable smart-indent
set smarttab	        " Enable smart-tabs
set number            " Comment out to remove line-numbers
set linebreak         " Break at `text-width`, at prior `showbreak` char
set showbreak=" "
set textwidth=120
" set nowrap            " allow line to extend as far as it goes, don't wrap-around
set visualbell        " use visual bell instead of beeps
set scrolloff=1       " Do not let cursor scroll below or above N number of lines when scrolling.
set showcmd           " Show partial command you type in the last line of the screen.
set showmode          " Show the mode you are on the last line.
" Supercharged statusline:
set statusline+=\ %F\ %M\ %Y\ %R " Left
set statusline+=%= " Use a divider to separate the left side from the right side.
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%  " Status line right side.
set laststatus=2 " Show the status on the second to last line.

"" Search
set incsearch         " While searching though a file incrementally highlight matching characters as you type.
set smartcase         " Search: use smart-case matching
" set ignorecase      " Ignore capital letters during search.
set showmatch         " Show matching words/braces during a search.
set hlsearch          " highlighting when doing a search.
set history=1000      " Set the commands to save in history default=20.
set backspace=indent,eol,start	" Backspace behaviour
set wildmenu          " Enable auto completion menu after pressing TAB.
set wildmode=list:longest " Make wildmenu behave like similar to Bash completion.

" There are certain files that we would never want to edit with Vim. Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
" Have nerdtree ignore certain files and directories.
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']

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

call plug#begin()             " List the plugins to install
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } " nerdtree file manager
Plug 'tpope/vim-surround'     " vim-surround - manipulate surrounding symbolics ergonomically
Plug 'tpope/vim-commentary'   " gc gC operators for commenting lines
" Plug 'kana/vim-textobj-entire' "provide ae and ie, to select entire buffer contents: bug, doesn't install?
Plug 'bkad/CamelCaseMotion'   " motion inside camel/snakecase words with leader
Plug 'justinmk/vim-sneak'     " location jumping with s (z in operator mode)
Plug 'michaeljsmith/vim-indent-object' " use indentation level as a noun
Plug 'jamessan/vim-gnupg'     " plugin for editing gpg encrypted files
call plug#end()

""" Filetype-specific
"" HTML
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab

"" Rust
autocmd Filetype rs setlocal tabstop=4 shiftwidth=4 expandtab

"" Python
autocmd Filetype rs setlocal tabstop=4 shiftwidth=4 expandtab

""" Graveyard
" use default mappings;; 2023-01-10 what the fuck is this
" let g:camelcasemotion_key = '<leader>'

