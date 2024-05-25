{inputs, ...}: {
  imports = [inputs.sss.nixosModules.home-manager];

  programs.sss = {
    enable = true;

    # General Config
    general = {
      author = " Thenat";
      fonts = "ComicShannsMono NF=12.0";
      radius = 14;
      save-format = "webp";
      shadow = true;
      shadow-image = true;
      colors = {
        background = "#4466FF";
        author = "#FFFFFF";
        shadow = "#333333";
      };
    };

    code = {
      enable = true;
    };
  };
}
