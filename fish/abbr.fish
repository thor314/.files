#!/usr/bin/fish
# Thor's aliases and convenience functions, mostly alphabetized.
# aliases a poor man's tldr: grep through my aliases for examples.
# define functions and bind aliases to them to include them in rg results.

abbr -a -g cmdh "node $HOME/fun/cmdh/dist/index.js"
abbr -a -g oll "ollama run llama2"

abbr -a -g agi "sudo apt -y install"
abbr -a -g ags "apt-cache search"
abbr -a -g acs "apt-cache search"

abbr -a -g bat "bat --theme=zenburn --style=plain" # plain: no line numbers

abbr -a -g cat "bat --theme=zenburn --style=plain" # i like fancy cats
abbr -a -g cpr 'cp -r'

abbr -a -g df duf
abbr -a -g diff difft # fancy difftool
abbr -a -g du dust # gimme stats

abbr -a -g fd fdfind
abbr -a -g fk fuck

# https://difftastic.wilfred.me.uk/git.html
abbr -a -g gsh git show --ext-diff HEAD # use difft for git show
abbr -a -g glop git log -p --ext-diff
abbr -a -g gms git merge --squash

abbr -a -g hsd "hugo server -D"
abbr -a -g htop zenith

abbr -a -g h hx
abbr -a -g hxc 'hx ~/.config/helix/config.toml'
abbr -a -g hxl 'hx ~/.config/helix/languages.toml'
abbr -a -g hfc 'hx ~/.files/fish/config.fish'
abbr -a -g hfa 'hx ~/.files/fish/abbr.fish'
abbr -a -g hsu 'hx ~/.setup/unsorted.sh'

abbr -a -g jn 'jupyter notebook'

abbr -a -g kbd 'setxkbmap dvorak -option ctrl:nocaps'
abbr -a -g kbds 'setxkbmap dvorak -option ctrl:swapcaps'
abbr -a -g kbdu 'setxkbmap us -option ctrl:nocaps'

abbr -a -g l 'lsd --icon never'
abbr -a -g less bat
abbr -a -g ls 'lsd --icon never'
abbr -a -g la 'lsd --icon never -al'
abbr -a -g ll 'lsd --icon never -al'
abbr -a -g logout pkill -u (whoami)

abbr -a -g pipi "pip install"
abbr -a -g python python3
abbr -a -g pp pythonplay

abbr -a q llm
abbr -a qs 'llm -s' # system prompt for piping from stdin
abbr -a qm 'llm -m' # choose model
abbr -a q4 'llm -m 4o' # Specifically for chat 4o 
abbr -a qk 'llm -c' # k for kontinue
abbr -a qc 'llm chat'
abbr -a qco 'llm chat -m 4o'
abbr -a qcg 'llm chat -m chatgpt'
abbr -a qt 'llm -t' # Use a template
abbr -a qq 'llm cmd' # suggest a command

abbr -a -g rmf "rm -rf"
abbr -a -g rmr "rm -rf"
abbr -a -g rr "rusty-rain -c bin"
abbr -a -g rrc "rusty-rain -c crab"
abbr -a -g rrj "rusty-rain -c jap"

abbr -a -g s source
abbr -a -g sfc 'source ~/.files/fish/config.fish'
abbr -a -g sr 'fd --type file -x sd' # search replace in directory
abbr -a -g srp 'fd --type file -x sd -p' # search replace in directory practice
abbr -a -g sf 'surfraw -browser=firefox' # cli for internet search
abbr -a -g ssh-home 'ssh thor@73.15.100.105'
abbr -a -g ssh-pi 'ssh thor@192.168.1.191'
# abbr -a -g sc "maim -s | xclip -selection clipboard -target image/png"

abbr -a -g top btm # kinky
abbr -a -g thes moby # thesaurus
abbr -a -g tf "taplo fmt"
abbr -a -g typos "typos --format=brief --config=$HOME/.files/typos.toml"
abbr -a -g typos-fix "typos --format=brief --config=$HOME/.files/typos.toml"

## VIM
abbr -a -g vi vim
abbr -a -g v vim

abbr -a -g v. "vi ~/.files/install.conf.yaml"
abbr -a -g v.p "vi ~/.private/install.conf.yaml"
abbr -a -g v.s "vi ~/.private/sensitive.gpg"
abbr -a -g v.e "vi ~/.private/env.gpg"
abbr -a -g v.t "vi ~/.files/typos.toml"

abbr -a -g vcs "vi ~/.files/.cron/help_scripts/sync.fish"

abbr -a -g ve "vi ~/.config/espanso/match"
abbr -a -g veo "vi ~/.config/espanso/match/markdown/_obsidian.yml"

abbr -a -g vfc "vi ~/.files/fish/config.fish"
abbr -a -g vfa "vi ~/.files/fish/abbr.fish"
abbr -a -g vfb "vi ~/.files/fish/bind.fish"
abbr -a -g vff "vi ~/.files/fish/functions.fish"
abbr -a -g vfg "vi ~/.files/fish/git_helpers.fish"
abbr -a -g vfr "vi ~/.files/fish/rust_helpers.fish"
abbr -a -g vfw "vi ~/.files/fish/web_helpers.fish"

abbr -a -g vop "vi ~/.files/obsidian/preamble.sty"
abbr -a -g vov "vi ~/.files/obsidian/obsidian.vimrc"

abbr -a -g vsk "vi ~/.setup/keybinds.sh"
abbr -a -g vsu "vi ~/.setup/unsorted.sh"

abbr -a -g vv "vi ~/.files/vimrc"

abbr -a -g zj zellij

abbr -a -g z. "cd $HOME/.files"
abbr -a -g z.s "cd $HOME/.files/scripts"
abbr -a -g z.p "cd $HOME/.private"
abbr -a -g zc "cd ~/.cron"
abbr -a -g zcl "cd ~/.cron/logs"
abbr -a -g zch "cd ~/.cron/help_scripts"
abbr -a -g zd "cd $HOME/Downloads"
abbr -a -g ze "cd $HOME/.config/espanso/match"
abbr -a -g zem "cd $HOME/.config/espanso/match/markdown"
abbr -a -g zeo "cd $HOME/.config/espanso/match/markdown"
abbr -a -g zf "cd $HOME/.files/fish"
abbr -a -g zh "cd $HOME/.config/helix"
abbr -a -g zk "cd ~/.keep"
abbr -a -g zo "cd ~/obsidian"
abbr -a -g zp "cd ~/projects"
abbr -a -g zpb "cd ~/projects/blog"
abbr -a -g zpo "cd ~/projects/obsidian-setup"
abbr -a -g zu "cd ~/puzzles"
abbr -a -g zps "cd ~/projects/pebble-stark"
abbr -a -g zpt "cd ~/projects/tk-cargo-generate/template"
abbr -a -g zos "cd ~/projects/obsidian-setup"
abbr -a -g zs "cd $HOME/.setup"

abbr -a -g .f "dotbot -c ~/.files/install.conf.yaml"
abbr -a -g .p "dotbot -c ~/.private/install.conf.yaml"
abbr -a -g :q exit

## Graveyard 
# abbr -a -g hd rhai-debug
# abbr -a -g hr rhai-repl
# abbr -a -g hu rhai-run
# abbr -a -g man batman # du du du du du du du du 
# function bman 
#   man $1 | bat
# end
# abbr -a -g trashout "rm -rf $HOME/.trash/*"
# abbr -a -g rr 'shuf -i 0-1 -n1' # pick 0 or 1 at random
# abbr -a -g sz 'source ~/.zsh.d/.zshrc'
# abbr -a -g sza 'source ~/.zsh.d/alias.sh'
# abbr -a -g sni 'snap install'
# abbr -a -g snr 'snap remove'
# abbr -a -g tor "flatpak run com.github.micahflee.torbrowser-launcher"
# abbr -a -g tw 'rainbowstream' # terminal twitter client, kinda shit tho
# abbr -a -g zotero "flatpak run org.zotero.Zotero"
# abbr -a -g chat "chatblade -i"
# abbr -a -g ch3 "chatblade -i --chat-gpt 3.5"
# abbr -a -g ch4 "chatblade -i --chat-gpt 4"
