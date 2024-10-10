#!/usr/bin/env fish

# Thor's lil functions

function tk-copyline -d "copy line to clipboard"
    argparse q/quiet -- $argv
    argparse --min-args=1 -- $argv || return 1
    echo $argv | xclip -i
    if not set -q _flag_q
        echo -e "clipboard: $(xclip -o)"
    end
end

function tk-copyfile -d "copy file to tk-clipboard"
    argparse q/quiet -- $argv
    argparse --min-args=1 -- $argv || return 1
    bat $argv | xclip -i
    if not set -q _flag_q
        echo -e "clipboard: \n$(xclip -o)"
    end
end

function tk-setfile -d "set arg1 with the contents of file without mangling newlines"
    argparse --min-args=2 -- $argv || return 1
    set $argv[1] (string collect --no-trim-newlines < $argv[2])
end

function tk-keychain -d "configure keychain to correctly initialize and load my ssh-key"
    argparse --min-args=1 -- $argv || return 1
    set key $argv[1]
    if not test -f $key
        echo "WARNING! no such key: $key" && exit 1
    end
    # SHELL must be set to fish, or eval will flunk (very very frightning me)
    set SHELL /usr/bin/fish
    # set up the ssh-agent if none found, else re-use existing agent
    # -Q is "Quick"--use existing agents if one exists
    eval (keychain --eval -Q) &>>/dev/null
    # and add my key to the session if not yet added
    keychain --nogui $key -Q &>>/dev/null
end

function tk-make-dotfile
    argparse q/quiet -- $argv
    argparse --min-args=1 -- $argv || return 1
    set dotpath $argv[1]
    set dotname (tk-path-to-name $dotpath)
    mv $dotfile "~/.files/"
    if not set -q _flag_q
        echo "adding # $dotpath: $dotname to dotbot config"
    end
    echo "#    $dotpath: $dotname" >>~/.files/install.conf.yaml
    vi "~/.files/install.conf.yaml"
end

function tk-path-to-name -d "obtain the trailing directory or filename from a path; trim the optional trailing slash"
    argparse --min-args=1 -- $argv || return 1
    set -l segments (string split '/' -- $argv)
    set -l last_segment ''
    for segment in $segments
        if test -n "$segment" # don't take empty strings
            set last_segment $segment
        end
    end
    if test -n "$last_segment"
        echo $last_segment
    else
        echo $argv
    end
end

function tk-append-suffix -d "append .suffix to a file or path"
    argparse --min-args=2 -- $argv || return 1
    set path (realpath $argv[1])
    echo {$path}$argv[2]
end

function tk-strip-suffix -d "remove .suffix from a file or path"
    argparse --min-args=1 -- $argv || return 1
    set path (realpath $argv[1])
    set out (string split -r '.' -- $argv[1])[..-2]
    if test (count $out) -ne 1
        echo "path contains more than one ."
        exit 1
    end
    echo $out
end

function tk-rga
    argparse --min-args=1 -- $argv || return 1
    echo searching abbrevs for $argv[1]
    abbr | rg $argv[1]
end
abbr -a -g rga tk-rga

function tk-save-sync
    argparse --min-args=1 -- $argv || return 1
    echo "$argv" >>~/.cron/help_scripts/sync.fish
end
abbr -a -g tkss tk-save-sync

function tk-save-unsorted
    argparse --min-args=1 -- $argv || return 1
    echo "$argv" >>~/.setup/unsorted.sh
end
abbr -a -g tksu tk-save-unsorted

# unused
function tk-unset-right -d "call to remove the right-prompt ui element"
    function fish_right_prompt
    end
end
