#!/usr/bin/fish
# argument to run on my other machines to keep them in sync

if not type -q taplo
  # https://taplo.tamasfe.dev/cli/introduction.html
  wget https://github.com/tamasfe/taplo/releases/latest/download/taplo-linux-x86.gz
  gunzip taplo-linux-x86.gz
  chmod +x taplo-linux-x86
  mv taplo-linux-x86 ~/.cargo/bin/taplo
end

if not type -q gi
  # https://github.com/oh-my-fish/plugin-gi
  fisher install oh-my-fish/plugin-gi
  gi update-completions
end

