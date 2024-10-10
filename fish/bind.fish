#!/usr/bin/fish
# My bindings. 
# Docs: https://fishshell.com/docs/current/cmds/bind.html 
# generally surround in \" for binds to work as expected
bind \cZ fg
# bind \cW 'exit' # don't need, but keep as proof of concept

# very nice forward/back binds
bind \e\, "prevd; commandline -f repaint" 
bind \e\. "nextd; commandline -f repaint"
# bind \eo "prevd; commandline -f repaint"
# bind \ei "nextd; commandline -f repaint"

# set COMMIT_MSG "$(hostname)-$(date -u +%Y-%m-%d-%H:%M%Z)"
bind \ec "code ."
bind \er "rusty-rain -c numbers"

bind \eA "nohup alacritty --working-directory (pwd) >/dev/null 2>&1 & disown 2>/dev/null" # new alacritty in same dir
bind \eC "cargo check -q  ; commandline -f repaint"
bind \eD "vi $HOME/.files/install.conf.yaml"
bind \eL "lsd --icon=never; commandline -f repaint"
bind \eF "cargo fmt -v; commandline -f repaint"
bind \eR "cargo run"
bind \eS "vi $HOME/.files/fish/config.fish"
bind \eT "cargo test"
bind \eU "source $HOME/.files/fish/config.fish ; commandline -f repaint"
bind \eV "vi $HOME/.vimrc"

