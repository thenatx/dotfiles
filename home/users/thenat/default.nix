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
    # "${home}/sss.nix" # Optional screenshot tool that works with the "screenshot" command

    # Terminal programs
    "${terminal.emulators}/foot"
    # "${terminal.emulatos}/kitty"
    # "${terminal.emulators}/wezterm"
    "${terminal.programs}"
    "${terminal.shell}"

    # Code editors
    "${editors}/zed"
    "${editors}/helix"
    # "${editors}/neovim"
    # "${editors}/vscode"
  ];
}
