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
abbr -a -g cgtb 'tk-cargo-generate --bin cgtb'
abbr -a -g cgtl 'tk-cargo-generate --lib cgtl'
abbr -a -g ru rustup

# cargo generate
function tk-cargo-generate
  if not test (count $argv) -eq 2
    echo "Error: Function requires 2 arguments."
    return 1
  end
  set binlib $argv[1]
  set name $argv[2]
  
  cargo generate --path ~/projects/tk-cargo-generate/template $binlib -n $name 
  cd $name
  cargo update && cargo fmt && taplo fmt
  git init && git add --all . && git commit -m "init"
  cargo check -q &
end

# check everything
function tk-cargo-checkall-clippy-fmt-taplo
  echo checking (pwd)
  cargo check -q
  cargo clippy -- -D warnings
  cargo fmt --check
  taplo fmt --check
end

function tk-rust-playground-new
  set binlib $argv[1]
  set name $argv[2]
  cd ~/rust-playground || exit 1
  tk-cargo-generate $binlib $name
  pushd .. && tk-git-submodule-add $name && popd



end
