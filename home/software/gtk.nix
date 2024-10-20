{
  pkgs,
  config,
  ...
}: {
  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Original-Ice";
    size = 16;
    gtk.enable = true;
    x11.enable = true;
  };

  gtk = {
    enable = true;
    font = {
      name = "Lexend";
      package = pkgs.lexend;
      size = 9;
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "mocha";
        accent = "lavender";
      };
    };

    theme = {
      name = "catppuccin-mocha-lavender-compact+rimless";
      package = pkgs.catppuccin-gtk.override {
        accents = ["lavender"];
        size = "compact";
        tweaks = ["rimless"];
        variant = "mocha";
      };
    };

    gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
    gtk2.extraConfig = ''
      gtk-application-prefer-dark-theme=1
      gtk-xft-antialias=1
      gtk-xft-hinting=1
      gtk-xft-hintstyle="hintslight"
      gtk-xft-rgba="rgb"
    '';

    gtk3.extraConfig = {
      gtk-xft-antialias = 1;
      gtk-xft-hinting = 1;
      gtk-xft-hintstyle = "hintslight";
      gtk-xft-rgba = "rgb";
      gtk-application-prefer-dark-theme = 1;
    };

    gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
  };
}
