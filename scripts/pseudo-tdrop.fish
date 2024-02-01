#!/bin/fish
# pseudo-tdrop.fish
# This script toggles the visibility of a specified application and moves it to the current workspace.
# It accepts an application name as an input.
# 
# this script is pretty much a failure, and we have given up on it

function is_app_running
  set app_name $argv[1]
  # Get the PID of the current script
  set script_pid %self

  # Use pgrep to get all PIDs of the 'code' processes
  for pid in (pgrep -f $app_name)
    # Exclude the script's own PID
    if test $pid -ne $script_pid
      echo $app_name is running
      return 0 
    end
  end

  echo $app_name is not running
  return 1 # app is not running
end

function is_pid_hidden
  set pid $argv[1]

  # Find the window ID associated with the PID
  set window_ids (xdotool search --pid $pid)

  # If no window IDs are found, the application might not have a GUI or is not running
  if test -z "$window_ids"
    echo "No window found for PID $pid"
    exit 1
  end

  # Check each window to see if it's visible
  for wid in $window_ids
    # Use xdotool or another tool to check if the window is visible
    # This is an example and might need to be adjusted for your environment
    set window_state (xdotool getwindowgeometry $wid)
    echo $window_state, $wid

    # Implement a way to interpret the window state
    # This will depend on your specific environment and window manager
    # ...

    # Based on the interpreted state, output whether the window is hidden or visible
    # ...
  end
end


# Define a function to hide the application
function hide_app
  set app_name $argv[1]
  # Find all window IDs for the application
  set window_ids (xdotool search --onlyvisible --name $app_name)

  if test -z "$window_ids"
    echo "No visible windows found for $app_name"
    return 1
  end

  # Iterate over each window ID and minimize it
  for wid in $window_ids
    xdotool windowminimize $wid
  end

  echo "All windows for $app_name have been minimized"
end

# Define a function to unhide and move the app to the current workspace
function unhide_and_move_app
  set app_name $argv[1]
  # Find all window IDs for the application, regardless of their visibility
  set window_ids (xdotool search --name $app_name)

  if test -z "$window_ids"
    echo "No windows found for $app_name"
    return 1
  end

  # Iterate over each window ID and unhide/move it to the current workspace
  for wid in $window_ids
    # Unhide (map) the window. Replace 'windowmap' with the appropriate command if needed.
    xdotool windowmap $wid

    # Move the window to the current workspace. This might require specific commands
    # based on your window manager or desktop environment.
    # Example: xdotool set_desktop_for_window $wid CURRENT_DESKTOP
  end

  echo "All windows for $app_name have been unhidden and moved to the current workspace"
end

# Main 
# Check if the input argument, app-name, is provided
function main
  # echo firefox
  # is_pid_hidden (pidof firefox)
  # echo obsidian
  # is_pid_hidden (pidof obsidian | cut -f1 -d=' ')
  # echo code
  # is_pid_hidden (pidof code)[1]
  # echo zotero
  # is_pid_hidden (pidof zotero)[1]
end
  # if test (count $argv) -ne 1
  #   echo "Usage: pseudo-tdrop <app-name>"
  #   exit 1
  # end

  # set app_name $argv[1]

  # # If PATH does not contain $app_name, exit early
  # if not command -v $app_name > /dev/null
  #   echo "The application $app_name is not in PATH or not installed."
  #   exit 1
  # end
  # echo "$app_name found in PATH."

  # if is_app_running $app_name
  #   # if app is hidden, unhide.
  #   # otherwise, unhide app and move to curent workspace
  #   if is_app_hidden $app_name ; unhide_and_move_app $app_name ; else ; hide_app $app_name ; end
  # else
  #   # Start the application if it's not running
  #   echo "no running instance found, starting $app_name"
  #   $app_name
  # end
# end

main $argv
