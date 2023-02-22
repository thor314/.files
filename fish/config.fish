if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Overwrite default greeting
function fish_greeting 
    echo "hello Thor" 
end

gpg -qd "$HOME/.private/secrets.gpg" | source

setxkbmap dvorak -option ctrl:nocaps
if test (hostname) = "starchy" 
  # default is TERM=alacritty; this fixes weird input bugs with alacritty
  set TERM xterm-256color 
end

set ZELLIJ_AUTO_ATTACH true # attach to the any pre-existing sessions
#eval "$(zellij setup --generate-auto-start zsh)" # uncomment to run zj at start

# bug: doesn't appear to change the output of `jupyter --config-dir`
# https://docs.jupyter.org/en/latest/use/jupyter-directories.html
set -g JUPYTER_CONFIG_DIR "$HOME/.files/jupyter"

# nvm use 19.2.0 >> /dev/null # puts npm in path, and b quiet

# PATH fuckery
set PATH $PATH $HOME/.local/bin

# pnpm is our fast friend https://pnpm.io/
set PNPM_HOME /home/thor/.local/share/pnpm
set PATH $PNPM_HOME $PATH

source $HOME/.files/fish/abbr.fish
source $HOME/.files/fish/bind.fish
