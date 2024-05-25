{pkgs, ...}: {
  fonts = {
    packages = with pkgs; [
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
