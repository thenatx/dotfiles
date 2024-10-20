{pkgs, ...}: {
  xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;
    };

    portal = {
      enable = true;
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

      # defaultApplications = {
      #   # Default browser
      #   "text/xml" = ["brave-browser.desktop"];
      #   "application/xml" = ["brave-browser.desktop"];
      #   "application/pdf" = ["brave-browser.desktop"];
      #   "application/rdf+xml" = ["brave-browser.desktop"];
      #   "application/rss+xml" = ["brave-browser.desktop"];
      #   "application/xhtml+xml" = ["brave-browser.desktop"];
      #   "application/xhtml_xml" = ["brave-browser.desktop"];
      #   "x-scheme-handler/http" = ["brave-browser.desktop"];
      #   "x-scheme-handler/ipfs" = ["brave-browser.desktop"];
      #   "x-scheme-handler/ipns" = ["brave-browser.desktop"];
      #   "x-scheme-handler/https" = ["brave-browser.desktop"];
      #   "text/html" = ["brave-browser.desktop" "Helix.desktop"];

      #   # Images
      #   "image/gif" = ["org.gnome.Loupe.desktop" "brave-browser.desktop"];
      #   "image/jpeg" = ["org.gnome.Loupe.desktop" "brave-browser.desktop"];
      #   "image/png" = ["org.gnome.Loupe.desktop" "brave-browser.desktop"];
      #   "image/webp" = ["brave-browser.desktop" "org.gnome.Loupe.desktop"];
      #   "image/jpg" = ["org.gnome.Loupe.desktop" "brave-browser.desktop"];
      #   "image/svg+xml-compressed" = ["org.gnome.Loupe.desktop"];
      #   "image/svg+xml" = ["org.gnome.Loupe.desktop"];

      #   # Helix and code editors
      #   "text/plain" = ["Helix.desktop" "code.desktop"];
      #   "application/x-shellscript" = ["Helix.desktop" "code.desktop"];

      #   # File Manager and File explorer
      #   "inode/directory" = "yazi";

      #   # vscode url handler
      #   "x-scheme-handler/vscode" = "code-url-handler.desktop";

      #   # Discord url handler
      #   "x-scheme-handler/discord" = "discord.desktop";
      # };
    };
  };
}
