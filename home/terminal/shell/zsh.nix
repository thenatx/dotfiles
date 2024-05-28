{config, ...}: {
  programs.zsh = {
    enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = ["git"];
      theme = ""; # For use starship theme
    };

    autosuggestion.enable = true;

    syntaxHighlighting = {
      enable = true;
      highlighters = ["main" "brackets" "pattern" "cursor" "regexp" "root" "line"];
    };

    history = {
      expireDuplicatesFirst = true;
      ignoreDups = true;
      ignoreSpace = true;
      path = "${config.xdg.dataHome}/zsh_history";
    };

    shellAliases = {
      cleanup = "nix-collect-garbage --delete-older-than 1d";
      rebuild = "nixos-rebuild switch --flake #nat";

      tree = "eza --tree --icons --tree";
      ls = "eza -h --git --icons --color=auto --group-directories-first -s extension";
      l = "eza -lF --time-style=long-iso --icons";
      la = "eza -lah --tree";
      cat = "bat --theme=base16 --number --color=always --paging=never --tabs=2";

      # Shell envs
      rustenv = "nix develop ~/nixosflake#rust";
      webenv = "nix develop ~/nixosflake#web";
      pythonenv = "nix develop ~/nixosflake#python";
    };
  };
}
