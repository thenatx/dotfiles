{self, ...}: let
  home = "${self}/home";
  terminal = {
    emulators = "${home}/terminal/emulators";
    programs = "${home}/terminal/programs";
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
    "${terminal.programs}/yazi"

    # Code editors
    "${editors}/zed"
    "${editors}/helix"
    "${editors}/vscode"

    # Incompleted, you can comment this
    "${editors}/neovim"
  ];
}
