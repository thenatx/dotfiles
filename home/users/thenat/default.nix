{self, ...}: let
  home = "${self}/home";
  editors = "${home}/editors";
  terminal = {
    emulators = "${home}/terminal/emulators";
    programs = "${home}/terminal/programs";
    shell = "${home}/terminal/shell";
  };
in {
  imports = [
    # General software
    "${home}/software"
    # "${home}/sss.nix" # Optional screenshot tool

    # Terminal programs
    "${terminal.emulators}/kitty"
    "${terminal.emulators}/foot"
    # "${terminal.emulators}/wezterm"
    "${terminal.programs}"
    "${terminal.shell}"

    # Code editors
    "${editors}/zed"
    # "${editors}/neovim"

    # "${editors}/vscode"
    "${editors}/helix"
  ];
}
