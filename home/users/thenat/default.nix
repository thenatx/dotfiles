{self, ...}: let
  home = "${self}/home";
  terminal = {
    emulators = "${home}/terminal/emulators";
    programs = "${home}/terminal/programs";
    shell = "${home}/terminal/shell";
  };
  editors = "${home}/editors";
in {
  imports = [
    # General software
    "${home}/software"

    # Terminal programs
    "${terminal.emulators}/kitty"
    "${terminal.emulators}/wezterm"
    "${terminal.emulators}/alacritty"

    "${terminal.programs}"
    "${terminal.shell}"

    # Code editors
    "${editors}/zed"
    "${editors}/helix"
    "${editors}/vscode"

    # Incompleted, you can comment this
    "${editors}/neovim"
  ];
}
