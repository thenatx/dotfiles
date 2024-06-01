{inputs, ...}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./lualine.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    enableMan = false;

    viAlias = true;
    vimAlias = true;

    opts = {
      number = true;
      shiftwidth = 2;
      clipboard = "nonamedplus"
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
