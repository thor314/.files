# convenience functions and abbrevs for git 

abbr -a -g gc "git add --all . --verbose && git commit -m" # standard commit
abbr -a -g gca "git add --all . -v && git commit --amend --no-edit" # useful for "I forgot to add this to my last commit but don't change message"
abbr -a -g gaa "git add --all ." 
abbr -a -g gcm "git commit -m " # don't add all
abbr -a -g gcaa "git commit --amend" # update message
abbr -a -g gm "git merge"
abbr -a -g gpf 'git push -f' 
abbr -a -g gpu 'git push -u origin $(git symbolic-ref --short HEAD)'  # after creating a new branch
abbr -a -g gs "git status -sb" # better git status

abbr -a -g hbr "hub browse"
abbr -a -g hpr "hub pull-request"
abbr -a -g hi "hub issue"
