#!/bin/fish
# Thor's lil functions

function tk-copyline -d "copy line to clipboard"
  echo $argv | clip -selection clipboard
end

function tk-copyfile -d "copy file to tk-clipboard"
  bat $argv | clip -selection -clipboard
end

function tk-setfile -d "set arg1 with the contents of file without mangling newlines"
  set $argv[1] (string collect --no-trim-newlines < $argv[2])
end

function tk-logout
  pkill -u (whoami)
end
# abbr -a -g logout tk-logout

function tk-make-dotfile 
  set dotpath $argv[1]
  set dotname (tk-path-to-name $dotpath)
  mv $dotfile "~/.files/"
  echo "adding #    $dotpath: $dotname   to dotbot config"
  echo "#    $dotpath: $dotname" >> ~/.files/install.conf.yaml
  vi "~/.files/install.conf.yaml"
end

function tk-path-to-name
  # obtain the trailing directory or filename from a path; trim the optional trailing slash 
  set path $argv[1]
  set no_trailing_slash_path (string trim -r -c '/' -- $path)
  set last_item (string replace -r '.*/' '' --  $no_trailing_slash_path)
  echo $last_item
end 

function tk-rga
  rg -e "$argv" | cut -d" " -f4-
end
abbr -a -g rga "tk-rga"

function tk-save-sync
  echo "$argv" >> ~/.files/scripts/sync.fish
end
abbr -a -g tkss "tk-save-sync"

function tk-save-unsorted
  echo "$argv" >> ~/.setup/unsorted.sh
end
abbr -a -g tksu "tk-save-unsorted"

# unused
function tk-unset-right -d "call to remove the right-prompt ui element"
  function fish_right_prompt 
  end
end
