{pkgs, ...}: {
  imports = [
    ./qt.nix
    ./gtk.nix
    ./sss.nix
    ./xdg.nix
		./dunst.nix

    ./ags
    ./anyrun
    ./wayland
    ./desktop
  ];

  home.packages = with pkgs; [
    # Image related (image viewer, wallpaper manager and screenshots)
    loupe
    grim

    # Audio related
    pamixer
    pavucontrol

    # command utils
    brightnessctl
    xdg-utils
    neofetch
    slurp
  ];
}
