{
  pkgs,
  ...
}: {
  imports = [
    ./zsh.nix
    ./fonts.nix
    ./home-manager.nix
  ];

  environment.defaultPackages = with pkgs; [home-manager];
}
