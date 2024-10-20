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
      ];
    runScript = "zeditor";
  };
  zedNodeFixScript = pkgs.writeShellScriptBin "zedNodeFixScript" ''
    nodeVersion="node-v${pkgs.nodejs.version}-linux-x64"
    zedNodePath="${config.xdg.dataHome}/zed/node/$nodeVersion"

    # Eliminar la versión de node descargada por zed-editor
    rm -rf $zedNodePath

    # Crear el enlace simbólico a la versión de node de nixpkgs
    ln -sfn ${pkgs.nodejs} $zedNodePath
  '';
  jsonGenerator = lib.generators.toJSON {};
in {
  home.packages = with pkgs; [
    zed-fhs
    nodejs
    biome
    vue-language-server
    vscode-langservers-extracted
    nixd
    zedNodeFixScript
    typescript-language-server
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
      mode = "system";
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
    };
  };
}
