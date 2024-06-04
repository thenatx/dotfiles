{
  # Plugin manager
  lazy = import ./lazy.nix;

	# Editor utils
	treesitter = { enable = true; };
	nvim-autopairs = { enable = true; }; 
	
	# Language server (lsp)
	lsp = { enable = true; };
	lsp-format = { enable = true; };

	# User interface (UI)
	noice = { enable = true; };
	notify = { 
		enable = true;
		backgroundColour = "#000000";
		maxHeight = 15;
		maxWidth = 40;
		timeout = 3000;
		topDown = false;
	};

  neo-tree = {
		enable = true; 
		window = {
			position = "right";
		};
	};

  lualine = import ./lualine.nix;
	bufferline = { enable = true; };

	# Misc
  neocord = { enable = true; };
}
