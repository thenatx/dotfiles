{inputs, ...}: {
  imports = [inputs.nixvim.homeManagerModules.nixvim];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;

    opts = {
      number = true;
      relativenumber = true;

      shiftwidth = 2;
    };

    colorschemes.catppuccin = {
      enable = true;
      settings = {
        flavour = "mocha";
        transparent_background = true;
      };
    };
  };
}
