{
  config,
  inputs,
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

    package = inputs.yazi.packages.x86_64-linux.default;
  };

  # Packages to enable full yazi features
  home.packages = with pkgs; [
    jq # JSON preview

    fd # File searching

    poppler # PDF preview

    unar # Archive preview

    file # File type detection

    ripgrep # File content searching

    fzf # Quick file subtree navigation

    ffmpegthumbnailer # Video thumbnails

    zoxide # Historical directories navigation
  ];
}
