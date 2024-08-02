""" Thor's vimrc
" Sets Keybindings, Settings, Plugins, and Language defaults, in that order. Attempt to be well-documented.
" docs: https://vimhelp.org/quickref.txt.html
" vim docs: https://neovim.io/doc/user/usr_toc.html#user-manual
" vim docs index: https://neovim.io/doc/user/index.html
" neovim FAQ: https://github.com/neovim/neovim/wiki/FAQ
" todo: try https://vim-bootstrap.com

" https://github.com/khaveesh/vim-fish-syntax
" Vim needs a more POSIX compatible shell than fish for certain functionality to work, such as :%!, 
" compressed help pages and many third-party plugins. If you use fish as your login shell, 
" you need to set shell to something else in your vimrc, for example:
if &shell =~# 'fish$'
  set shell=sh
endif

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

call plug#begin()             
  " List the plugins to install
  " Left sidebar file tree. https://github.com/preservim/nerdtree
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } 
  " vim-surround - manipulate surrounding symbolics ergonomically https://github.com/tpope/vim-surround
  Plug 'tpope/vim-surround'     
  " gc gC operators for commenting lines https://github.com/tpope/vim-surround
  Plug 'tpope/vim-commentary'   
  " Create textobjects. https://github.com/kana/vim-textobj-user
  Plug 'kana/vim-textobj-user' 
  " use indentation level, e.g. ai, ii, aI,iI, as a noun https://github.com/michaeljsmith/vim-indent-object
  Plug 'michaeljsmith/vim-indent-object' 
  " motion inside camel/snake-case words w leader https://github.com/bkad/CamelCaseMotion
  Plug 'bkad/CamelCaseMotion'   
  " location jumping with s<char><char> (z in operator mode) https://github.com/justinmk/vim-sneak
  Plug 'justinmk/vim-sneak'     
  " Show git diff in gutter. jump between changes with ]c, [c https://github.com/airblade/vim-gitgutter
  Plug 'airblade/vim-gitgutter'     
  " edit gpg encrypted files as normal https://github.com/jamessan/vim-gnupg
  Plug 'jamessan/vim-gnupg'     
  " vim fish systax highlighting support https://github.com/khaveesh/vim-fish-syntax
  Plug 'khaveesh/vim-fish-syntax'
  " vim justfile syntax highlighting: https://github.com/NoahTheDuke/vim-just 
  Plug 'NoahTheDuke/vim-just'

  "" Unused:
  " supercharged tab for completions https://github.com/ervandew/supertab
  " Plug 'ervandew/supertab'
  " syntax highlighting, completion, and errors in many languages https://github.com/dense-analysis/ale
  " Plug 'dense-analysis/ale'
  " Popular git interface. https://github.com/tpope/vim-fugitive
  " plug 'tpope/vim-fugitive'
  " Use fzf for search. https://github.com/junegunn/fzf.vim
  " Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  " Plug 'junegunn/fzf.vim'
  " Change the status-line. Not that much of a power-user yet, but could be useful for tabs. 
  " https://github.com/vim-airline/vim-airline
  " Plug 'vim-airline/vim-airline'
  " DEPRECATED: vim-fish; unmaintained, loading bugs
  " fish syntax highlighting https://github.com/dag/vim-fish/blob/master/README.md
  " Plug 'dag/vim-fish' 
call plug#end()

""" Keybindings
" docs: https://vimhelp.org/map.txt.html#mapping
" neovim keys: https://neovim.io/doc/user/quickref.html
" verbose docs: https://vim.fandom.com/wiki/Mapping_keys_in_Vim_-_Tutorial_(Part_1)
" Note that operators like d,g,c, etc. sometimes cannot be remapped.
"
let mapleader = " "

" for replacing OpenAI style \( \) with latex $
nmap <leader>r :%s/\\(\s\\|\s\\)/$/g<CR>
nmap <leader>R :%s/\\\[\s\\|\s\\\]/$$/g<CR>
map <C-a> ggVG
"map <A-a> 
"map <C-o>
"map <A-o>
map <silent> e <Plug>CamelCaseMotion_e
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
nmap t xhPl
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
" nmap < <<
" nmap > >>
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
" may be causing input bugs and weird stuff
" imap jj <Esc> 
" imap kk <Esc>
" imap jk <Esc>
" imap kj <Esc>
nmap <leader>j 10j
nmap <leader>k 10k
"map <C-j>
"map <A-j>
"map <C-k>
"map <A-k>
"map <C-x>
"map <A-x>
" use CamelCaseMotion plug to refine word boundaries
map <silent> w <Plug>CamelCaseMotion_w
"map <C-b>
"map <A-b>
" use CamelCaseMotion plug to refine word boundaries
map <silent> b <Plug>CamelCaseMotion_b
"map <C-w>
"map <A-w>
"map <C-v>
"map <A-v>
"map <C-z>
"map <A-z>
"map <C-[>
"map <A-[>
"map <C-]> " Ask nvim for help on a word, seems to depend on the buggy/non-existant vim tags file
"map <A-]>
" space
nmap <leader><Space> :w<CR>
"" F-keys
nnoremap <F3> :NERDTreeToggle<CR>
"" Experiments:
" nmap <A-<BS>> vbd " no, bug
" ergonomic macro button
" nnoremap Q q@ " bug
" nnoremap q @@ " bug

" 2024-02-07 
" clipboard issues, workaround use this function (thanks chatGPT)
" Define a function to yank text using xclip. 
" testing pending
function! YankToXclip()
  let l:save_unnamed_register = @"
  if mode() == "v"
    " In visual mode, yank selected text
    normal! `<v`>y
  elseif mode() == "n"
    " In normal mode, yank the current line
    normal! yy
  endif
  let @+=@0
  let @"=l:save_unnamed_register
  call system('xclip -selection clipboard', @0)
endfunction
nnoremap <leader>y :call YankToXclip()<CR>
vnoremap <leader>y :call YankToXclip()<CR>

""" Settings 
" Search following list of options, or type `:help <option>`: https://vimhelp.org/options.txt.html
" Ref: https://www.freecodecamp.org/news/vimrc-configuration-guide-customize-your-vim-editor/
" neovim defaults: https://neovim.io/doc/user/vim_diff.html#nvim-defaults
" 
"" Misc
set clipboard=unnamedplus  " Use the + register (system clipboard) by default
set nocompatible      " Disable compatibility with old vi, avoid issues 
set hidden            " Allow hidden buffers, don't limit to 1 file per window/split
set nobackup          " Do not save backup files.

"" Appearance and Syntax Highlighting
syntax on             " Turn syntax highlighting on.
filetype on           " Enable type file detection. Vim will try to detect the type of file in use.
filetype plugin on    " Enable plugins and load plugin for the detected file type.
filetype indent on    " Load an indent file for the detected file type.
set cursorline        " Uncomment to highlight respectively, current row, current column.
" set cursorcolumn      " highlight column. warning, can be visually noisy.
" colors: 0,8,16,56,60,61,darkmagenta seem ok
" will turn the cursor column light purple
highlight CursorColumn ctermbg=61 
" highlight CursorLine ctermbg=61 
set shiftwidth=2      " <,> shift keys
set tabstop=2         " tab width
set expandtab         " spaces > tabs
set smartindent     	" Enable smart-indent - return keeps indentation level. May cause comment indentation bugs in fish?
set smarttab	        " Enable smart-tabs
set nonumber          " Comment out to remove line-numbers
" set linebreak       " Hard break at `text-width`, at prior `showbreak` char. Prefer a formatter for this.
set textwidth=120     " see linebreak
" set nowrap          " allow line to render far right as it goes, don't wrap-around
set showbreak="↩"     " when `wrap` is set, define the character to show at the wrap point:
set visualbell        " use visual bell instead of beeps
set scrolloff=1       " Do not let cursor scroll below or above N number of lines when scrolling.
set showcmd           " Show partial command you type in the last line of the screen.
set showmode          " Show the mode you are on the last line.
" Supercharged statusline:
set statusline+=\ %F\ %M\ %Y\ %R " Left
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
set wildmode=list:longest " Make wildmenu behave like similar to Bash completion.

" There are certain files that we would never want to edit with Vim. Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
" Have nerdtree ignore certain files and directories.
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']

" source: https://breuer.dev/blog/top-neovim-plugins
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

nnoremap <silent> <C-h> :call WinMove('h')<CR>
nnoremap <silent> <C-j> :call WinMove('j')<CR>
nnoremap <silent> <C-k> :call WinMove('k')<CR>
nnoremap <silent> <C-l> :call WinMove('l')<CR>
" required by bkad/CamelCaseMotion; sets leader<move> to camel-equiv. Example of without leader:
" map <silent> w <Plug>CamelCaseMotion_w
let g:camelcasemotion_key = '<leader>'

"nmap <C-/> gcc " nope
"vmap <C-/> gcc " nope

""" Filetype-specific
"" Fish
" 2024-01-26 deny comment indentation bug
autocmd Filetype fish set nosmartindent
autocmd Filetype fish set cindent
autocmd Filetype fish set cinkeys-=0# " deny hashtag jump to start of line
autocmd Filetype fish setlocal tabstop=2 shiftwidth=2 expandtab

"" HTML
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab

"" Rust
" autocmd Filetype rs setlocal tabstop=4 shiftwidth=4 expandtab

""" Graveyard
" Bug: seems to not select buffer.
" provide ae and ie, to select entire buffer contents. depends on above. https://github.com/kana/vim-textobj-entire
"Plug 'kana/vim-textobj-entire' 
