{...}: {
  programs.kitty = {
    enable = true;

    shellIntegration = {
      enableZshIntegration = true;
      enableBashIntegration = true;
    };

    theme = "Catppuccin-Mocha";
  };
}
