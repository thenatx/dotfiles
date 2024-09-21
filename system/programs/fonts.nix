{pkgs, ...}: {
  fonts = {
    fontconfig = {
      defaultFonts = {
        serif = ["Noto Serif" "Noto Color Emoji"];
        sansSerif = ["Lexend" "Noto Color Emoji"];
        monospace = ["GeistMono Nerd Font" "Noto Color Emoji"];
        emoji = ["Noto Color Emoji"];
      };
    };

    packages = with pkgs; [
      lexend
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji

      comic-mono
      (nerdfonts.override {
        fonts = [
          "NerdFontsSymbolsOnly"
          "CascadiaCode"
          "ComicShannsMono"
          "FiraCode"
          "GeistMono"
          "Hack"
          "JetBrainsMono"
        ];
      })
    ];
  };
}
