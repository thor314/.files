# TK: this file is run on login, and by bash if .bash_profile doesn't exist.
# Generally used to set up env variables at login,
# eg: https://www.unix.com/unix-for-advanced-and-expert-users/5477-looking-profile-examples.html
#
# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022
export PROFILE_TEST=1 
export ZDOTDIR="$HOME/.zsh.d" # redundant

## PATH variables
export GOPATH="$HOME/go"
export GOROOT=/usr/local/go
fpath+="$HOME/.zsh.d/zsh_functions" # alacritty completions
PATH+=":$GOPATH/bin:$GOROOT/bin"
# export PATH

# if [[ $(hostname) == "starchy" ]]; then
#   # default isTERM=alacritty; this fixes weird input bugs with alacritty
#   TERM=xterm-256color 
# fi

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

## clean up my home directory
# mv {.bash_history,.bashrc,.lesshst,.sudo_as_admin_successful,.viminfo,.wget-hsts} tmp/bak

# configure shell with cargo commands 
source "$HOME/.cargo/env" 
# Please ser, may I have my keyboard
setxkbmap dvorak -option ctrl:swapcaps
