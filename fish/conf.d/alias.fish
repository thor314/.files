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
alias agi="sudo apt -y install"
alias ags="apt-cache search"
alias acs="apt-cache search"

alias bat="bat --theme=zenburn --style=plain" # plain: no line numbers
function backup
    echo "$argv" >> ~/.setup/unsorted.sh
end
alias bu=backup

alias cat="bat --theme=zenburn --style=plain" # i like fancy cats
function clip
    echo $argv | xclip -selection clipboard
end
alias c=clip
alias ca="cargo add"
alias cb='cargo build -q'
alias cbr='cargo build --release'
alias cbe='cargo bench'
alias cc='cargo check'
alias ccq='cargo check -q'
alias cct='cargo check --tests'
# alias cc='RUSTFLAGS=-Awarnings cargo check -q'

alias cdb="cd ~/r/tmpl/base/"
alias cde='cd $HOME/.config/espanso/match'
alias cdf='cd $HOME/.files/fish'
alias cdt='cd $HOME/r/tmpl'

alias cf='cargo fmt'
alias cfc="cargo fmt --all -- --check"
alias cplay="pushd $HOME/r/play/playground && code . && popd"
alias caplay="pushd $HOME/r/play/async-playground && code . && popd"
alias ci='cargo install'
alias cl='cargo clippy'
alias cy='cargo clippy'
alias clf='cargo clippy --fix' # try to fix lints
alias cn='cargo new'
alias cpr='cp -r'
alias cq='cargo clean'
alias cr='cargo run'
alias ct='cargo test'
alias ctt="RUST_LOG=DEBUG RUST_BACKTRACE=1 ct -- --nocapture"
alias ctc='cargo tarpaulin -v -o Html'
alias ctp='cargo tarpaulin -v -o Html'
alias cwa="cargo watch -c" 

## test workspace generation
alias cgtb='cargo generate --path ~/r/tmpl/bin --bin -n cgtbin -d description="test cargo-generate binary"'
alias cgtl='cargo generate --path ~/r/tmpl/lib --lib -n cgtlib -d description="test cargo-generate library"'
alias cgtw='cargo generate --path ~/r/tmpl/workspace -n cgtw -d description="test cargo-generate workspace"'
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
 
alias df="duf"
alias diff=difft # fancy difftool
alias dl="cd $HOME/Downloads"
alias dt="dotbot -c ~/.files/install.conf.yaml"
alias dtp="dotbot -c ~/.files/private/install.conf.yaml"
alias dtr="sudo dotbot -c ~/.files/root/install.conf.yaml"
alias dts="sudo dotbot -c ~/.files/root/install.conf.yaml"
alias du="dust" # gimme stats

alias fd=fdfind
alias files="cd $HOME/.files"
alias fk=fuck
alias fa="forge install" # think add
alias fb="forge build"
alias fn="forge init"
alias fnt="forge init --template" #https://book.getfoundry.sh/projects/creating-a-new-project.html
alias fr="forge remappings > remappings.txt" # fix import errors in vscode
alias ft="forge test"
function formatall
  for D in */
    pushd $D 
    echo "cargo fmt $D\n" && cf 
    echo "taplo fmt $D\n" && taplo fmt 
    popd 
  end
end

alias gaa="git add --all ." 
alias gcm="git commit -m "
# alias gc="git commit -m "
# alias gca="git commit -v -a -m "
alias gca="git add --all . -v && git commit --amend --no-edit"
alias gcaa="git commit --amend" # update message
alias gcl="git clone --recurse-submodules"
alias gcll="cd $HOME/r/clone && gcl"
alias gcln="cd $HOME/r/clone && gcl"
alias gu="gitui" # ui interface to git
alias gin='git init'
alias girust='gi rust >> .gitignore'
alias gir='gi rust >> .gitignore'
alias gm="git merge --ff --squash"  
# OMZ gitignore gi {list,<template>end
# OMZ: git; esp. gam,gc!
# OMZ: rga go+
alias gpu='git push -u origin $(git symbolic-ref --short HEAD)' 
alias grep="rg" 
alias gs="git status -sb"
alias guake="tdrop -ma -h "100%" -s dropdown alacritty"

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
alias gc="git add --all . --verbose && git commit -m"
alias gg=gityeet
alias ggu=gityeeet
alias gghub=gityeeeet

alias h="hx ."  
alias hxa="hx ~/.files/fish/conf.d/alias.fish"  
alias sa="source ~/.files/fish/conf.d/alias.fish"
alias hxb="hx ~/.files/fish/conf.d/bind.fish"
alias hxc="hx ~/.files/helix/config.toml"
alias hxd="hx ~/.files/install.conf.yaml"
alias hxe="hx ~/.config/espanso/match"
alias hxeb="hx ~/.config/espanso/match/base.yml"
alias hxcr="hx ~/.config/espanso/match/code/_rust.yml"
alias hxct="hx ~/.config/espanso/match/code/_toml.yml"
alias hxcp="hx ~/.config/espanso/match/code/_python.yml"
alias hxml="hx ~/.config/espanso/match/markdown/_latex.yml"
alias hxmo="hx ~/.config/espanso/match/markdown/_obsidian.yml"
alias hxmm="hx ~/.config/espanso/match/markdown/_mermaid.yml"
alias hxmg="hx ~/.config/espanso/match/markdown/_greek.yml"
alias hxet="hx ~/.config/espanso/match/thor.yml"
alias hxf="hx ~/.files/fish/config.fish"
alias hxl="hx ~/.files/helix/languages.toml"
alias hxs="hx ~/.setup/install.sh"
alias hxsu="hx ~/.setup/unsorted.sh"
# open hx in docs
alias hxdk="hx ~/.setup/clones/helix/book/src/keymap.md"
alias hxdo="hx ~/.setup/clones/helix/book/src/configuration.md"

alias hbr="hub browse"
alias hcl="hub clone"
alias hcll="cd $HOME/r/clone && hcl"
alias hcln="cd $HOME/r/clone && hcl"
alias hpr="hub pull-request"
alias hci="hub ci-status"
# alias hd=rhai-debug
# alias hr=rhai-repl
# alias hu=rhai-run
alias htop='zenith'

alias kbd='setxkbmap dvorak -option ctrl:nocaps'
alias kbds='setxkbmap dvorak -option ctrl:swapcaps'
alias kbdu='setxkbmap us -option ctrl:nocaps'

alias l='lsd --icon never'
alias less='bat'
alias ls='lsd --icon never'
function logout
    pkill -u (whoami)
end

alias man="batman" # du du du du du du du du

alias pipi="pip install"
alias python=python3
alias pp=pythonplay
alias priv=cd $HOME/.private
alias pyp=pythonplay
alias pyplay=pythonplay
function pythonplay 
  cd $HOME/py/play
  mkdir $argv[1]
  cd $argv[1]
  touch main.py
  hx main.py .
end

function rga
  alias | rg -e "$argv"
end
function rgg 
  rg $argv $HOME/.files/fish/conf.d/git.md
  functions | rg -e "$argv"
end
alias ru=rustup
alias rmf="rm -rf" 
alias rmr="rm -rf" 
alias rra="rusty-rain -c arrow"
alias rrb="rusty-rain -c bin"
alias rrc="rusty-rain -c crab"
alias rrcc="rusty-rain -c cards"
alias rrd="rusty-rain -c dominosv"
alias rrj="rusty-rain -c jap"
alias rrm="rusty-rain -c moon"
alias rrn="rusty-rain -c numbers"
alias rrs="rusty-rain -c shapes"

alias sr='fd --type file -x sd' # search replace in directory
alias srp='fd --type file -x sd -p' # search replace in directory practice
alias sc="maim -s | xclip -selection clipboard -target image/png"
alias sni='snap install'
alias snr='snap remove'
alias sshb="ssh -t thor@$IP_LILBIRB"
alias sshl="ssh -t thor@$IP_LILBIRB"
alias sshs="ssh -t thor@$IP_STARCHY"
alias sshh="ssh -t thor@$IP_HOME" 
alias sshzb="ssh -t thor@$IP_LILBIRB ZDOTDIR=.zsh.d zsh"
alias sshzl="ssh -t thor@$IP_LILBIRB ZDOTDIR=.zsh.d zsh"
alias sshzs="ssh -t thor@$IP_STARCHY ZDOTDIR=.zsh.d zsh"
alias sshzh="ssh -t thor@$IP_HOME ZDOTDIR=.zsh.d "
alias sz='source ~/.zsh.d/.zshrc'
alias sza='source ~/.zsh.d/alias.sh'
alias spot=spt # spotify-tui

alias top='btm' # kinky
alias tw='rainbowstream' # terminal twitter client, kinda shit tho
alias thes='moby' # thesaurus
alias trashout="rm -rf $HOME/.trash/*"
alias tor="flatpak run com.github.micahflee.torbrowser-launcher"
alias tf="taplo fmt"

alias v='vi'
alias va='vi ~/.config/alacritty/alacritty.yml'
alias vb='vi ~/.setup/unsorted.sh'
alias vbi='vi ~/.setup/install.sh'
alias vbu='vi ~/.setup/install.sh'
alias vcg='vi ~/.cargo/cargo-generate.toml'
alias vd='vi ~/.files/install.conf.yaml'
alias vdp='vi ~/.files/private/install.conf.yaml'
alias vds='vi ~/.files/root/install.conf.yaml'
alias vdr='vi ~/.files/root/install.conf.yaml'
alias veb="vi ~/.config/espanso/match/base.yml"
alias vec="vi ~/.config/espanso/match/code.yml"
alias vel="vi ~/.config/espanso/match/latex.yml"
alias vem="vi ~/.config/espanso/match/mermaid.yml"
alias veo="vi ~/.config/espanso/match/obsidian.yml"
alias vet="vi ~/.config/espanso/match/thor.yml"
alias vj='vi ~/.config/zellij/config.yaml'
alias vo='vi ~/note/.obsidian.vimrc'
# OMZ: vsc+ vscode
alias vtmpl='vi ~/r/tmpl/base/Cargo.toml'
alias vv='vi ~/.vimrc'
alias vz='vi ~/.zsh.d/.zshrc'
alias vza='vi ~/.zsh.d/alias.sh'

alias zj=zellij
alias zotero="flatpak run org.zotero.Zotero"

alias :q=exit

## Graveyard 
#alias rr='shuf -i 0-1 -n1' # pick 0 or 1 at random
