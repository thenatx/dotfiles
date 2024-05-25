{pkgs, ...}: let
  screenshots = pkgs.writeShellScriptBin "screenshot" (builtins.readFile ./screenshot.sh);
in {
  home.packages = [screenshots];
}
