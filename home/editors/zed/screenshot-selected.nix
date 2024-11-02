{ pkgs, ... }: pkgs.writeShellScriptBin "screenshot_selected" ''
theme=$1
temp_file=$(mktemp)
echo "$ZED_SELECTED_TEXT" > "$temp_file"

extension=$(file_extension $ZED_FILENAME)
if [ -z "$theme" ]; then
  ~/Downloads/sss_code $ZED_FILE -e $extension -o raw | wl-copy
  exit 0
fi

~/Downloads/sss_code $temp_file -e $extension -t "$theme" -o raw | wl-copy
''
