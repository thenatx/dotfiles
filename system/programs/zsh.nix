{...}: {
  programs.zsh = {
    enable = true;

    autosuggestions.enable = true;

    ohMyZsh = {
      enable = true;
      plugins = ["git"];
    };

    syntaxHighlighting = {
      enable = true;
      highlighters = ["main" "brackets" "pattern" "cursor" "regexp" "root" "line"];
    };
  };
}
