{ pkgs, ... }: pkgs.writeShellScriptBin "screenshot_file" ''
theme=$1

if [ -z "$theme" ]; then
  ${"${pkgs.sss_code}/bin/sss_code"} $ZED_FILE -e $extension -o raw | wl-copy
  exit 0
fi

extension=$(file_extension $ZED_FILENAME)
${"${pkgs.sss_code}/bin/sss_code"} $ZED_FILE -e $extension -t "$theme" -o raw | wl-copy
''
