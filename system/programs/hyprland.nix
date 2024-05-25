{
  inputs,
  pkgs,
  ...
}: {
  # Try enable if you have problems with hyprland (mayorly with nvidia hardware)
  # environment.variables.NIXOS_OZONE_WL = 1;

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };
}
