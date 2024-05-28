{pkgs, ...}: {
  imports = [
    ./qt.nix
    ./gtk.nix
    ./sss.nix
    ./xdg.nix
    ./anyrun
    ./wayland
  ];

  home.packages = with pkgs; [
    # Browser
    brave

    # Image viewer
    loupe

    # Wayland utils
    wayland-utils

    # XDG utils
    xdg-utils

    # Keyring
    gnome.gnome-keyring

    # Bar for wayland
    eww

    # idle managent daemon
    sway-audio-idle-inhibit

    # screenlocker daemon
    swaylock-effects

    # Logout manager
    wlogout

    # Notify daemon
    dunst
    libnotify

    # Utilities
    swww
    grim
    slurp

    # Audio related
    pamixer
    pavucontrol

    # clipboard manager
    wl-clipboard

    # trash CLI
    trash-cli

    # Color picker
    hyprpicker

    # Dev tools
    git

    # command utils
    neofetch
    tree
    zip
    unzip
  ];
}
