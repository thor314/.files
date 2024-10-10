#!/usr/bin/fish
# Thor's config.fish

if status is-interactive
    # Commands to run in interactive sessions can go here
    # set shell to fish, don't set everywhere, we been warned that fish not POSIX so mebe breaks elsewhere
    set -gx SHELL usr/bin/fish

    # Overwrite default greeting
    function fish_greeting
        echo hello thor
    end

    # only need these for interactive sessions
    pushd $HOME/.files/fish
    source abbr.fish
    source bind.fish
    source functions.fish
    source git_helpers.fish
    source yazi.fish
    source rust_helpers.fish
    source web_helpers.fish
    source hackmd_helpers.fish
    for f in (ls $HOME/.files/fish/completions)
        source completions/$f
    end
    popd

    # default is TERM=alacritty; this fixes weird input bugs with alacritty
    if test (hostname) = starchy
        set TERM xterm-256color
    end

    tk-keychain ~/.ssh/id_ed25519 >/dev/null # avoid ssh-key issues

    # even if set elsewhere, to avoid capslock vscode bug, keep this line
    setxkbmap dvorak -option caps:ctrl_modifier

    # nvm install latest && 
    nvm use latest >>/dev/null # puts npm in path, and b quiet. May cause warnings if nvm path misconfigured. 
end

# load secret environment variables
gpg -qd "$HOME/.private/no-sync/secrets.gpg" | source

# # # ## ##### ## # # #
# ENVIRONMENT VARIABLES #
# # # ## ##### ## # # #
# use bat to display man pages with syntax highlighting etc 
set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"

# Uncomment the following line to run zellij at start (assuming bash is your shell, which this is not)
# set -gx ZELLIJ_AUTO_ATTACH=true # attach to any pre-existing sessions
# eval "$(zellij setup --generate-auto-start bash)"

########
# TEMP # - these belong somewhere else, but are here for the moment
########
export SELECTED_EDITOR="/usr/bin/hx"
export EDITOR="/usr/bin/hx"

# #########
# ARCHIVE #
# #########
# 2024-01-11 deprecation planned
# bug: doesn't appear to change the output of `jupyter --config-dir`
# https://docs.jupyter.org/en/latest/use/jupyter-directories.html
# set -gx JUPYTER_CONFIG_DIR "$HOME/.files/jupyter"

# ssh config? This was experiment for making git work in cron scripts, saving for posterity
# set -q SSH_AGENT_PID; or eval (ssh-agent -c)

# noir
export NARGO_HOME="$HOME/.nargo"
export PATH="$PATH:$NARGO_HOME/bin"
export BB_HOME="$HOME/.bb" # barretenburg
export PATH="$PATH:$BB_HOME"
fish_add_path -a $HOME/.foundry/bin

fish_add_path -a $HOME/.local/bin
fish_add_path -a $HOME/.local/share/pnpm

# bun https://bun.sh/
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $PATH $BUN_INSTALL/bin

# zoxide
zoxide init fish | source
