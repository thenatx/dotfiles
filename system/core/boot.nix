{pkgs, ...}: let
  mac-style-src = pkgs.fetchFromGitHub {
    owner = "SergioRibera";
    repo = "s4rchiso-plymouth-theme";
    rev = "bc585b7f42af415fe40bece8192d9828039e6e20";
    sha256 = "sha256-yOvZ4F5ERPfnSlI/Scf9UwzvoRwGMqZlrHkBIB3Dm/w=";
  };

  mac-style-load = pkgs.callPackage mac-style-src {};

  catppuccin-grub-src = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "grub";
    rev = "88f6124757331fd3a37c8a69473021389b7663ad";
    hash = "sha256-e8XFWebd/GyX44WQI06Cx6sOduCZc5z7/YhweVQGMGY=";
  };
in {
  boot = {
    loader = {
      efi.canTouchEfiVariables = true;

      grub = {
        enable = true;
        devices = ["/dev/sda"];
        theme = "${catppuccin-grub-src}/src/catppuccin-mocha-grub-theme";
        backgroundColor = "#8277E5";
      };
    };

    plymouth = {
      enable = true;
      theme = "mac-style";
      themePackages = [mac-style-load];
      font = "${pkgs.comic-mono}/share/fonts/ComicMono.ttf";
    };
  };
}
