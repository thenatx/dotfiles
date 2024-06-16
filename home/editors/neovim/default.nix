{
  inputs,
  pkgs,
  ...
}: let
  toLua = raw: "lua << EOF\n${raw}\nEOF\n";
in {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    enableMan = false;
    viAlias = true;
    vimAlias = true;

		globals.mapleader = ";";

    opts = import ./opts.nix;
    plugins = import ./plugins;
    keymaps = import ./keymaps.nix;
    colorschemes = import ./colorscheme.nix;

    extraPlugins = [
      {
        plugin = import ./plugins/codeshot.nix {inherit pkgs;};
        config = toLua ''
        	require('codeshot').setup({
          	copy = '%c | wl-copy';
           	fonts = "";
           	author = '@Thenat';
						save_format = 'raw';
         		shadow_image = true;
            background = '#b4befe';
						theme = 'base16-mocha.dark';
           	author_color = '#1e1e2e';
						use_current_theme = false;

						silent = false;
          })
        '';
      }
      {
        plugin = import ./plugins/cord.nix {inherit pkgs;};
        config = toLua "require('cord').setup()";
      }
    ];
  };
}
