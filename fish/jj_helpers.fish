# Repository setup
abbr -a jgi 'jj git init --colocate' # Initialize jj in existing git repo, colocating the stores

# Navigation and viewing
abbr -a js 'jj status'
abbr -a jl 'jj log'
abbr -a jsh 'jj show'
abbr -a jf 'jj git fetch'

# New commits and branches
abbr -a jn 'jj new'
abbr -a jnm 'jj new -m'
abbr -a jnB 'jj new -B'
abbr -a jnBm 'jj new -B -m'

# Description management
abbr -a jd 'jj describe'
abbr -a jdm 'jj describe -m'

# Navigation and editing
abbr -a jxe 'jj next --edit'
abbr -a jve 'jj prev --edit'
abbr -a je 'jj edit'
abbr -a jsq 'jj squash'

# Branch and remote operations
abbr -a jb 'jj branch'
abbr -a jbc 'jj branch create'
abbr -a jbl 'jj branch list'
abbr -a jbs 'jj branch set'
abbr -a jp 'jj git push --branch'
abbr -a jpf 'jj git push -f --branch'

# Rebasing
abbr -a jrb 'jj rebase -d'
abbr -a jrm 'jj rebase -d main'

# Workspace management
abbr -a jw 'jj workspace'
