#!/usr/bin/fish
# convenience functions and abbrevs for git. preface my functions with tk for name-clarity

abbr -a -g gaa "git add --all ."
abbr -a -g gc "git add --all . --verbose && git commit -m" # standard commit
abbr -a -g gca "git add --all . -v && git commit --amend --no-edit" # useful for "I forgot to add this to my last commit but don't change message"
abbr -a -g gcaa "git commit --amend" # update message
abbr -a -g gcl tk-git-clone-and-cd
abbr -a -g gcm "git commit -m " # don't add all

abbr -a -g gg tk-git-add-all-commit-message-push
abbr -a -g gsuc tk-git-submodule-update-commits-recursive
abbr -a -g ggu tk-git-add-all-commit-message-push-create-upstream-branch
abbr -a -g gguu tk-git-add-all-commit-message-push-create-repo
abbr -a -g ggr tk-git-add-all-commit-message-push-create-repo

abbr -a -g gm "git merge"
abbr -a -g gms "git merge --squash"
abbr -a -g gpf 'git push -f'
abbr -a -g gpu 'git push -u origin $(git symbolic-ref --short HEAD)' # after creating a new branch
abbr -a -g gs "git status -sb" # better git status
abbr -a -g gsua tk-git-submodule-add

abbr -a -g hb "hub browse"
abbr -a -g hbc "hub browse -c"
abbr -a -g hcl tk-git-clone-and-cd
abbr -a -g hpr "hub pull-request"
abbr -a -g hi "hub issue"

contains $HOME/.cargo/bin $PATH || set PATH $PATH $HOME/.cargo/bin # i.e. if run from cron
source $HOME/.files/fish/functions.fish # so we may use our helpers

function tk-git-clone-and-cd -d "clone repo and cd into it"
    argparse --min-args=1 -- $argv || return 1
    gh repo clone $argv
    set repo_name (tk-path-to-name $argv)
    set repo_name (string replace ".git" "" $repo_name)
    cd $repo_name
end

function tk-git-add-all-commit-message-push -d "add all, commit -m and push"
    argparse --min-args=1 -- $argv || return 1
    git add --all . --verbose
    git commit -m $argv[1]
    git push
end
function tk-git-add-all-commit-message-push-create-upstream-branch -d "add all, commit -m, and push create upstream branch"
    argparse --min-args=1 -- $argv || return 1
    git add --all . --verbose
    git commit -m $argv[1]
    git push --set-upstream origin (git branch --show-current)
end
function tk-git-add-all-commit-message-push-create-repo -d "add all, commit -m, and create repo to push to"
    argparse p/private -- $argv
    argparse --min-args=1 -- $argv || return 1
    hub create $_flag_p # optional arg to allow private; i.e. -p, pass to hub create
    tk-git-add-all-commit-message-push-create-upstream-branch $argv[1]
end

# Submodule replacements
# We hate git submodules, but we also hate git-subtree
# 2024-02-07 untested
function tk-git-submodule-init -d "init submodules recursively, pull if exists, clone otherwise"
    if not test -f .gitmodules
        echo "ERROR: .gitmodules file not found in (pwd)" && return 1
    else if not test -e .git
        echo "ERROR: .git not found in (pwd)" && return 1
    end

    # HACK: iterate over gitmodules, obtaining url and path name
    rg --only-matching -- 'path = (.+)' .gitmodules | string replace 'path = ' '' | while read -l path
        set -l name $(string split "/" $path)[-1]
        set -l url (rg --only-matching -- "url = (.+)$name.*.git" .gitmodules | string replace 'url = ' '')

        if not test -d $path
            echo "INFO: Directory does not exist. Cloning submodule $path..."
            hub clone $url $path \ 
            if not git clone $url $path
                echo "WARNING: Failed to clone $path from $url"
                continue # log warning but do not exit
            end
        else
            if test (count (ls $path))
                echo "INFO: Repository at $path is empty. Removing and re-cloning..."
                rm -rf $path
                if not git clone $url $path
                    echo "WARNING: Failed to re-clone $path from $url"
                    continue
                end
            else
                echo "INFO: Pulling for submodule $path..."
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
    if not test -f .gitmodules
        echo "ERROR: .gitmodules file not found in (pwd)" && return 1
    else if not test -e .git
        echo "ERROR: .git not found in (pwd)" && return 1
    end

    # Find and process all directories containing a .git directory
    for dir in (fdfind -H  ".git\$" --prune)[2..] # skip current dir. Footgun: only run this from a .git root.
        set repo_path (dirname $dir)
        tk-git-submodule-add $repo_path
    end

    # Pull updates for all known submodules
    for submodule in (rg '\[submodule' .gitmodules -A2)
        set path (echo $submodule | rg 'path')[3]
        if test -d $path
            echo "INFO: Pulling updates for submodule $path..."
            if not git -C $path pull
                echo "WARNING: Failed to update $path"
                continue
            end
        end
    end
end

function tk-git-submodule-clean -d "For all .git subdirectories, if not tracked in .gitmodules, remove the directory"
    if not test -f .gitmodules
        echo "ERROR: .gitmodules file not found in (pwd)" && return 1
    end
    if not test -e .git
        echo "ERROR: .git not found in (pwd)" && return 1
    end

    # Find all directories containing a .git directory
    for dir in (fdfind -H ".git\$" --prune)[2..] # Skip the current dir. Footgun: only run this from a .git root.
        set repo_path (dirname $dir)

        # Check if the directory is known in .gitmodules
        if not rg -q "path = $repo_path" .gitmodules
            echo "INFO: $repo_path is not known by .gitmodules. Removing it..."
            rm -rf $repo_path
            # Optionally, remove it from git cache if it was previously added
            git rm --cached $repo_path >/dev/null 2>&1 || true
            # If submodule was previously committed, consider a commit to remove it
            # git commit -m "Removed untracked submodule $repo_path"
        else
            echo "INFO: $repo_path is tracked in .gitmodules."
        end
    end
end

function tk-git-submodule-add -d "add submodule to gitmodules"
    if not test -e .git
        echo "ERROR: .git not found in (pwd)" && return 1
    end
    if not test -f .gitmodules
        echo "INFO.gitmodules file not found in $(pwd), adding it" && touch .gitmodules
    end
    argparse u/url= -- $argv
    argparse --min-args=1 -- $argv || return 1
    set path $argv[1] # path may have form "/dir/reponame" or just "reponame"
    set repo (tk-path-to-name $path) || return 1
    if set -q _flag_u
        set url $_flag_u
    else
        set url git@github.com:thor314/$repo.git
    end

    set already_submodule (rg "path = $path" .gitmodules)
    # echo module: $already_submodule
    if not test $already_submodule
        echo "INFO: $repo is not known by .gitmodules, adding it..."

        set already_cached (git log --format="%H" -- "$repo" | tail -1)
        # echo cache: $already_cached
        if test "$already_cached"
            echo "INFO: $repo mistakenly added to .git, removing it from working index..."
            git rm --cached $path >/dev/null 2>&1 || true
            mv $path $HOME/tmp
            git add $path && git commit -m "removed: $repo from index"
            mv /$HOME/tmp/$repo $path
        end

        git submodule add $url $path || echo "ERROR: git submodule add logic error" && return 1
        git add $path && git commit -m "submodule added: $repo"
    else
        echo "WARNING: submodule $repo already added" && return 1
    end
end
