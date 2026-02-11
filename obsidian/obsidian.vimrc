""" Thor's Obsidian vimrc
" generally refer to: https://github.com/esm7/obsidian-vimrc-support
" To test file, write file and run "reload app without saving"
" 
" To use an Obsidian command (see back, forward example):
" - Use Ctrl+Shift+I to open the dev console
" - reload and type :obcommand. The names are now in the Console (2nd tab).
" - note, can't rebind exmap-obmap commands with map
" Also execute codemirror commands with cmcommand, js with jscommand.
"
" Note about `surround`: as of 2022-05-20, surround does not work, and is janky
" anyhow, but there's a fix coming, eventually, maybe.

""" General Vim Keybindings

" Undo, Redo, and Navigate inside page:
" Don't overwrite <C-u> or <C-d> for file movement, or <C-o>,<C-i> for back/forward movement within document. 
" <C-r> is for search-replace. u/U for undo/redo. Also Ctrl-z/Z native app.
nmap U :redo<CR>

" forgot what these were for 2024-11-10 
" vmap <C-r> :s/
" nmap <C-r> <C-a>:s/

" for replacing OpenAI style \( \) with latex $ ; last updated 2024-06-06 
" replace either \( or \) with maybe a trailing/leading space with '$'
nmap <leader>r :%s/(\\\(\s?|\s?\\\))/$/g<CR>

" replace either \[ or \] with double dollar sign--triple dollar sign not a typo
nmap <leader>R :%s/(\\\[\s|\s\\\])/$$$/g<CR>

" remove all struck through text or a selection of text
nmap <leader>s :%s/~~.*?~~//g<CR>
" vmap <leader>s :s/\~\~.*?\~\~//g<CR>

" i forget why i wrote these
" nmap <leader>l :%s/(\\\(|\\\))/$$$/g 
" nmap <leader>L :%s/(\\\[|\\\])/$$$/g

" This mapping repeats a mapping in the in-app hotkeys menu for demonstration; the in-app menu overwrites mappings here.
" note: this is how to do this if I want to do it from vim, but i have it set in obsidian now so no need to uncomment
"
" exmap back obcommand app:go-back
" nmap <A-,> :back<CR>
" exmap forward obcommand app:go-forward
" nmap <A-.> :forward<CR>

" enable select all with C-a
unmap <C-a>

" Must use map, not omap, to get these to work in visual mode
map H ^ 
map L $

" transpose, shift case
nmap <C-t> hxp 

" Example leader mapping, set 'Space' as leader
" may migrate to this if the Leader-Hotkeys normal-mode bug isn't fixed
nmap <Space> <leader>
nmap <leader>j 4j
nmap <leader>k 4k
nmap <leader>i <C-i>
nmap <leader>o <C-o>
nmap <leader>. :forward<CR>
nmap <leader>, :back<CR>

""" Settings
" Yank to system clipboard https://forum.obsidian.md/t/how-to-copy-with-vim-mode/3881
set clipboard=unnamed

" set tab size to something other than 4, note to that this should be mirror in editor::tab_size
" set tabstop=2

""" Trash
" - useless, not sure how to get rid of Obsidian's persistent search highlight, except hit esc every time
" nmap <F9> :nohl 
" set nohlsearch 
