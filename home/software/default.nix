{pkgs, ...}: {
  imports = [
    ./qt.nix
    ./gtk.nix
    ./sss.nix
    ./xdg.nix

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

    # Notify daemon
    dunst
    libnotify

    # command utils
    brightnessctl
    xdg-utils
    trash-cli
    neofetch
    slurp
  ];
}
