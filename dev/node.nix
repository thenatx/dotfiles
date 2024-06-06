{ pkgs }:

pkgs.mkShell {
  packages = with pkgs; [
    nodejs
    nodePackages.pnpm
		
		# Utils
    biome
	];

  shellHook = ''
  	zsh
  '';
}

