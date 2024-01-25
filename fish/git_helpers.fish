# convenience functions and abbrevs for git. preface my functions with tk for name-clarity

abbr -a -g gaa "git add --all ." 
abbr -a -g gc "git add --all . --verbose && git commit -m" # standard commit
abbr -a -g gca "git add --all . -v && git commit --amend --no-edit" # useful for "I forgot to add this to my last commit but don't change message"
abbr -a -g gcaa "git commit --amend" # update message
abbr -a -g gcl "tk-git-clone-and-cd"
abbr -a -g gcm "git commit -m " # don't add all

abbr -a -g gg "tk-git-add-all-commit-message-push" 
abbr -a -g ggu "tk-git-add-all-commit-message-push-create-upstream-branch" 
abbr -a -g gguu "tk-git-add-all-commit-message-push-create-repo" 
abbr -a -g ggr "tk-git-add-all-commit-message-push-create-repo" 

abbr -a -g gm "git merge"
abbr -a -g gpf 'git push -f' 
abbr -a -g gpu 'git push -u origin $(git symbolic-ref --short HEAD)'  # after creating a new branch
abbr -a -g gs "git status -sb" # better git status
abbr -a -g gsua "tk-git-submodule-add"

abbr -a -g hb "hub browse"
abbr -a -g hbc "hub browse -c"
abbr -a -g hpr "hub pull-request"
abbr -a -g hi "hub issue"

function tk-git-clone-and-cd # echo "clone from github convenience"
  hub clone $argv[1]
  set repo_name (path_to_name $argv[1]) # path-to-name is my helper function 
  cd $repo_name
end
abbr -a -g hcl gcl

function tk-git-submodule-add # reminder to not use http, all sorts of weird cloning and pushing issues.
  git submodule add git@github.com:thor314/$argv[1].git $argv[1]
end

function tk-git-add-all-commit-message-push # git commit and push convenience
  git add --all . --verbose
  git commit -m $argv[1]
  git push
end
function tk-git-add-all-commit-message-push-create-upstream-branch # new branch
  git add --all . --verbose
  git commit -m $argv[1]
  git push --set-upstream origin (git branch --show-current)
end
function tk-git-add-all-commit-message-push-create-repo # new repo
  hub create $argv[2] # optional arg to allow private; i.e. -p, pass to hub create
  tk-git-add-all-commit-message-push-create-upstream-branche $argv[1]
end
