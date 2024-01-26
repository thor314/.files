# My bindings. 
# Docs: https://fishshell.com/docs/current/cmds/bind.html 
# generally surround in \" for binds to work as expected
bind \cZ fg
bind \eS "zellij" #
# bind \cW 'exit' # don't need, but keep as proof of concept

# very nice forward/back binds
bind \e\, "prevd; commandline -f repaint" 
bind \e\. "nextd; commandline -f repaint"
bind \eo "prevd; commandline -f repaint"
bind \ei "nextd; commandline -f repaint"

# set COMMIT_MSG "$(hostname)-$(date -u +%Y-%m-%d-%H:%M%Z)"
bind \ea "nohup alacritty --working-directory (pwd) >/dev/null 2>&1 & disown 2>/dev/null" # new alacritty in same dir
bind \ec "code ."
bind \ed "vi $HOME/.files/install.conf.yaml"
bind \ef "vi $HOME/.files/fish/config.fish"
# bind \el lsd --icon=never; commandline -f repaint
bind \ep "git push" 
bind \eu "git pull"
bind \ev "vi $HOME/.vimrc"

bind \eC "cargo check -q  ; commandline -f repaint"
bind \eL "lsd -al --icon=never; commandline -f repaint"
bind \eF "cargo fmt"
bind \eT "cargo test"
bind \eR "cargo run"

