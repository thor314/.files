function cck
    echo checking (pwd)
    cargo check -q 
    cargo clippy -- -D warnings 
    cargo fmt --check 
    taplo fmt --check
end
function checkall
    for D in */
        pushd $D && cck && popd 
    end
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
    cd $1 
    # touch .tsconfig.json # next will automatically fill this
    pnpm install -D sass
    pnpm run dev &
end

function reactpls
    echo 'creating a react app with typescript, scss, material ui'
    npx create-react-app $1 --template typescrypt
    cd $1
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
    pnpm create vite $1 --template react-ts
    cd $1
    #pnpm i -S node-sass # node sass
    pnpm i -S sass
    pnpm i -D @types/node-sass # node sass types
    # # https://mui.com/core/
    # npm install @mui/material @emotion/react @emotion/styled # material ui library
    # code .
    # pnpm install && pnpm dev
end

