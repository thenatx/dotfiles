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

    # initExtra = ''
    # '';

    shellAliases = {
      cleanup = "sudo nix-collect-garbage --delete-older-than 1d";
      rebuild = "sudo nixos-rebuild switch --flake ~/natland";
      ls = "lsd";
      cat = "bat --theme=Dracula --number --color=always --paging=never --tabs=2";
      rustenv = "nix develop ~/nixosflake#rust";
      webenv = "nix develop ~/nixosflake#web";
      pythonenv = "nix develop ~/nixosflake#python";
    };
  };
}
