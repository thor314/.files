function clip
    echo $argv | xclip -selection clipboard
end

function rustcheck
    echo checking (pwd)
    cargo check -q 
    cargo clippy -- -D warnings 
    cargo fmt --check 
    taplo fmt --check
end
function checkall
    for D in */
        pushd $D && rustcheck && popd 
    end
end

function gcl # clone a rust library from github
  hub clone $argv[1]
  set repo_name $(echo $argv[1] | pz "s.split('/')[-1]")
  cd $repo_name
end
abbr -a -g hcl gcl

function gsa
  git submodule add https://github.com/thor314/$argv[1] $argv[1]
end

function gg
  git add --all . --verbose
  git commit -m $argv[1]
  git push
end
function ggu # new branch
  git add --all . --verbose
  git commit -m $argv[1]
  git push --set-upstream origin (git branch --show-current)
end
function ggr # new repo
  hub create
  gityeeet $argv[1]
end

function logout
    pkill -u (whoami)
end

function makedotfile 
    mv $argv[1] "~/.files/"
    vi "~/.files/install.conf.yaml"
end

function pythonplay 
  cd $HOME/py/play
  mkdir $argv[1]
  cd $argv[1]
  touch main.py
  vi main.py .
end

function rga
  abbr -g | rg -e "$argv" | cut -d" " -f4-
end
function rgg 
  rg $argv $HOME/.files/fish/conf.d/git.md
  functions | rg -e "$argv"
end

function sync
    echo "$argv" >> ~/.files/scripts/sync.sh
end

function unset-right # call to remove the right-prompt ui element
    function fish_right_prompt 
    end
end

##
# Web dev, may deprecate soon 2024-01-12
##
function nextpls
    pnpm create next-app --ts $n
    cd $argv[1]
    # touch .tsconfig.json # next will automatically fill this
    pnpm install -D sass
    pnpm run dev &
end

function reactpls
    echo 'creating a react app with typescript, scss, material ui'
    npx create-react-app $argv[1] --template typescrypt
    cd $argv[1]
    pnpm i -S node-sass # node sass
    pnpm i -D @types/node-sass # node sass types
    mv src/App.css src/App.scss
    sd 'App.css' 'App.scss' src/App.tsx
    sd 'export default App;' '' src/App.tsx
    sd 'function App' 'export default function App' src/App.tsx
    # https://mui.com/core/
    pnpm install @mui/material @emotion/react @emotion/styled # material ui library
    code .
    pnpm start &
end

function vitepls
    echo 'creating a react app with typescript, vite, scss, material ui'
    pnpm create vite $argv[1] --template react-ts
    cd $argv[1]
    #pnpm i -S node-sass # node sass
    pnpm i -S sass
    pnpm i -D @types/node-sass # node sass types
    # # https://mui.com/core/
    # npm install @mui/material @emotion/react @emotion/styled # material ui library
    # code .
    # pnpm install && pnpm dev
end

## Deprecation
# function cgp # create a new experiment module with cg, and track it in my module-explorer
#   alias cg='cargo generate'
#   cd ~/r/play
#   cg --path ~/projects/tmpl/base --name $argv[1] 
#   cd $argv[1] 
#   cargo fmt && taplo fmt
#   git init && git add --all && git commit -m "init" 
#   hub create && gpu &
#   cd ..
#   git submodule add https://github.com/thor314/$argv[1] $argv[1]
#   git commit -m "$argv[1] init" && gp
#   code $argv[1]
# end
