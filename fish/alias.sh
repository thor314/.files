#!/bin/sh
# Thor's aliases and convenience functions, mostly alphebetized.
# aliases a poor man's tldr: grep through my aliases for examples.
# define functions and bind aliases to them to include them in rg results.

# OMZ: note aliases: -,.,..,...,1,2,3,......
# OMZ ubuntu apt: rga ^a+ ; notable: agi,agr,aguu,
# unalias git 2> /dev/null # the `hub` zshell plugin undesirably sets this

# TEMP
alias cdb="cd ~/r/tmpl/base/"
alias ck="echo \"checking $(pwd)\" && cargo check -q && cargo clippy -- -D warnings && cargo fmt --check && taplo fmt --check"
function checkall 
  for D in */
   pushd $D && ck && popd 
  end
end


# PERMANENT(ish)
alias ags="apt-cache search"
alias acs="apt-cache search"

alias bat="bat --theme=zenburn --style=plain" # plain: no line numbers
alias bu=echo "$argv" >> ~/.setup/unsorted.sh

alias cat="bat --theme=zenburn --style=plain" # i like fancy cats
alias clip=echo $1 | xclip -selection clipboard
alias c=clip
alias cb='cargo build -q'
alias cbr='cargo build --release'
alias cbe='cargo bench'
alias cc='cargo check'
alias ccq='cargo check -q'
alias cct='cargo check --tests'
# alias cc='RUSTFLAGS=-Awarnings cargo check'
# alias cc='RUSTFLAGS=-Awarnings cargo check -q'
alias cf='cargo fmt'
alias cfc="cargo fmt --all -- --check"
alias cg='cargo generate'
alias cgtb='cargo generate --path ~/r/tmpl/base --bin -n cgtbin -d async=false'
alias cgtl='cargo generate --path ~/r/tmpl/base --lib -n cgtlib -d async=false'
alias cgtab='cargo generate --path ~/r/tmpl/base --bin -n cgtabin -d async=true'
alias cgtal='cargo generate --path ~/r/tmpl/base --lib -n cgtalib -d async=true'
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
alias crypto="cointop"
alias ctop="cointop"
function cpz # copy my notes, replace a formatting issue
  cp ~/note/n-pazk* ~/zk
  set s "^%%.*noteTextColor.*"
  set f $(rg -l $s ~/zk)
  rg --passthru $s -r "" $f >> tmp.txt && mv tmp.txt $f
end
function cgp # create a new experiment module with cg, and track it in my module-explorer
  cd ~/r/play
  cg --path ~/r/tmpl/base --name $1 
  cd $1 
  cargo fmt && taplo fmt
  git init && git add --all && git commit -m "init" 
  hub create && gpu &
  cd ..
  git submodule add https://github.com/thor314/$1 $1
  git commit -m "$1 init" && gp
  code $1
end
function ccl # clone a rust library from github
  cd ~/r/clone
  hub clone $1
  set repo_name $(echo $1 | pz "s.split('/')[-1]")
  cd $repo_name
  cc
  hx .
end
 
