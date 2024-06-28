{
  # Plugin manager
  lazy = import ./lazy.nix;

  # Editor utils
  treesitter = {enable = true;};
  nvim-autopairs = {enable = true;};

  # Language server (lsp)
  lsp = import ./lsp.nix;
  lsp-format = {enable = true;};

  # Completion
  cmp = import ./completion.nix;
  cmp-path = {enable = true;};
  cmp-buffer = {enable = true;};
  cmp_luasnip = {enable = true;};
  cmp-cmdline = {enable = true;};
  cmp-nvim-lsp = {enable = true;};

  # User interface (UI)
  noice = {enable = true;};
  notify = {
    enable = true;
    backgroundColour = "#000000";
    maxHeight = 20;
    maxWidth = 39;
    timeout = 3000;
    topDown = false;
  };

  telescope = {
    enable = true;

    settings = {
      defaults = {
        file_ignore_patterns = [
          "^.git/"
					"^target/"
					"^node_modules/"
        ];

		    prompt_prefix = "   ";
    		selection_caret = "  ";
		    entry_prefix = "  ";
		    initial_mode = "insert";
		    layout_config = {
    		  horizontal = {
  	      	prompt_position = "top";
		        preview_width = 0.55;
  	      	results_width = 0.8;
    			};

      		vertical = {
    		    mirror = false;
		      };

    		  width = 0.87;
		      height = 0.80;
    		  preview_cutoff = 120;
		    };

		    border = {};
 			  borderchars = [ "─" "│" "─" "│" "╭" "╮" "╯" "╰" ];
		    set_env = {
		      COLORTERM = "truecolor";
    		};
      };
    };

    extensions = {
      media-files.enable = true;
    };
  };

  neo-tree = {
    enable = true;
    window = {
      position = "right";
    };
  };

  alpha = {
    enable = true;
    theme = null;
    iconsEnabled = true;
    layout = let
      padding = val: {
        type = "padding";
        inherit val;
      };
    in [
      (padding 4)
      {
        opts = {
          hl = "AlphaHeader";
          position = "center";
        };
        type = "text";
        val = [
          "                                  "
          "                                  "
          "                                  "
          "                                  "
          "                                  "
          "                                  "
          "                                  "
          "      git@github.com:thenatx      "
        ];
      }
      (padding 2)
      {
        type = "button";
        val = "  Find File";
        on_press = {
          __raw = "function() require('telescope.builtin').find_files() end";
        };
        opts = {
          # hl = "comment";
          keymap = [
            "n"
            "f"
            ":Telescope find_files <CR>"
            {
              noremap = true;
              silent = true;
              nowait = true;
            }
          ];
          shortcut = "f";

          position = "center";
          cursor = 3;
          width = 38;
          align_shortcut = "right";
          hl_shortcut = "Keyword";
        };
      }
      (padding 1)
      {
        type = "button";
        val = "  New File";
        on_press = {
          __raw = "function() vim.cmd[[ene]] end";
        };
        opts = {
          # hl = "comment";
          keymap = [
            "n"
            "n"
            ":ene <BAR> startinsert <CR>"
            {
              noremap = true;
              silent = true;
              nowait = true;
            }
          ];
          shortcut = "n";

          position = "center";
          cursor = 3;
          width = 38;
          align_shortcut = "right";
          hl_shortcut = "Keyword";
        };
      }
      (padding 1)
      {
        type = "button";
        val = "󰈚  Recent Files";
        on_press = {
          __raw = "function() require('telescope.builtin').oldfiles() end";
        };
        opts = {
          # hl = "comment";
          keymap = [
            "n"
            "r"
            ":Telescope oldfiles <CR>"
            {
              noremap = true;
              silent = true;
              nowait = true;
            }
          ];
          shortcut = "r";

          position = "center";
          cursor = 3;
          width = 38;
          align_shortcut = "right";
          hl_shortcut = "Keyword";
        };
      }
      (padding 1)
      {
        type = "button";
        val = "󰈭  Find Word";
        on_press = {
          __raw = "function() require('telescope.builtin').live_grep() end";
        };
        opts = {
          # hl = "comment";
          keymap = [
            "n"
            "g"
            ":Telescope live_grep <CR>"
            {
              noremap = true;
              silent = true;
              nowait = true;
            }
          ];
          shortcut = "g";

          position = "center";
          cursor = 3;
          width = 38;
          align_shortcut = "right";
          hl_shortcut = "Keyword";
        };
      }
      (padding 1)
      {
        type = "button";
        val = "  Quit Neovim";
        on_press = {
          __raw = "function() vim.cmd[[qa]] end";
        };
        opts = {
          # hl = "comment";
          keymap = [
            "n"
            "q"
            ":qa<CR>"
            {
              noremap = true;
              silent = true;
              nowait = true;
            }
          ];
          shortcut = "q";

          position = "center";
          cursor = 3;
          width = 38;
          align_shortcut = "right";
          hl_shortcut = "Keyword";
        };
      }
    ];
  };

  lualine = import ./lualine.nix;
  bufferline = {enable = true;};
}
