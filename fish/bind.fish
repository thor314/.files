# My bindings. 
# Docs: https://fishshell.com/docs/current/cmds/bind.html 
bind \cZ fg
bind \cS zellij
# bind \cW 'exit' # don't need, but keep as proof of concept

# very nice forward/back binds
bind \e\, "prevd; commandline -f repaint" # need \" for repaint to work as expected
bind \e\. "nextd; commandline -f repaint"
bind \eo "prevd; commandline -f repaint"
bind \ei "nextd; commandline -f repaint"

# set COMMIT_MSG "$(hostname)-$(date -u +%Y-%m-%d-%H:%M%Z)"
# bind \ea nohup alacritty --working-directory (pwd) >/dev/null 2>&1 & disown 2>/dev/null # new alacritty in same dir
bind \ec code . 
bind \ed vd $HOME/.files/install.conf.yaml ; commandline -f repaint
bind \ef vi $HOME/.files/fish/config.fish ; commandline -f repaint
# bind \el lsd --icon=never; commandline -f repaint
bind \ep git push ; commandline -f repaint
bind \eu git pull ; commandline -f repaint
bind \ev vi $HOME/.vimrc ; commandline -f repaint

# bind \eC cargo check -q  ; commandline -f repaint
# bind \eL lsd -al --icon=never; commandline -f repaint
bind \eF cargo format ; commandline -f repaint
bind \eT cargo test ; commandline -f repaint
bind \eR cargo run ; commandline -f repaint

