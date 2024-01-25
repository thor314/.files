# My bindings. 
# Docs: https://fishshell.com/docs/current/cmds/bind.html 
bind \cZ 'fg'
# bind \cW 'exit' # don't need, but keep as proof of concept
bind \cS 'zellij' # bug? immediately quits

# very nice forward/back binds
bind \e\, 'prevd; commandline -f repaint'
bind \e\. 'nextd; commandline -f repaint'

set COMMIT_MSG "$(hostname)-$(date -u +%Y-%m-%d-%H:%M%Z)"
bind \eg (tk-git-add-all-commit-message-push-create-upstream-branch $COMMIT_MSG) ; commandline -f repaint

bind \el 'lsd --icon=never; commandline -f repaint' 
bind \eL 'lsd -al --icon=never; commandline -f repaint'
