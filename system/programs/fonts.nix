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
      noto-fonts-cjk-sans
      noto-fonts-emoji

      comic-mono
      nerd-fonts.symbols-only
      nerd-fonts.comic-shanns-mono
      nerd-fonts.fira-code
      nerd-fonts.geist-mono
      nerd-fonts.hack
      nerd-fonts.jetbrains-mono
    ];
  };
}
