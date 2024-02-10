#!/usr/bin/fish
# abbrevs and functions related to web dev stuff

abbr -a -g nra 'npm-run-all' # run npm-scripts in para/seq.  https://www.npmjs.com/package/npm-run-all
abbr -a -g nrd 'npm run dev' 
abbr -a -g pfa prettier --write "**/*.{js,jsx,ts,tsx}" # format all

abbr -a -g wcn "tk-web-create-next" 
abbr -a -g wcr "tk-web-create-react"
abbr -a -g wcv "tk-web-create-vite"


function tk-web-create-next
    pnpm create next-app --ts $n
    cd $argv[1]
    # touch .tsconfig.json # next will automatically fill this
    pnpm install -D sass
    pnpm run dev &
end

function tk-web-create-react
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

function tk-web-create-vite
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

