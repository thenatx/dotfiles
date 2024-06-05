{
  # Plugin manager
  lazy = import ./lazy.nix;

	# Editor utils
	treesitter = { enable = true; };
	nvim-autopairs = { enable = true; }; 
	
	# Language server (lsp)
	lsp = import ./lsp.nix;

	lsp-format = { enable = true; };

	# Completion
	cmp = {
		enable = true;

		settings = { 
		  window = {
				completion.border = "rounded";
				documentation.border = "rounded";
			};
		};
	};

	cmp-cmdline = { enable = true; };

	# User interface (UI)
	noice = { enable = true; };
	notify = { 
		enable = true;
		backgroundColour = "#000000";
		maxHeight = 20;
		maxWidth = 39;
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
