{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./zsh.nix
    ./fonts.nix
    ./hyprland.nix
    ./home-manager.nix
  ];

  environment.defaultPackages = [inputs.yazi.packages.${pkgs.system}.yazi];
}
