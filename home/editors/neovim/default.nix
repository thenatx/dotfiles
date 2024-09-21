{
  inputs,
  pkgs,
  ...
}: let
  toLua = raw: "lua << EOF\n${raw}\nEOF\n";
in {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    enableMan = false;
    viAlias = true;
    vimAlias = true;

    globals.mapleader = ";";

    opts = import ./opts.nix;
    plugins = import ./plugins {inherit pkgs;};
    keymaps = import ./keymaps.nix;
    colorschemes = import ./colorscheme.nix;
  };
}
