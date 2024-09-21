{pkgs, ...}: {
  imports = [./config.nix];
  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
  };

  home.sessionVariables = {
    NIXOS_OZONE_WL = 1;
  };

  # utils packages for wayland (Hyprland)
  home.packages = with pkgs; [
    wayland-utils
    brightnessctl
    wl-clipboard
    udiskie
    loupe
    slurp
    swww
    grim
  ];
}
