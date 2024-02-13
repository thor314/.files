#!/usr/bin/fish
# rust related helper abbrevs and functions

# big ones:
abbr -a -g ca  "cargo add"
abbr -a -g cb  'cargo build -q'
abbr -a -g cbr 'cargo build --release'
abbr -a -g cbe 'cargo bench'
abbr -a -g cc  'cargo check -q'
abbr -a -g cct 'cargo check --tests'
abbr -a -g cca "tk-cargo-checkall-clippy-fmt-taplo"
abbr -a -g cf  'cargo fmt'
abbr -a -g cgb 'tk-cargo-generate --bin'
abbr -a -g cgl 'tk-cargo-generate --lib'
abbr -a -g cn  'cargo new'
abbr -a -g cq  'cargo clean'
abbr -a -g cr  'cargo run'
abbr -a -g crl 'cargo run &> log' # need '&' to capture logs
abbr -a -g crlh 'cargo run &> log; head log' # need '&' to capture logs
abbr -a -g ct  'cargo test'
abbr -a -g ctt 'cargo test -- --nocapture'
abbr -a -g ctl 'cargo test -- --nocapture &> log' 
abbr -a -g ctlh 'cargo test -- --nocapture &> log; head log'
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
abbr -a -g cgtb 'tk-cargo-generate --bin -g cgtb'
abbr -a -g cgtl 'tk-cargo-generate --lib -g cgtl'
abbr -a -g ru rustup
abbr -a -g rpb 'tk-rust-playground-new --bin'
abbr -a -g rpl 'tk-rust-playground-new --lib'

# cargo generate
function tk-cargo-generate
  argparse --exclusive bin,lib bin lib g/gitless -- $argv
  argparse --min-args=1 -- $argv
  set name $argv[1]
  
  cargo generate --path ~/projects/tk-cargo-generate/template $_flag_bin $_flag_lib -n $name 
  cd $name
  cargo update
  cargo fmt # && taplo fmt # taplo breaks often sadface
  typos --format brief --config=/home/thor/.files/typos.toml --write-changes
  if not set -q _flag_g 
    git add --all . && git commit -m "init"
    hub create && git push -u origin (git symbolic-ref -short HEAD)
  end
  cargo check -q &
end

# check everything
function tk-cargo-checkall-clippy-fmt-taplo
  echo checking (pwd)
  cargo check -q
  cargo clippy -- -D warnings
  typos --format brief --config=/home/thor/.files/typos.toml
  cargo fmt --check
  # taplo fmt --check # taplo breaks often sadface
end

function tk-rust-playground-new
  argparse --exclusive bin,lib b/bin l/lib g/gitless -- $argv
  argparse --min-args=1 -- $argv
  set name $argv[1]
  cd ~/rust-playground || exit 1
  tk-cargo-generate $name $_flag_c $_flag_b $_flag_g
  if not set -q _flag_g 
    cd .. && tk-git-submodule-add $name && cd $name
  end
end
