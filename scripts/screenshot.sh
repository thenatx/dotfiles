#! /run/current-system/sw/bin/bash

screenshot_path="$(echo $HOME)/Pictures/screenshots"

if [ $# -ge 1 ]
then
  if [[ $1 == "select" ]]
  then
    if [[ $2 == "--copy" ]]
    then
      sss -o raw --area "$(slurp -c ffffff00 -d)" | wl-copy
			echo "Image taked correcly"
    else
      sss --area "$(slurp -c ffffff00 -d)" -o "$screenshot_path/sss_$(date +%Y-%I-%M-%S).png"
    fi

  elif [[ $1 == "fullscreen" ]]
  then
    if [[ $2 == "--copy" ]]
    then
        sss -o raw --screen --current | wl-copy
    else
      sss --screen --current -o "$screenshot_path/sss_$(date +%Y-%I-%M-%S).png"
    fi
  else
    echo "incorrect arg"
  fi

else
  echo "Error: No arguments"
  exit 1
fi
