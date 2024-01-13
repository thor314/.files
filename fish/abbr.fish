#!/bin/fish
# Thor's aliases and convenience functions, mostly alphabetized.
# aliases a poor man's tldr: grep through my aliases for examples.
# define functions and bind aliases to them to include them in rg results.

abbr -a -g agi "sudo apt -y install"
abbr -a -g ags "apt-cache search"
abbr -a -g acs "apt-cache search"

abbr -a -g bat "bat --theme=zenburn --style=plain" # plain: no line numbers

abbr -a -g cdc  "cd ~/.cron"
abbr -a -g cdd  "cd $HOME/Downloads"
abbr -a -g cd.  "cd $HOME/.files"
abbr -a -g cde  "cd $HOME/.config/espanso/match"
abbr -a -g cdf  "cd $HOME/.files/fish"
abbr -a -g cdk  "cd ~/.keep"
abbr -a -g cdp  "cd ~/projects/"
abbr -a -g cdo  "cd ~/obsidian"
abbr -a -g cdos "cd ~/projects/obsidian-setup"
abbr -a -g cds  "cd $HOME/.setup"
abbr -a -g cdpt "cd $HOME/projects/tmpl"
abbr -a -g cdpp "cd $HOME/projects/pebble-stark"

abbr -a -g cat "bat --theme=zenburn --style=plain" # i like fancy cats
abbr -a -g c clip
abbr -a -g cpr 'cp -r'

# big ones:
abbr -a -g ca  "cargo add"
abbr -a -g cb  'cargo build -q'
abbr -a -g cbr 'cargo build --release'
abbr -a -g cbe 'cargo bench'
abbr -a -g cc  'cargo check -q'
abbr -a -g cct 'cargo check --tests'
abbr -a -g cf  'cargo fmt'
abbr -a -g cn  'cargo new'
abbr -a -g cq  'cargo clean'
abbr -a -g cr  'cargo run'
abbr -a -g ct  'cargo test'
abbr -a -g ctt 'cargo test -- --nocapture'
abbr -a -g cy  'cargo clippy'

# other cargo commands:
abbr -a -g cfc  "cargo fmt --all -- --check"
abbr -a -g ci   'cargo install'
abbr -a -g cttt "RUST_LOG=DEBUG RUST_BACKTRACE=1 cargo test -- --nocapture"
abbr -a -g ctc  'cargo tarpaulin -v -o Html'
abbr -a -g ctp  'cargo tarpaulin -v -o Html'
abbr -a -g cw   "cargo watch" 
abbr -a -g cwr  'cargo watch -x run'
abbr -a -g cyf  'cargo clippy --fix' # try to fix lints

## test workspace generation
abbr -a -g cgtb 'cargo generate --path ~/projects/tmpl/bin --bin -n cgtbin -d description="test cargo-generate binary"'
abbr -a -g cgtl 'cargo generate --path ~/projects/tmpl/lib --lib -n cgtlib -d description="test cargo-generate library"'
abbr -a -g cgtw 'cargo generate --path ~/projects/tmpl/workspace -n cgtw -d description="test cargo-generate workspace"'
abbr -a -g cgl  'cargo generate --path ~/projects/tmpl/lib -n'
abbr -a -g cgb  'cargo generate --path ~/projects/tmpl/bin -n'
abbr -a -g cgw  'cargo generate --path ~/projects/tmpl/workspace -n'
 
abbr -a -g df "duf"
abbr -a -g diff difft # fancy difftool
abbr -a -g dt "dotbot -c ~/.files/install.conf.yaml"
abbr -a -g dtp "dotbot -c ~/.private/install.conf.yaml"
abbr -a -g du "dust" # gimme stats

abbr -a -g fd fdfind
abbr -a -g fk fuck

abbr -a -g hsd "hugo server -D"

abbr -a -g gaa "git add --all ." 
abbr -a -g gcm "git commit -m "
abbr -a -g gca "git add --all . -v && git commit --amend --no-edit"
abbr -a -g gcaa "git commit --amend" # update message
abbr -a -g gm "git merge"  
abbr -a -g gpu 'git push -u origin $(git symbolic-ref --short HEAD)' 
abbr -a -g gs "git status -sb"
abbr -a -g gc "git add --all . --verbose && git commit -m"

abbr -a -g hbr "hub browse"
abbr -a -g hpr "hub pull-request"
abbr -a -g hi "hub issue"

abbr -a -g htop 'zenith'

abbr -a -g jn 'jupyter notebook'

abbr -a -g kbd 'setxkbmap dvorak -option ctrl:nocaps'
abbr -a -g kbds 'setxkbmap dvorak -option ctrl:swapcaps'
abbr -a -g kbdu 'setxkbmap us -option ctrl:nocaps'

abbr -a -g l 'lsd --icon never'
abbr -a -g less 'bat'
abbr -a -g ls 'lsd --icon never'
abbr -a -g la 'lsd --icon never -al'
abbr -a -g ll 'lsd --icon never -al'

abbr -a -g npmra 'npm-run-all' # run npm-scripts in para/seq.  https://www.npmjs.com/package/npm-run-all

abbr -a -g pipi "pip install"
abbr -a -g python python3
abbr -a -g pp pythonplay

abbr -a -g ru rustup
abbr -a -g rmf "rm -rf" 
abbr -a -g rmr "rm -rf" 
abbr -a -g rra "rusty-rain -c arrow"
abbr -a -g rrb "rusty-rain -c bin"
abbr -a -g rrc "rusty-rain -c crab"
abbr -a -g rrcc "rusty-rain -c cards"
abbr -a -g rrd "rusty-rain -c dominosv"
abbr -a -g rrj "rusty-rain -c jap"
abbr -a -g rrm "rusty-rain -c moon"
abbr -a -g rrn "rusty-rain -c numbers"
abbr -a -g rrs "rusty-rain -c shapes"

abbr -a -g sr 'fd --type file -x sd' # search replace in directory
abbr -a -g srp 'fd --type file -x sd -p' # search replace in directory practice
abbr -a -g sc "maim -s | xclip -selection clipboard -target image/png"
abbr -a -g sf 'surfraw -browser=firefox' # cli for internet search

abbr -a -g top 'btm' # kinky
abbr -a -g thes 'moby' # thesaurus
abbr -a -g tf "taplo fmt"

abbr -a -g zj zellij

## VIM
abbr -a -g vi vim
abbr -a -g v vim

abbr -a -g vd "vi ~/.files"
abbr -a -g vdi "vi ~/.files/install.conf.yaml"
abbr -a -g vs "vi ~/.files/scripts/sync.sh"
abbr -a -g vf "vi ~/.files/fish/config.fish"
abbr -a -g vfa "vi ~/.files/fish/abbr.fish" 
abbr -a -g vfb "vi ~/.files/fish/bind.fish"
abbr -a -g vff "vi ~/.files/fish/functions.fish" 
abbr -a -g vop "vi ~/.files/obsidian/preamble.sty"
abbr -a -g vov "vi ~/.files/obsidian/obsidian.vimrc"

abbr -a -g vb "vi ~/.setup/unsorted.sh"
abbr -a -g vk "vi ~/.setup/keybinds.sh"
abbr -a -g ve "vi ~/.config/espanso/match"
abbr -a -g vo "vi ~/.config/espanso/match/markdown/_obsidian.yml"
abbr -a -g vu "vi ~/.setup/unsorted.sh"
abbr -a -g vv "vi ~/.files/vimrc"

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

