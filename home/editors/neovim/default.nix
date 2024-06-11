{
  inputs,
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

    opts = import ./opts.nix;
    plugins = import ./plugins;
    keymaps = import ./keymaps.nix;
    colorschemes = import ./colorscheme.nix;

    extraPlugins = [
      {
        plugin = ./plugins/codeshot.nix;
        config = toLua ''
         	 	require("codeshot").setup({
           	 	copy = "%c | wl-copy";
             	fonts = "";
          		shadow_image = true;
             	use_current_theme = true;
	            background = "#AAAAFF";
             	author = "@Thenat";
             	author_color = "#000";
          	})
        '';
      }
      {
       	plugin = ./plugins/cord.nix;
       	config = toLua "require(\"cord\").setup()";
      }
    ];
  };
}
