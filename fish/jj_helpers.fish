# Repository setup
abbr -a ji 'jj git init --colocate' # Initialize jj in existing git repo, colocating the stores
abbr -a jbtm 'jj bookmark track main@origin' # track main branch

# Navigation and viewing
abbr -a jdi 'jj diff'
abbr -a js 'jj status'
abbr -a jl 'jj log'
abbr -a jsh 'jj show'
abbr -a jf 'jj git fetch'

# New commits and named bookmarks
abbr -a jn 'jj new'
abbr -a jnm 'jj new -m'
abbr -a jnB 'jj new -B'
abbr -a jnBm 'jj new -B -m'

# Description management
abbr -a jd 'jj describe -m'

# Navigation and editing
abbr -a jxe 'jj next --edit'
abbr -a jve 'jj prev --edit'
abbr -a je 'jj edit'
abbr -a jsq 'jj squash'

# Branch and remote operations
abbr -a jb 'jj bookmark'
abbr -a jbc 'jj bookmark create'
abbr -a jbl 'jj bookmark list'
abbr -a jbs 'jj bookmark set'
abbr -a jp 'jj git push'
abbr -a jpm 'jj bookmark set main; jj git push'

# Rebasing
abbr -a jrb 'jj rebase -d'
abbr -a jrm 'jj rebase -d main'

# Workspace management
abbr -a jw 'jj workspace'
