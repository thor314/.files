#!/usr/bin/fish
# argument to run on my other machines to keep them in sync

if not test -f ~/.cargo/bin/taplo
  # https://taplo.tamasfe.dev/cli/introduction.html
  echo "installing taplo"
  wget https://github.com/tamasfe/taplo/releases/latest/download/taplo-linux-x86.gz
  gunzip taplo-linux-x86.gz
  chmod +x taplo-linux-x86
  mv taplo-linux-x86 ~/.cargo/bin/taplo
end

if not type -q gi
  # https://github.com/oh-my-fish/plugin-gi
  echo "updating fish plugin gi"
  fisher install oh-my-fish/plugin-gi
  gi update-completions
end

if test -L ~/.config/Code/User/settings.json
  echo "unlink vscode symlinks, which are i have merge conflicts with now every day"
  set CODE ~/.config/Code/User
  cp ~/.private/vscode $CODE
  rm -rf $CODE/{settings.json, keybindings.json, snippets}
  cp $CODE/vscode/* $CODE
end

if not test -f ~/.cargo/bin/cargo-binstall
  cargo binstall cargo-binstall # fast binary installer, don't build from source
end

if not test -f /home/thor/.local/share/nvm/v20.6.1/bin/prettier
  npm install -g prettier
end
  
# zellij - buggy to start, and installation options are crap
# if not test -f ~/.local/bin/zellij
#     wget https://github.com/zellij-org/zellij/releases/download/v0.39.2/zellij-x86_64-unknown-linux-musl.tar.gz
#     tar -xvf zellij*.tar.gz
#     chmod +x zellij
#     mv zellij ~/.local/bin
#     rm zellij*
#     # cargo install --locked zellij # bugged install
# end

# require password
# sudo apt -y install libnotify-bin
# sudo apt -y install keychain

