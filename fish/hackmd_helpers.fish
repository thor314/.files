#!/usr/bin/fish
# hackmd convenience

function tk-hackmd-publish -d "publish file to hackmd and open"
  set -l file $argv[1]
  set -l content (string collect --no-trim-newlines < $file) 
  # create the note, save its id
  # read/write options: owner, signed_in, guest
  # comment options   : disabled, forbidden, owners, signed_in_users, everyone
  set noteId (hackmd-cli notes create --content=$content --readPermission=guest --writePermission=signed_in --commentPermission=everyone --no-header | string split " ")[2]
  echo created note with id: $noteId
  firefox https://hackmd.io/$noteId
end
abbr -a -g tkhp "tk-hackmd-publish"

function tk-hackmd-update -d "update note NOTEID on hackmd with the contents of FILE." 
  set -l noteId $argv[1]
  set -l file $argv[2]
  set content (string collect --no-trim-newlines < $file) 
  # create the note, save its id
  hackmd-cli notes update --noteId=noteId --content=$content 
  echo updated note with id: $noteId
  firefox https://hackmd.io/$noteId
end
abbr -a -g tkhu "tk-hackmd-update"

abbr -a -g tkhg "hackmd-cli export --noteId=\$noteId"
abbr -a -g tkhd "hackmd-cli notes delete --noteId=\$noteId"

function tk-hackmd-rg -d "look for the note id of file with TITLE"
  set -l title $argv[1]
  # hackmd-cli notes --no-header | rg $title 
  set -Ll notes (hackmd-cli notes --no-header | rg $title | string split " .*")
  set -g noteId (string split " " $notes)[2]
  echo "notes matching that filter:"
  for l in $notes ; echo -e "$l\n" ; end
  echo "saving to noteId: $noteId"
end
abbr -a -g tkhrg "tk-hackmd-rg"
  

