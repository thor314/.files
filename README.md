# My dotfiles, organized with [dotbot](https://github.com/anishathalye/dotbot)
## Get all the dotfiles:
- `pip3 install dotbot`
- `git clone github.com/thor314/dotfiles.git && cd .dotfiles && dotbot -c install.conf.yaml`

## Add new dotfiles:
```sh
# put this in a zshrc function
mv "path/to/dotfile" "~./dotfiles/dotfile"
echo "    ~/.dotfile:" >> ~/.dotfiles/install.confqyaml
./install
# automate this in a cronjob
git add .
git commit -m "new dotfile message"
git push
````

## Remove a dotfile:
remove the file and wherever its symlink lives

## What about files in my root directory?
`dotbot` can't update symlinks in my root directory unless run with sudo. So be careful about that. 

