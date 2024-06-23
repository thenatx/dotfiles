{config, pkgs, ...}: {
	home.packages = with pkgs; [
		neofetch
	];

	home.file = {
		"${config.xdg.configHome}/neofetch".source = ./small.nix;
	};
}
