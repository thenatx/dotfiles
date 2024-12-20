{
  config,
  pkgs,
  lib,
  ...
}: let
  zed-fhs = pkgs.buildFHSUserEnv {
    name = "zed";
    targetPkgs = pkgs:
      with pkgs; [
        zed-editor
        zlib
        fontconfig.dev 
        libxkbcommon.dev
        xorg.libxcb
      ];
    runScript = "zeditor";
  };

  zedNodeFixScript = pkgs.writeShellScriptBin "zedNodeFixScript" ''
    nodeVersion="node-v${pkgs.nodejs.version}-linux-x64"
    zedNodePath="${config.xdg.dataHome}/zed/node/$nodeVersion"

    # Delete the version of nodejs downloaded by zed
    rm -rf $zedNodePath

    # Make a symlink to the version of nixpkgs
    ln -sfn ${pkgs.nodejs} $zedNodePath
  '';

  fileExtension = pkgs.callPackage ./file-extension.nix { };
  screenshotFile = pkgs.callPackage ./screenshot-file.nix { };
  screenshotSelected = pkgs.callPackage ./screenshot-selected.nix { };

  jsonGenerator = lib.generators.toJSON {};
in {
  home.packages = with pkgs; [
    zed-fhs
    nixd
    zlib # This lib makes work the discord rich presence extension
    zedNodeFixScript
    fileExtension
    screenshotFile
    screenshotSelected
  ];


  home.file.".config/zed/tasks.json".text = jsonGenerator [
    {
      label = "SSSCompleteFile"; # takes a screenshot of the entire file code
      command = "screenshot_file 'Catppuccin Mocha'";
      use_new_terminal = true;
      hide = "always";
    } 
    {
      label = "SSSelected"; # Takes a screenshot of the selected text
      command = "screenshot_selected 'Catppuccin Mocha'";
      use_new_terminal = true;
      hide = "never";
    }
  ];

  home.file.".config/zed/settings.json".text = jsonGenerator {
    auto_install_extensions = {
      astro = true;
      biome = true;
      html = true;
      nix = true;
      unocss = true;
      vue = true;
      rust = true;
    };
    auto_update = false;
    buffer_font_size = 14;
    format_on_save = "on";
    formatter = "language_server";

    inlay_hints = {
      enabled = true;
    };

    project_panel = {
      dock = "right";
      scrollbar = {
        show = "never";
      };
    };

    scrollbar = {
      show = "never";
    };

    tab_bar = {
      show = false;
    };

    tab_size = 2;
    telemetry = {
      diagnostics = false;
      metrics = false;
    };

    terminal = {
      font_family = "FiraCode Nerd Font";
    };

    theme = {
      # The system option seems to not work for some reason, i searched and didn't find a reason for why
      # i'll set dark theme for now
      mode = "dark"; 
      dark = "Catppuccin Mocha";
      light = "Catppuccin Latte";
    };

    toolbar = {
      breadcrumbs = true;
      quick_actions = false;
    };

    ui_font_size = 16;
    vim_mode = true;
    lsp = {
      rust-analyzer = {
        initialization_options = {
          rust = {
            analyzerTargetDir = false;
          };

          binary = {
            path = "${pkgs.rust-analyzer}/bin/rust-analyzer";
            args = [];
          };

          inlayHints = {
            maxLength = 15;
          };
        };
      };

      biome = {
        settings = {
          config_path = "${config.xdg.configHome}/biome/config.json";
        };
        binary = {
          command = "${pkgs.biome}/bin/biome";
          args = ["lsp"];
        };
      };
      vscode-json-language-server = {
        command = "${pkgs.vscode-langservers-extracted}/bin/vscode-json-language-server";
        args = ["--stdio"];
      };
      vscode-css-language-server = {
        command = "${pkgs.vscode-langservers-extracted}/bin/vscode-css-language-server";
        args = ["--stdio"];
      };
      vscode-html-language-server = {
        command = "${pkgs.vscode-langservers-extracted}/bin/vscode-html-language-server";
        args = ["--stdio"];
      };
      vscode-markdown-language-server = {
        command = "${pkgs.vscode-langservers-extracted}/bin/vscode-markdown-language-server";
        args = ["--stdio"];
      };
      vscode-eslint-language-server = {
        command = "${pkgs.vscode-langservers-extracted}/bin/vscode-eslint-language-server";
        args = ["--stdio"];
      };
      nixd = {
        command = "${pkgs.nixd}/bin/nixd";
        args = ["--stdio"];
      };
      vue-language-server = {
        command = "${pkgs.vue-language-server}/bin/vue-language-server";
        args = ["--stdio"];
      };
      typescript-language-server = {
        command = "${pkgs.typescript-language-server}/bin/typescript-language-server";
        args = ["--stdio"];
      };
      discord_presence = {
        initialization_options = {
          base_icons_url = "https://raw.githubusercontent.com/xhyrom/zed-discord-presence/main/assets/icons/";

          state = "Working on {filename}";
          details = "In {workspace}";

          large_image = "{base_icons_url}/{language}.png";
          large_text = "{language:u}";

          small_image = "https://avatars.githubusercontent.com/u/126206823?v=4&size=64"; # This is my github profile photo, change it if you want
          small_text = "Zed";

          rules = {
            mode = "blacklist"; # or whitelist
            paths = [];
          };

          git_integration = true;
        };
      };
    };
  };
}
