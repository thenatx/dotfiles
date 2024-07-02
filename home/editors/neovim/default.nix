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
        config = toLua ''require('codeshot').setup({
          copy = '%c | wl-copy';
         	fonts = "";
         	save_format = 'raw';
         	shadow_image = true;
			    theme = 'Catppuccin Mocha';
      	  use_current_theme = false;

			    silent = true;
        })'';
      }
      {
        plugin = import ./plugins/cord.nix {inherit pkgs;};
        config = toLua ''require('cord').setup({
			  	lsp = {
						show_problem_count = true;
					};

					idle = {
						timeout = 90000,
					};
				})'';
      }
    ];
  };
}
