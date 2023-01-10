#!/bin/sh
# Thor's aliases and convenience functions, mostly alphabetized.
# aliases a poor man's tldr: grep through my aliases for examples.
# define functions and bind aliases to them to include them in rg results.

# TEMP
function unset-right 
    function fish_right_prompt 
    end
end

function ck
    echo checking (pwd)
    cargo check -q 
    cargo clippy -- -D warnings 
    cargo fmt --check 
    taplo fmt --check
end

function checkall
    for D in */
        pushd $D && ck && popd 
    end
end


# PERMANENT(ish)
abbr -a -g agi "sudo apt -y install"
abbr -a -g ags "apt-cache search"
abbr -a -g acs "apt-cache search"

abbr -a -g bat "bat --theme=zenburn --style=plain" # plain: no line numbers
function backup
    echo "$argv" >> ~/.setup/unsorted.sh
end
abbr -a -g bu backup

abbr -a -g cat "bat --theme=zenburn --style=plain" # i like fancy cats
function clip
    echo $argv | xclip -selection clipboard
end
abbr -a -g c clip
abbr -a -g ca "cargo add"
abbr -a -g cb 'cargo build -q'
abbr -a -g cbr 'cargo build --release'
abbr -a -g cbe 'cargo bench'
abbr -a -g cc 'cargo check'
abbr -a -g ccq 'cargo check -q'
abbr -a -g cct 'cargo check --tests'
# abbr -a -g cc 'RUSTFLAGS=-Awarnings cargo check -q'

abbr -a -g cdb "cd ~/r/tmpl/"
abbr -a -g cde 'cd $HOME/.config/espanso/match'
abbr -a -g cdf 'cd $HOME/.files/fish'
abbr -a -g cdt 'cd $HOME/r/tmpl'

abbr -a -g cf 'cargo fmt'
abbr -a -g cfc "cargo fmt --all -- --check"
abbr -a -g cplay "pushd $HOME/r/play/playground && code . && popd"
abbr -a -g caplay "pushd $HOME/r/play/async-playground && code . && popd"
abbr -a -g ci 'cargo install'
abbr -a -g cl 'cargo clippy'
abbr -a -g cy 'cargo clippy'
abbr -a -g clf 'cargo clippy --fix' # try to fix lints
abbr -a -g cn 'cargo new'
abbr -a -g cpr 'cp -r'
abbr -a -g cq 'cargo clean'
abbr -a -g cr 'cargo run'
abbr -a -g ct 'cargo test'
abbr -a -g ctt "RUST_LOG=DEBUG RUST_BACKTRACE=1 ct -- --nocapture"
abbr -a -g ctc 'cargo tarpaulin -v -o Html'
abbr -a -g ctp 'cargo tarpaulin -v -o Html'
abbr -a -g cwa "cargo watch -c" 

## test workspace generation
abbr -a -g cgtb 'cargo generate --path ~/r/tmpl/bin --bin -n cgtbin -d description="test cargo-generate binary"'
abbr -a -g cgtl 'cargo generate --path ~/r/tmpl/lib --lib -n cgtlib -d description="test cargo-generate library"'
abbr -a -g cgtw 'cargo generate --path ~/r/tmpl/workspace -n cgtw -d description="test cargo-generate workspace"'
abbr -a -g cgl 'cargo generate --path ~/r/tmpl/lib -n'
abbr -a -g cgb 'cargo generate --path ~/r/tmpl/bin -n'
abbr -a -g cgw 'cargo generate --path ~/r/tmpl/workspace -n'
function cgp # create a new experiment module with cg, and track it in my module-explorer
  alias cg='cargo generate'
  cd ~/r/play
  cg --path ~/r/tmpl/base --name $argv[1] 
  cd $argv[1] 
  cargo fmt && taplo fmt
  git init && git add --all && git commit -m "init" 
  hub create && gpu &
  cd ..
  git submodule add https://github.com/thor314/$argv[1] $argv[1]
  git commit -m "$argv[1] init" && gp
  code $argv[1]
end
function ccl # clone a rust library from github
  cd ~/r/clone
  hub clone $argv[1]
  set repo_name $(echo $argv[1] | pz "s.split('/')[-1]")
  cd $repo_name
  cc
  code .
end
 
abbr -a -g df "duf"
abbr -a -g diff difft # fancy difftool
abbr -a -g dl "cd $HOME/Downloads"
abbr -a -g dt "dotbot -c ~/.files/install.conf.yaml"
abbr -a -g dtp "dotbot -c ~/.files/private/install.conf.yaml"
abbr -a -g dtr "sudo dotbot -c ~/.files/root/install.conf.yaml"
abbr -a -g dts "sudo dotbot -c ~/.files/root/install.conf.yaml"
abbr -a -g du "dust" # gimme stats

abbr -a -g fd fdfind
abbr -a -g files "cd $HOME/.files"
abbr -a -g fk fuck
abbr -a -g fa "forge install" # think add
abbr -a -g fb "forge build"
abbr -a -g fn "forge init"
abbr -a -g fnt "forge init --template" #https://book.getfoundry.sh/projects/creating-a-new-project.html
abbr -a -g fr "forge remappings > remappings.txt" # fix import errors in vscode
abbr -a -g ft "forge test"
function formatall
  for D in */
    pushd $D 
    echo "cargo fmt $D\n" && cf 
    echo "taplo fmt $D\n" && taplo fmt 
    popd 
  end
end

abbr -a -g gaa "git add --all ." 
abbr -a -g gcm "git commit -m "
# abbr -a -g gc "git commit -m "
# abbr -a -g gca "git commit -v -a -m "
abbr -a -g gca "git add --all . -v && git commit --amend --no-edit"
abbr -a -g gcaa "git commit --amend" # update message
abbr -a -g gcl "git clone --recurse-submodules"
abbr -a -g gcll "cd $HOME/r/clone && gcl"
abbr -a -g gcln "cd $HOME/r/clone && gcl"
abbr -a -g gu "gitui" # ui interface to git
abbr -a -g gin 'git init'
abbr -a -g girust 'gi rust >> .gitignore'
abbr -a -g gir 'gi rust >> .gitignore'
abbr -a -g gm "git merge"  
# OMZ gitignore gi {list,<template>end
# OMZ: git; esp. gam,gc!
# OMZ: rga go+
abbr -a -g gpu 'git push -u origin $(git symbolic-ref --short HEAD)' 
abbr -a -g grep "rg" 
abbr -a -g gs "git status -sb"
abbr -a -g guake "tdrop -ma -h "100%" -s dropdown alacritty"

function gsa
  git submodule add https://github.com/thor314/$argv[1] $argv[1]
end

function gityeet
  git add --all . --verbose
  git commit -m $argv[1]
  git push
end
function gityeeet # new branch
  git add --all . --verbose
  git commit -m $argv[1]
  git push --set-upstream origin (git branch --show-current)
end
function gityeeeet # new repo
  hub create
  gityeeet $argv[1]
end
abbr -a -g gc "git add --all . --verbose && git commit -m"
abbr -a -g gg gityeet
abbr -a -g ggu gityeeet
abbr -a -g gghub gityeeeet

abbr -a -g h "hx ."  
abbr -a -g hxa "hx ~/.files/fish/conf.d/alias.fish"  
abbr -a -g sa "source ~/.files/fish/conf.d/alias.fish"
abbr -a -g hxb "hx ~/.files/fish/conf.d/bind.fish"
abbr -a -g hxc "hx ~/.files/helix/config.toml"
abbr -a -g hxd "hx ~/.files/install.conf.yaml"
abbr -a -g hxe "hx ~/.config/espanso/match"
abbr -a -g hxet "hx ~/.config/espanso/match/thor.yml"
abbr -a -g hxeb "hx ~/.config/espanso/match/base.yml"
abbr -a -g hxcr "hx ~/.config/espanso/match/code/_rust.yml"
abbr -a -g hxct "hx ~/.config/espanso/match/code/_toml.yml"
abbr -a -g hxcp "hx ~/.config/espanso/match/code/_python.yml"
abbr -a -g hxml "hx ~/.config/espanso/match/markdown/_latex.yml"
abbr -a -g hxmo "hx ~/.config/espanso/match/markdown/_obsidian.yml"
abbr -a -g hxmm "hx ~/.config/espanso/match/markdown/_mermaid.yml"
abbr -a -g hxmg "hx ~/.config/espanso/match/markdown/_greek.yml"
abbr -a -g hxn "hx ~/.files/nvim/init.vim"
abbr -a -g hxf "hx ~/.files/fish/config.fish"
abbr -a -g hxl "hx ~/.files/helix/languages.toml"
abbr -a -g hxs "hx ~/.setup/install.sh"
abbr -a -g hxv "hx ~/.files/vimrc"
abbr -a -g hxsu "hx ~/.setup/unsorted.sh"
# open hx in docs
abbr -a -g hxdk "hx ~/.setup/clones/helix/book/src/keymap.md"
abbr -a -g hxdo "hx ~/.setup/clones/helix/book/src/configuration.md"

abbr -a -g hbr "hub browse"
abbr -a -g hcl "hub clone"
abbr -a -g hcll "cd $HOME/r/clone && hcl"
abbr -a -g hcln "cd $HOME/r/clone && hcl"
abbr -a -g hpr "hub pull-request"
abbr -a -g hci "hub ci-status"
# abbr -a -g hd rhai-debug
# abbr -a -g hr rhai-repl
# abbr -a -g hu rhai-run
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

function logout
    pkill -u (whoami)
end

abbr -a -g man "batman" # du du du du du du du du

abbr -a -g pipi "pip install"
abbr -a -g python python3
abbr -a -g pp pythonplay
abbr -a -g priv cd $HOME/.private
abbr -a -g pyp pythonplay
abbr -a -g pyplay pythonplay
function pythonplay 
  cd $HOME/py/play
  mkdir $argv[1]
  cd $argv[1]
  touch main.py
  hx main.py .
end

function rga
  abbr -a -g | rg -e "$argv" | cut -d" " -f5-
end
function rgg 
  rg $argv $HOME/.files/fish/conf.d/git.md
  functions | rg -e "$argv"
end
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
abbr -a -g sni 'snap install'
abbr -a -g snr 'snap remove'
abbr -a -g sshb "ssh -t thor@$IP_LILBIRB"
abbr -a -g sshl "ssh -t thor@$IP_LILBIRB"
abbr -a -g sshs "ssh -t thor@$IP_STARCHY"
abbr -a -g sshh "ssh -t thor@$IP_HOME" 
abbr -a -g sshzb "ssh -t thor@$IP_LILBIRB ZDOTDIR=.zsh.d zsh"
abbr -a -g sshzl "ssh -t thor@$IP_LILBIRB ZDOTDIR=.zsh.d zsh"
abbr -a -g sshzs "ssh -t thor@$IP_STARCHY ZDOTDIR=.zsh.d zsh"
abbr -a -g sshzh "ssh -t thor@$IP_HOME ZDOTDIR=.zsh.d "
abbr -a -g sz 'source ~/.zsh.d/.zshrc'
abbr -a -g sza 'source ~/.zsh.d/alias.sh'
abbr -a -g spot spt # spotify-tui

abbr -a -g top 'btm' # kinky
abbr -a -g tw 'rainbowstream' # terminal twitter client, kinda shit tho
abbr -a -g thes 'moby' # thesaurus
abbr -a -g trashout "rm -rf $HOME/.trash/*"
abbr -a -g tor "flatpak run com.github.micahflee.torbrowser-launcher"
abbr -a -g tf "taplo fmt"

abbr -a -g v 'nvim'
abbr -a -g va 'vi ~/.config/alacritty/alacritty.yml'
abbr -a -g vb 'vi ~/.setup/unsorted.sh'
abbr -a -g vbi 'vi ~/.setup/install.sh'
abbr -a -g vbu 'vi ~/.setup/install.sh'
abbr -a -g vcg 'vi ~/.cargo/cargo-generate.toml'
abbr -a -g vd 'vi ~/.files/install.conf.yaml'
abbr -a -g vdp 'vi ~/.files/private/install.conf.yaml'
abbr -a -g vds 'vi ~/.files/root/install.conf.yaml'
abbr -a -g vdr 'vi ~/.files/root/install.conf.yaml'
abbr -a -g veb "vi ~/.config/espanso/match/base.yml"
abbr -a -g vec "vi ~/.config/espanso/match/code.yml"
abbr -a -g vel "vi ~/.config/espanso/match/latex.yml"
abbr -a -g vem "vi ~/.config/espanso/match/mermaid.yml"
abbr -a -g veo "vi ~/.config/espanso/match/obsidian.yml"
abbr -a -g vet "vi ~/.config/espanso/match/thor.yml"
abbr -a -g vj 'vi ~/.config/zellij/config.yaml'
abbr -a -g vo 'vi ~/note/.obsidian.vimrc'
# OMZ: vsc+ vscode
abbr -a -g vtmpl 'vi ~/r/tmpl/base/Cargo.toml'
abbr -a -g vv 'vi ~/.vimrc'
abbr -a -g vz 'vi ~/.zsh.d/.zshrc'
abbr -a -g vza 'vi ~/.zsh.d/alias.sh'

abbr -a -g zj zellij
abbr -a -g zotero "flatpak run org.zotero.Zotero"

abbr -a -g :q exit

## Graveyard 
#abbr -a -g rr 'shuf -i 0-1 -n1' # pick 0 or 1 at random
