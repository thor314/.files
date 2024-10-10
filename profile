# TK: this file is run on login, but not for subsequent terminal creation.
# Generally used to set up global env variables at login, FOR ALL LOGIN SHELLS.
# eg: https://www.unix.com/unix-for-advanced-and-expert-users/5477-looking-profile-examples.html
# This file is not read by bash, if ~/.bash_profile or ~/.bash_login exists.
export PROFILE_TEST="2024-01-11"

 # X # X # X # X # X 
# X # # PATH  # # X #
 # X # X # X # X # X
export GOPATH="$HOME/go"
export GOROOT=/usr/local/go
PATH="$PATH:$HOME/.local/bin:$HOME/.share/bin" # misc+python binaries
PATH="$PATH:$GOPATH/bin:$GOROOT/bin" # golang
PATH="$PATH:$HOME/.cargo/bin:$HOME/.cargo/bin/bat-extras/bin" # rust
PATH="$PATH:$HOME/.elan/bin" # lean-lang
PATH="$PATH:$PNPM_HOME" # pnpm - fast npm substitute
export PATH
export PNPM_HOME="$HOME/.local/share/pnpm"
export PYTHONPATH="$PYTHONPATH:/usr/lib/python3/dist-packages/sage"
# 2024 - no path is repeated, except snap, which may be a bug with installation. We can live with it.

# other environment var settings to set across *all* login shells
export SELECTED_EDITOR="/usr/bin/vim.gtk3"

# set in user settings and here, for extra sanity
setxkbmap dvorak -option caps:ctrl_modifier 

# #########
 # ARCHIVE #
# #########
# keyboard set - 2024-10-11 - stop deduplication, deprecation pending
# configure shell with cargo stuff - 2024-01-11 - is this only necessary for install? haven't needed since
# source "$HOME/.cargo/env" 

## Zsh - deprecated 2022
# fpath+="$HOME/.zsh.d/zsh_functions" # alacritty completions
# export ZDOTDIR="$HOME/.zsh.d" 

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
# umask 022
# . "$HOME/.cargo/env"

export PATH="$HOME/.elan/bin:$PATH"
