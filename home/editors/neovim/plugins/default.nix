{
  # Plugin manager
  lazy = import ./lazy.nix;

	# Editor utils
	treesitter = { enable = true; };
	nvim-autopairs = { enable = true; }; 

	# User interface (UI)
	noice = { enable = true; };
  lualine = import ./lualine.nix;
  neo-tree = { enable = true; };
	bufferline = { enable = true; };

	# Misc
  neocord = { enable = true; };
}
