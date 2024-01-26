# My bindings. 
# Docs: https://fishshell.com/docs/current/cmds/bind.html 
bind \cZ 'fg'
# bind \cW 'exit' # don't need, but keep as proof of concept
bind \cS 'zellij' 

# very nice forward/back binds
bind \e\, 'prevd; commandline -f repaint'
bind \e\. 'nextd; commandline -f repaint'

# set COMMIT_MSG "$(hostname)-$(date -u +%Y-%m-%d-%H:%M%Z)"
bind \ec code . ; commandline -f repaint
bind \ec a ; commandline -f repaint
bind \ed vd $HOME/.files/install.conf.yaml ; commandline -f repaint
bind \ef vi $HOME/.files/fish/config.fish ; commandline -f repaint
bind \ep git push ; commandline -f repaint
bind \eu git pull ; commandline -f repaint
bind \ev vi $HOME/.vimrc ; commandline -f repaint

bind \el 'lsd --icon=never; commandline -f repaint' 
bind \eL 'lsd -al --icon=never; commandline -f repaint'
