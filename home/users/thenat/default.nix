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

    # Terminal programs
    "${terminal.emulators}/kitty"
    "${terminal.emulators}/wezterm"

    # "${terminal.emulators}/alacritty"

    "${terminal.programs}"
    "${terminal.shell}"

    # Code editors
    "${editors}/zed"
    "${editors}/neovim"

    # "${editors}/vscode"
    # "${editors}/helix"
  ];
}
