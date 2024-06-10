{
  inputs,
  pkgs,
  ...
}: let
  toLua = raw: "lua << EOF\n${raw}\nEOF\n";

  plugins = {
    codeshot-src = pkgs.fetchFromGitHub {
      owner = "sergioribera";
      repo = "codeshot.nvim";
      rev = "7e418c2b6e8b7aaa75d41c5c91d96a837251a18d";
      hash = "sha256-xMyn64uLZ0Gpnpt5ZGSPm/6F8bHdVezqlmvCAjwXmeA=";
    };
  };

  codeshot = pkgs.vimUtils.buildVimPlugin {
    name = "codeshot";
    src = plugins.codeshot-src;
  };

	cord = pkgs.vimUtils.buildVimPlugin { 
		name = "cord.nvim";
		src = pkgs.callPackage ./plugins/cord.nix;
	};
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
        plugin = codeshot;
        config = toLua ''
               	 require("codeshot").setup({
           	 copy = "%c | wl-copy";
             fonts = "";
          shadow_image = true;
             use_current_theme = true;
             background = "#AAAAFF";
             author = "@SergioRibera";
             author_color = "#000";
               })
        '';
      }
      {
       	plugin = cord;
       	config = toLua "require(\"cord\").setup()";
      }
    ];
  };
}
