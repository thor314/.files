if status is-interactive
    # Commands to run in interactive sessions can go here
end

gpg -qd "$HOME/.private/secrets.gpg" | source

setxkbmap dvorak -option ctrl:nocaps
if test (hostname) = "starchy" 
  # default is TERM=alacritty; this fixes weird input bugs with alacritty
  set TERM xterm-256color 
end

set ZELLIJ_AUTO_ATTACH true # attach to the any pre-existing sessions
#eval "$(zellij setup --generate-auto-start zsh)" # uncomment to run zj at start

nvm use latest >> /dev/null # puts npm in path, and b quiet

# PATH fuckery
set PATH $PATH $HOME/.local/bin
