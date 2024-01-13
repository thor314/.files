# My dotfiles, organized with [dotbot](https://github.com/anishathalye/dotbot)
## Get all the dotfiles:
- `pip3 install dotbot`
- `git clone github.com/thor314/dotfiles.git && cd .dotfiles && dotbot -c install.conf.yaml`

## Add new dotfiles:
```fish
function makedotfile
  set DOTPATH $argv[1]
  set DOTNAME (cut --delimiter="/" 
# move the dotfile
  mv $DOTPATH "~/.files"
# add a symlink instruction
  vi ~/.files/install.conf.yaml
# run dotbot
end
```

## Put a dotfile back
remove the symlink
move the dotfile back and ro
Remove a dotfile:

remove the file and wherever its symlink lives

## What about files in my root directory?
`dotbot` can't update symlinks in my root directory unless run with sudo. So be careful about that. 


