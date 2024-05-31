{pkgs, ...}: {
  # Utils xdg related
  home.packages = with pkgs; [xdg-utils];

  xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;
    };

    portal = {
      enable = true;

      # Uncomment this line, but i have problems using mimeapps.list for open default applications enabling this
      xdgOpenUsePortal = true;

      config = {
        common.default = ["gtk"];
        hyprland.default = ["gtk" "hyprland"];
      };

      extraPortals = with pkgs; [
        xdg-desktop-portal-hyprland
        xdg-desktop-portal-gtk
      ];
    };

    mime = {
      enable = true;
    };

    mimeApps = {
      enable = true;
    };
  };
}
