{pkgs, ...}: pkgs.writeShellScriptBin "file_extension" ''
#! /run/current-system/sw/bin/bash
if [[ $# -eq 0 ]]; then
  exit 1
fi

filename="$1"
if [[ "$filename" == *.* ]]; then
  extension="\$\{filename##*.}"
  if [[ -n "$extension" && "$extension" != "$filename" ]]; then
    echo "$extension"
  else
    echo "txt"
  fi
else
  echo "txt"
fi
''
