# My bindings. 
# Docs: https://fishshell.com/docs/current/cmds/bind.html 
bind \cZ 'fg'
# bind \cW 'exit' # don't need, but keep as proof of concept
bind \cS 'zellij' # bug? immediately quits

# very nice forward/back
bind \eo 'prevd; commandline -f repaint'
bind \e\, 'prevd; commandline -f repaint'
bind \ei 'nextd; commandline -f repaint'
bind \e\. 'nextd; commandline -f repaint'

bind \el 'lsd --icon=never; commandline -f repaint' 
bind \eL 'lsd -a --icon=never; commandline -f repaint'
