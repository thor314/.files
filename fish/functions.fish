# Thor's lil functions

function clip
    echo $argv | xclip -selection clipboard
end

function copyfile
    bat $argv[1] | xclip -selection clipboard
end

function logout
    pkill -u (whoami)
end

function make_dotfile 
    set dotpath $argv[1]
    set dotname (path_to_name $dotpath)
    mv $dotfile "~/.files/"
    echo "adding #    $dotpath: $dotname   to dotbot config"
    echo "#    $dotpath: $dotname" >> ~/.files/install.conf.yaml
    vi "~/.files/install.conf.yaml"
end

function path_to_name
    # obtain the trailing directory or filename from a path; trim the optional trailing slash 
    set path $argv[1]
    set no_trailing_slash_path (string trim -r -c '/' -- $path)
    set last_item (string replace -r '.*/' '' --  $no_trailing_slash_path)
    echo $last_item
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

function sync
    echo "$argv" >> ~/.files/scripts/sync.fish
end

function unset-right # call to remove the right-prompt ui element
    function fish_right_prompt 
    end
end

