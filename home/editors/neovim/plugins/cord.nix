{ 
	stdenv,
	pkgs
}: let
	cord-nvim-src = pkgs.fetchFromGitHub {
    owner = "vyfor";
    repo = "cord.nvim";
    rev = "cf0af0fc9b8e218afd8c4928ae2e711ce455181b";
    hash = "sha256-Ev44plJGhZ8wY3hcWg6BOV2T3g38JhctJ8KozDnAkUM=";
  };
in stdenv.mkDerivation {
    pname = "cord.nvim";
		version = "v1.0";
    src = cord-nvim-src;

		buildInputs = with pkgs; [ rustc gcc ];

		buildPhase = ''
			rustc --crate-type=cdylib -C opt-level=3 -C panic=abort -C lto=fat -o cord ./src/lib.rs	
		'';

		installPhase = ''
			mkdir $out
			cp cord $out/cord
		'';
}
