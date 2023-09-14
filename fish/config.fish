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

nvm use latest >> /dev/null # puts npm in path, and b quiet

# PATH fuckery
set PATH $PATH $HOME/.local/bin
set PATH $PATH $HOME/.cargo/bin

# pnpm is our fast friend https://pnpm.io/
set PNPM_HOME /home/thor/.local/share/pnpm
set PATH $PNPM_HOME $PATH

source $HOME/.files/fish/abbr.fish
source $HOME/.files/fish/bind.fish

# pnpm
# -g: global, make variable available outside this session
# -x: export the variable, making available to child processes
set -gx PNPM_HOME "/home/thor/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end

# sagemath (maybe unnecessary)
set -gx PYTHONPATH /usr/lib/python3/dist-packages/sage $PYTHONPATH

# set shell
set -gx SHELL 'usr/bin/fish'

# store selected editor or it dirties home env
set -gx SELECTED_EDITOR /usr/bin/vim.gtk3

set -gx MANPAGER sh -c 'col -bx | bat -l man -p'
# set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"
