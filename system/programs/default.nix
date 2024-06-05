{pkgs, ...}: {
  imports = [
    ./zsh.nix
    ./fonts.nix
  ];

	programs = {
		dconf.enable = true;
	};

  environment.defaultPackages = with pkgs; [home-manager];
}
