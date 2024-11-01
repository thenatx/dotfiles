{ pkgs, ... }: pkgs.writeShellScriptBin "screenshot_file" ''
extension=$(file_extension $ZED_FILENAME)

/nix/store/grg11n872lb62qli1vkjvdnav488nb9k-sss_code-v0.1.9/sss_code $ZED_FILE -e $extension -o raw | wl-copy
''
