{
  config,
  pkgs,
  ...
}: {
  programs.yazi = {
    enableBashIntegration = config.programs.bash.enable;
    enableZshIntegration = config.programs.zsh.enable;

    settings = {
      log = {
        enabled = false;
      };

      manager = {
        radio = [1 3 4];
        show_hidden = false;
        sort_by = "natural";
        sort_sensitive = true;
        sort_dir_first = true;
        linemode = "permissions";
      };
    };
  };

  # Packages to enable full yazi features
  home.packages = with pkgs; [
    jq # JSON preview

    fd # File searching

    poppler # PDF preview

    unar # Archive preview

    file # File type detection

    rg # File content searching

    fzf # Quick file subtree navigation

    ffmpegthumbnailer # Video thumbnails

    zoxide # Historical directories navigation
  ];
}
