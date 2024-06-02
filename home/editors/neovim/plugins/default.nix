{
  # Plugin manager
  lazy = import ./lazy.nix;

	# Editor utils
	treesiter = import ./treesitter.nix;
	neoformat = import ./neoformat.nix;


	# User interface (UI)
	noice = import ./noice.nix;
  lualine = import ./lualine.nix;
  neo-tree = import ./neotree.nix;
	bufferline = import ./bufferline.nix;

	# Misc
  neocord = { enable = true; };
}
