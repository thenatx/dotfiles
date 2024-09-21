{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    neofetch
  ];

  home.file = {
    "${config.xdg.configHome}/neofetch/config.conf".text = import ./small.nix;
  };
}
