# My bindings. 
# Docs: https://fishshell.com/docs/current/cmds/bind.html 
bind \cZ 'fg'
bind \cW 'exit'
bind \cS 'zellij'

# forward/back
bind \eo 'prevd; commandline -f repaint'
bind \el 'lsd --icon=never; commandline -f repaint'
bind \eL 'lsd -a --icon=never; commandline -f repaint'
bind \ei 'nextd; commandline -f repaint'