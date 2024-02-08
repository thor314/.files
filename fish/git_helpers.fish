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
  argparse p/private -- $argv
  argparse --min-args=1 -- $argv
  hub create $_flag_p # optional arg to allow private; i.e. -p, pass to hub create
  tk-git-add-all-commit-message-push-create-upstream-branch $argv[1]
end

# Submodule replacements
# We hate git submodules, but we also hate git-subtree
# 2024-02-07 untested
function tk-git-submodule-init -d "init submodules recursively, pull if exists, clone otherwise"
  if not test -f .gitmodules ; echo "ERROR: .gitmodules file not found in (pwd)" && return 1 ;
  else if not test -e .git ; echo "ERROR: .git not found in (pwd)" && return 1 ; end

  # HACK: iterate over gitmodules, obtaining url and path name
  rg --only-matching -- 'path = (.+)' .gitmodules | string replace 'path = ' '' | while read -l path
    set -l name $(string split "/" $path)[-1]
    set -l url (rg --only-matching -- "url = (.+)$name.*.git" .gitmodules | string replace 'url = ' '')

    if not test -d $path
      echo "Directory does not exist. Cloning submodule $path..."
      hub clone $url $path \ 
      if not git clone $url $path
        echo "WARNING: Failed to clone $path from $url" 
        continue # log warning but do not exit
      end
    else
      if test (count (ls $path))
        echo "Repository at $path is empty. Removing and re-cloning..."
        rm -rf $path
        if not git clone $url $path
          echo "WARNING: Failed to re-clone $path from $url"
          continue 
        end 
      else
        echo "Pulling for submodule $path..."
        if not git -C $path pull
          echo "WARNING: Failed to update $path"
          continue 
        end
      end     
    end
  end
end

# 02-07 untested
function tk-git-submodule-update -d "Update submodules recursively, add untracked repos to .gitmodules, and pull updates"
  if not test -f .gitmodules ; echo "ERROR: .gitmodules file not found in (pwd)" && return 1 ;
  else if not test -e .git ; echo "ERROR: .git not found in (pwd)" && return 1 ; end

  # Find and process all directories containing a .git directory
  for dir in (fdfind -H  ".git\$" --prune)[2..] # skip current dir. Footgun: only run this from a .git root.
    set repo_path (dirname $dir) 
    
    if not rg -q "path = $repo_path" .gitmodules
      echo "INFO: $repo_path is not known by .gitmodules. Adding it..."

      # Ensure repo is not mistakenly cached
      git rm --cached $repo_path >/dev/null 2>&1 || true
      set url (git -C $repo_path config --get remote.origin.url)
      if test -n "$url"
        git submodule add $url $repo_path
        git add .gitmodules
        git commit -m "Added submodule $repo_path"
      else
        echo "WARNING: Unable to find remote URL for $repo_path"
        continue
      end
    end
  end

  # Pull updates for all known submodules
  for submodule in (rg '\[submodule' .gitmodules -A2)
    set path (echo $submodule | rg 'path')[3]
    if test -d $path
      echo "Pulling updates for submodule $path..."
      if not git -C $path pull
        echo "WARNING: Failed to update $path"
        continue
      end
    end
  end
end


function tk-git-submodule-clean -d "Update submodules recursively, add untracked repos to .gitmodules, and pull updates"
  if not test -f .gitmodules ; echo "ERROR: .gitmodules file not found in (pwd)" && return 1 ;
  else if not test -e .git ; echo "ERROR: .git not found in (pwd)" && return 1 ; end

  # Find and process all directories containing a .git directory
  for dir in (fdfind -H  ".git\$" --prune)[2..] # skip current dir. Footgun: only run this from a .git root.
    set repo_path (dirname $dir) 
    
    if not rg -q "path = $repo_path" .gitmodules
      echo "INFO: $repo_path is not known by .gitmodules. Adding it..."

      # Ensure repo is not mistakenly cached
      git rm --cached $repo_path >/dev/null 2>&1 || true
      set url (git -C $repo_path config --get remote.origin.url)
      if test -n "$url"
        git submodule add $url $repo_path
        git add .gitmodules
        git commit -m "Added submodule $repo_path"
      else
        echo "WARNING: Unable to find remote URL for $repo_path"
        continue
      end
    end
  end

  # Pull updates for all known submodules
  for submodule in (rg '\[submodule' .gitmodules -A2)
    set path (echo $submodule | rg 'path')[3]
    if test -d $path
      echo "Pulling updates for submodule $path..."
      if not git -C $path pull
        echo "WARNING: Failed to update $path"
        continue
      end
    end
  end
end

function tk-git-submodule-add -d "add submodule to gitmodules" 
  # reminder to not use http, all sorts of weird cloning and pushing issues.
  argparse l/local -- $argv
  argparse --min-args=1 -- $argv
  set repo_name (tk-path-to-name $argv[1])
  git submodule add git@github.com:thor314/$repo_name.git $argv[1]
  if not set -q _flag_l 
    git add --all . && git commit -m "added submodule $repo_name"
  end
end
abbr -a -g "git submodule add" tk-git-submodule-add

# 2024-02-03 - todo
function tk-git-submodule-foreach -d "better git submodule foreach"
  echo "not yet implemented"
  exit 1
end

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

