# convenience functions and abbrevs for git. preface my functions with tk for name-clarity

abbr -a -g gaa "git add --all ." 
abbr -a -g gc "git add --all . --verbose && git commit -m" # standard commit
abbr -a -g gca "git add --all . -v && git commit --amend --no-edit" # useful for "I forgot to add this to my last commit but don't change message"
abbr -a -g gcaa "git commit --amend" # update message
abbr -a -g gcl "tkgcl" 
abbr -a -g gcm "git commit -m " # don't add all
abbr -a -g gg "tkgg"
abbr -a -g ggu "tkggu"
abbr -a -g ggr "tkggr"

abbr -a -g gm "git merge"
abbr -a -g gpf 'git push -f' 
abbr -a -g gpu 'git push -u origin $(git symbolic-ref --short HEAD)'  # after creating a new branch
abbr -a -g gs "git status -sb" # better git status
abbr -a -g gsa "tkgsa"

abbr -a -g hb "hub browse"
abbr -a -g hbc "hub browse -c"
abbr -a -g hpr "hub pull-request"
abbr -a -g hi "hub issue"

function tkgcl # echo "clone from github convenience"
  hub clone $argv[1]
  set repo_name (path_to_name $argv[1])
  cd $repo_name
end
abbr -a -g hcl gcl

function tkgsa # echo "submodule add convenience" # don't use http
  git submodule add git@github.com:thor314/$argv[1].git $argv[1]
end

function tkgg # git commit and push convenience
  git add --all . --verbose
  git commit -m $argv[1]
  git push
end
function tkggu # new branch
  git add --all . --verbose
  git commit -m $argv[1]
  git push --set-upstream origin (git branch --show-current)
end
function tkggr # new repo
  hub create
  gityeeet $argv[1]
end

function tkggrp # new private repo
  hub create --private
  gityeeet $argv[1]
end
