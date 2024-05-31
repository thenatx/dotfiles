{...}: {
  programs.kitty = {
    enable = true;
    theme = "Catppuccin-Mocha";

    font = {
      name = "ComicShannsMono Nerd Font Mono";
      size = 13;
    };

    settings = {
      enable_audio_bell = false;
      window_padding_width = 4;
      confirm_os_window_close = 0;
    };

    shellIntegration = {
      enableZshIntegration = true;
      enableBashIntegration = true;
    };
  };
}
