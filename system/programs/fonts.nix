{pkgs, ...}: {
  fonts = {
    fontconfig = {
      defaultFonts.emoji = ["Twitter Color Emoji" "Noto Color Emoji"];
    };

    packages = with pkgs; [
      twitter-color-emoji
      noto-fonts-color-emoji

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
