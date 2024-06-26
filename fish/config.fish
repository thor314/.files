#!/usr/bin/fish
# Thor's config.fish

if status is-interactive
  # Commands to run in interactive sessions can go here
  # set shell to fish, don't set everywhere, we been warned that fish not POSIX so mebe breaks elsewhere
  set -gx SHELL 'usr/bin/fish' 

  # Overwrite default greeting
  function fish_greeting 
    # get the weather
    curl 'https://wttr.in?format="%l:+%c+%t\n"' > /tmp/weather.txt 2>/dev/null &
    set -gx WEATHER_PID $last_pid
    for i in (seq 3 -1 1)
      # wait for $WEATHER_PID process to exit
      if not kill -0 $WEATHER_PID &> /dev/null 
        break
      else
        echo "waiting for wttr.in...$i" && sleep 0.4
      end
    end
    cat /tmp/weather.txt && rm /tmp/weather.txt && set -e WEATHER_PID
  end

  # only need these for interactive sessions
  pushd $HOME/.files/fish
  source abbr.fish
  source bind.fish
  source functions.fish
  source git_helpers.fish
  source rust_helpers.fish
  source web_helpers.fish
  source hackmd_helpers.fish
  for f in (ls $HOME/.files/fish/completions) ; source completions/$f ; end
  popd

  # default is TERM=alacritty; this fixes weird input bugs with alacritty
  if test (hostname) = "starchy" 
    set TERM xterm-256color 
  end

  tk-keychain ~/.ssh/id_ed25519 > /dev/null # avoid ssh-key issues

  # even if set elsewhere, to avoid capslock vscode bug, keep this line
  setxkbmap dvorak -option caps:ctrl_modifier 

  # nvm install latest && nvm use latest >> /dev/null # puts npm in path, and b quiet. May cause warnings if nvm path misconfigured. 
end

# load secret environment variables
gpg -qd "$HOME/.private/no-sync/secrets.gpg" | source

 # # # ## ##### ## # # #
# ENVIRONMENT VARIABLES #
 # # # ## ##### ## # # #
# keep these in config.fish for machine setup convenience) 
# use bat to display man pages with syntax highlighting etc 
set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"

# Uncomment the following line to run zellij at start (assuming bash is your shell, which this is not)
# set -gx ZELLIJ_AUTO_ATTACH=true # attach to any pre-existing sessions
# eval "$(zellij setup --generate-auto-start bash)"

 ######
# TEMP # - these belong somewhere else, but are here for the moment
 ######
export SELECTED_EDITOR="/usr/bin/vim.gtk3" # jan 12 - fixed profile bug, remove this in a week or two
export EDITOR="/usr/bin/vim.gtk3" # jan 12 - fixed profile bug, remove this in a week or two

# #########
 # ARCHIVE #
# #########
 # X # X X # X X ## X X # X X # X X # X
# PATH - SHOULD BE IN .PROFILE INSTEAD # - deprecate on 2024-10-11
 # X # X X # X X ## X X # X X # X X # X
# store selected editor or it dirties home env
# 2024-01-11 deprecation planned
# set -gx SELECTED_EDITOR /usr/bin/vim.gtk3

# 2024-01-11 deprecation planned
# bug: doesn't appear to change the output of `jupyter --config-dir`
# https://docs.jupyter.org/en/latest/use/jupyter-directories.html
# set -gx JUPYTER_CONFIG_DIR "$HOME/.files/jupyter"

# seems this only is required for setup, but only until .profile gets loaded correctly on re-login
# PATH fuckery
#set PATH $PATH $HOME/.local/bin
#set PATH $PATH $HOME/.cargo/bin

# ssh config? This was experiment for making git work in cron scripts, saving for posterity
# set -q SSH_AGENT_PID; or eval (ssh-agent -c)


