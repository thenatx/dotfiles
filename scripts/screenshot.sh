#! /run/current-system/sw/bin/bash

if [ $# -ge 1 ] 
then
  if [[ $2 == "select" ]] 
  then

    if [[ $3 == "--copy" ]] 
    then
      sss -o raw "$(slurp -c ffffff00 -d)" - | wl-copy -t image/png
    else 
      sss -o png "$(slurp -c ffffff00 -d)" "$(cmd "$HOME")/Pictures/screenshots/grim_screenshot_$(date "+%Y-%I-%M-%S").png"
    fi

  elif [[ $1 == "fullscreen" ]]
  then
    if [[ $2 == "--copy" ]]
    then
      sss -o raw --screen --current | wl-copy -t image/png
    else
      sss -o png --screen --current "$(cmd "$HOME")/Pictures/screenshots/sss_screenshot_$(date "+%Y-%I-%M-%S").png"
    fi
  else
    echo "incorrect arg"
  fi

else
  echo "Error: No arguments"
  exit 1
fi
