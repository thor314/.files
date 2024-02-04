# convenience functions and abbrevs for git. preface my functions with tk for name-clarity

abbr -a -g gaa "git add --all ." 
abbr -a -g gc "git add --all . --verbose && git commit -m" # standard commit
abbr -a -g gca "git add --all . -v && git commit --amend --no-edit" # useful for "I forgot to add this to my last commit but don't change message"
abbr -a -g gcaa "git commit --amend" # update message
abbr -a -g gcl "tk-git-clone-and-cd"
abbr -a -g gcm "git commit -m " # don't add all

abbr -a -g gg "tk-git-add-all-commit-message-push" 
abbr -a -g gsuc "tk-git-submodule-update-commits-recursive" 
abbr -a -g ggu "tk-git-add-all-commit-message-push-create-upstream-branch" 
abbr -a -g gguu "tk-git-add-all-commit-message-push-create-repo" 
abbr -a -g ggr "tk-git-add-all-commit-message-push-create-repo" 

abbr -a -g gm "git merge"
abbr -a -g gpf 'git push -f' 
abbr -a -g gpu 'git push -u origin $(git symbolic-ref --short HEAD)'  # after creating a new branch
abbr -a -g gs "git status -sb" # better git status
abbr -a -g gsua "tk-git-submodule-add"
abbr -a -g gsurm "tk-git-submodule-replace"

abbr -a -g hb "hub browse"
abbr -a -g hbc "hub browse -c"
abbr -a -g hcl "tk-git-clone-and-cd"
abbr -a -g hpr "hub pull-request"
abbr -a -g hi "hub issue"

function tk-git-clone-and-cd # echo "clone from github convenience"
  argparse --min-args=1 -- $argv
  hub clone $argv[1] --recursive
  set repo_name (tk-path-to-name $argv[1])
  cd $repo_name
end

function tk-git-submodule-add -d "add submodule to gitmodules" 
  # reminder to not use http, all sorts of weird cloning and pushing issues.
  argparse --min-args=1 -- $argv
  set repo_name (tk-path-to-name $argv[1])
  git submodule add git@github.com:thor314/$repo_name.git $argv[1]
  git add --all . && git commit -m "added submodule $repo_name"
end

# 2024-02-03 - untested
function tk-git-submodule-foreach -d "better git submodule foreach"
  argparse --min-args=1 -- $argv
  set dir $argv[1]
  set commands $argv[2..]
  pushd dir
  set -l modules (git config --file .gitmodules --get-regexp path | awk '{ print $2 }')
  for m in $modules ; pushd m && (commands) && popd ; end
  popd 
end
# a git helper that removes a submodule

function tk-git-submodule-replace # for when accidentally committed a submodule instead of adding it
  argparse --min-args=1 -- $argv
  echo "warn: maybe buggy"
  set repo_name (tk-path-to-name $argv[1])
  git rm -r --cached $repo_name
  mv $repo_name ../$repo_name.tmp.d
  git add --all . && git commit -m "removed $repo_name"
  mv ../$repo_name.tmp.d $repo_name
  tk-git-submodule-add $repo_name
end

function tk-git-submodule-update-commits-recursive
  # recursively update a submodule dir, (bottom up)
  echo todo
end

function tk-git-add-all-commit-message-push # git commit and push convenience
  argparse --min-args=1 -- $argv
  git add --all . --verbose
  git commit -m $argv[1]
  git push
end
function tk-git-add-all-commit-message-push-create-upstream-branch # new branch
  argparse --min-args=1 -- $argv
  git add --all . --verbose
  git commit -m $argv[1]
  git push --set-upstream origin (git branch --show-current)
end
function tk-git-add-all-commit-message-push-create-repo # new repo
  argparse -p/private -- $argv
  argparse --min-args=1 -- $argv
  hub create $_flag_p # optional arg to allow private; i.e. -p, pass to hub create
  tk-git-add-all-commit-message-push-create-upstream-branch $argv[1]
end
