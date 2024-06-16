{inputs, ...}: {
  imports = [inputs.sss.nixosModules.home-manager];

  programs.sss = {
    enable = true;

    general = {
      author = "  thenat  ";
      fonts = "ComicShannsMono Nerd Font=14.0";
      radius = 14;
      save-format = "webp";
      shadow = true;
      shadow-image = true;
      colors = {
        background = "#b4befe";
        author = "#000000";
        shadow = "#1e1e2e";
      };
    };

    code = {
      enable = true;
    };
  };
}
