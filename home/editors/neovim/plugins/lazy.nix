{pkgs}: {
  enable = true;
  plugins = [
    {
      lazy = false;
      pkg = pkgs.vimPlugins.noice-nvim;
    }
    {
      lazy = false;
      pkg = pkgs.vimPlugins.nui-nvim;
    }
    {
      lazy = false;
      pkg = pkgs.vimPlugins.nvim-notify;
    }
    {
      lazy = false;
      pkg = pkgs.vimPlugins.alpha-nvim;
    }
    {
      lazy = false;
      pkg = pkgs.vimPlugins.bufferline-nvim;
    }
    {
      pkg = pkgs.vimPlugins.nvim-cmp;
    }
    {
      pkg = pkgs.vimPlugins.cmp-path;
    }
    {
      pkg = pkgs.vimPlugins.cmp-cmdline;
    }
    {
      pkg = pkgs.vimPlugins.cmp_luasnip;
    }
    {
      pkg = pkgs.vimPlugins.cmp-buffer;
    }
    {
      pkg = pkgs.vimPlugins.cmp-nvim-lsp;
    }
    {
      pkg = pkgs.vimPlugins.nvim-autopairs;
    }
    {
      pkg = pkgs.vimPlugins.nvim-treesitter;
      dependencies = [
        pkgs.vimPlugins.nvim-lspconfig
        pkgs.vimPlugins.lsp-format-nvim
      ];
    }
    {
      pkg = pkgs.vimPlugins.lualine-nvim;
      opts = import ./lualine.nix;
    }
    {
      pkg = pkgs.vimPlugins.telescope-nvim;
      opts = {
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
          borderchars = ["─" "│" "─" "│" "╭" "╮" "╯" "╰"];
          set_env = {
            COLORTERM = "truecolor";
          };
        };

        extensions = {
          media-files.enable = true;
        };
      };
      dependencies = [
        pkgs.vimPlugins.plenary-nvim
      ];
    }
    {
      pkg = import ./codeshot.nix {inherit pkgs;};
      opts = {
        copy = "%c | wl-copy";
        fonts = "";
        save_format = "raw";
        shadow_image = true;
        theme = "Catppuccin Mocha";
        use_current_theme = false;
        silent = true;
      };
    }
    {
      pkg = import ./cord.nix {inherit pkgs;};
      opts = {
        lsp = {
          show_problem_count = true;
        };

        idle = {
          timeout = 90000;
        };
      };
    }
  ];
}
