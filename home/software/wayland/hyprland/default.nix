{
  inputs,
  pkgs,
  ...
}: {
  imports = [./config.nix];
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.x86_64-linux.default;
  };

  home.sessionVariables = {
    NIXOS_OZONE_WL = 1;
  };

  # utils packages for wayland (Hyprland)
  home.packages = with pkgs; [
    wayland-utils
    wl-clipboard
    wlogout
    udiskie

    # bar
    eww
  ];
}
