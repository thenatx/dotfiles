{pkgs, ...}: {
  imports = [
    ./qt.nix
    ./gtk.nix
    ./sss.nix
    ./xdg.nix
		./discord.nix

    ./anyrun
    ./wayland
  ];

  home.packages = with pkgs; [
    # Browser
    brave

    # Image related (image viewer, wallpaper manager and screenshots)
    loupe
    swww
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
