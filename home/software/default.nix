{pkgs, ...}: {
  imports = [
    ./qt.nix
    ./gtk.nix
    ./sss.nix
    ./xdg.nix
    ./dunst.nix

    ./ags
    ./rice
    ./anyrun
    ./wayland
    ./desktop
  ];

  home.packages = with pkgs; [
    # Audio related
    pamixer
    pavucontrol

    # command utils
    xdg-utils
  ];
}
