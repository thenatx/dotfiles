{ pkgs, ... }: pkgs.writeShellScriptBin "screenshot_selected" ''
temp_file=$(mktemp)
echo "$ZED_SELECTED_TEXT" > "$temp_file"

extension=$(file_extension $ZED_FILENAME)
/nix/store/grg11n872lb62qli1vkjvdnav488nb9k-sss_code-v0.1.9/sss_code $temp_file -e $extension -o raw| wl-copy
''
