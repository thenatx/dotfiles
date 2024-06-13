{
  inputs,
  pkgs,
  ...
}: {
  # add the home manager module
  imports = [inputs.ags.homeManagerModules.default];

  programs.ags = {
    enable = true;

    configDir = ./config;

    extraPackages = with pkgs; [
      gtksourceview
      webkitgtk
    ];
  };
}
