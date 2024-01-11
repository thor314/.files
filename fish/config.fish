#!/usr/bin/fish
# Thor's fishy config
if status is-interactive
    # Commands to run in interactive sessions can go here
    # set shell to fish, don't set everywhere, we been warned that fish not POSIX so mebe breaks elsewhere
    set -gx SHELL 'usr/bin/fish'
    # Overwrite default greeting
    function fish_greeting 
        echo "hello Thor" 
    end
    
    # only need these for interactive sessions
    source $HOME/.files/fish/abbr.fish
    source $HOME/.files/fish/bind.fish
end

# load muh secret environment variables
gpg -qd "$HOME/.private/secrets.gpg" | source

# store selected editor or it dirties home env
set -gx SELECTED_EDITOR /usr/bin/vim.gtk3

# use bat to display man pages with syntax highlighting etc
set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"

# pnpm is our fast friend https://pnpm.io/
set -gx PNPM_HOME "/home/thor/.local/share/pnpm"

# bug: doesn't appear to change the output of `jupyter --config-dir`
# https://docs.jupyter.org/en/latest/use/jupyter-directories.html
set -g JUPYTER_CONFIG_DIR "$HOME/.files/jupyter"

 ##########################################################################
# PATH UPDATES SHOULD BE IN .profile THOR, WHAT ARE YOU DOING TO YOURSELF? #
 ########################################################################### 
# moved to profile
# #########
 # ARCHIVE #
# #########

# 2023-12-30 - experiment; silence warning "nvm: can't use node latest" warnings
# nvm use latest >> /dev/null # puts npm in path, and b quiet

# seems this only is required for setup, but only until .profile gets loaded correctly on re-login
# PATH fuckery
#set PATH $PATH $HOME/.local/bin
#set PATH $PATH $HOME/.cargo/bin

# ssh config? This was experiment for making git work in cron scripts, saving for posterity
# set -q SSH_AGENT_PID; or eval (ssh-agent -c)


