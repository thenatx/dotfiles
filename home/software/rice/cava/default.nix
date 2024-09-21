{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [cava];

  home.file = {
    "${config.xdg.configHome}/cava/config".text = import ./mocha.nix;
  };
}
