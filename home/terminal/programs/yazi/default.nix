{
  config,
  pkgs,
  ...
}: {
  imports = [./theme.nix];
  programs.yazi = {
    enable = true;
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

    package = pkgs.yazi;
  };
  # Packages to enable full yazi features
  home.packages = with pkgs; [
    file # File type detection (Required)
    jq # JSON preview
    fd # File searching
    fzf # Quick file subtree navigation
    unar # Archive preview
    zoxide # Historical directories navigation
    ripgrep # File content searching
    ffmpegthumbnailer # Video thumbnails
    # poppler         # PDF preview
  ];
}
