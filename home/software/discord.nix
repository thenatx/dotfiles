{ pkgs, config }: let
	midnight = pkgs.fetchFromGithub {
		owner = "refact0r";
		name = "midnight-discord";
		rev = "11106b7f09cc4be54ea12bbacfe31bd682eb81b0";
		hash = "sha256-gNgPt7QXZa/3iRqSkVq+9h9ZoNFAy9+Nix6jRlD5N20=";
	};
in {
	home.packages = [ pkgs.vesktop ];

	home.file."${config.xdg.configDir}/vesktop/themes/mocha.css" = 
		"${midnight}/flavors/midnight-catppuccin-mocha.theme.css";
}

