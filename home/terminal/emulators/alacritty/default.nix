{...}: {
  programs.alacritty = {
    enable = true;
    settings = ./settings.nix;
  };
}
