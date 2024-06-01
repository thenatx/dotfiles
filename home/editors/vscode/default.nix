{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    enableExtensionUpdateCheck = true;
    enableUpdateCheck = false;
    extensions = with pkgs.vscode-extensions;
      [
        # Dev experience
        vscodevim.vim
        usernamehw.errorlens
        dbaeumer.vscode-eslint
        naumovs.color-highlight
        astro-build.astro-vscode
        bradlc.vscode-tailwindcss
        rust-lang.rust-analyzer

        # Nix
        bbenoist.nix
        kamadorueda.alejandra
      ]
      ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "vscord";
          publisher = "LeonardSSH";
          version = "5.1.18";
          sha256 = "sha256-pJ9loVW1uhlITXSNBsCEgW+o3ABn0cxcZxg6S7cKWHI=";
        }
        {
          name = "ayu";
          publisher = "teabyii";
          version = "1.0.5";
          sha256 = "sha256-+IFqgWliKr+qjBLmQlzF44XNbN7Br5a119v9WAnZOu4=";
        }
        {
          name = "material-icon-theme";
          publisher = "PKief";
          version = "4.33.0";
          sha256 = "sha256-Rwpc5p7FOSodGa1WWrjgkexzAp8RlgZCYBXhep1G5Pk=";
        }
        {
          name = "fluent-icons";
          publisher = "miguelsolorio";
          version = "0.0.18";
          sha256 = "sha256-sE0A441QPwokBoLoCqtImDHmlAXd66fj8zsJR7Ci+Qs=";
        }
        {
          name = "activitusbar";
          publisher = "Gruntfuggly";
          version = "0.0.47";
          sha256 = "sha256-hLjkC8hFnRyUaMM2/nN1gKfmT7OlWzmwxfXbxoC0Kpo=";
        }
        {
          name = "biome";
          publisher = "biomejs";
          version = "2024.2.180911";
          sha256 = "sha256-UD0gltby7lG4pG7svRABa3Qrq9tzj93hP4n//EsP/dE=";
        }
      ];
    userSettings = {
      # Workbench
      "window.commandCenter" = false;
      "workbench.sideBar.location" = "right";
      "workbench.layoutControl.enabled" = false;
      "workbench.activityBar.location" = "hidden";
      "workbench.editor.editorActionsLocation" = "hidden";
      "workbench.startupEditor" = "none";

      # Workbench Theme
      "workbench.colorTheme" = "Ayu Dark Bordered";
      "workbench.iconTheme" = "material-icon-theme";
      "workbench.productIconTheme" = "fluent-icons";

      # Editor Utils
      "editor.guides.bracketPairs" = true;
      "editor.stickyScroll.enabled" = true;

      # Editor UI
      "editor.tabSize" = 2;
      "editor.folding" = false;
      "editor.glyphMargin" = false;
      "editor.minimap.enabled" = false;
      "editor.hideCursorInOverviewRuler" = true;
      "editor.scrollbar.verticalScrollbarSize" = 8;

      # Editor Font
      "editor.fontSize" = 12;
      "editor.fontLigatures" = true;
      "editor.fontFamily" = "'FiraCode Nerd Font', monospace";

      # Window
      "window.zoomLevel" = 1.5;
      "window.titleBarStyle" = "custom";
      "window.menuBarVisibility" = "toggle";
      "window.title" = "\${dirty} \${activeEditorShort}";

      # Code Actions
      "editor.codeActionsOnSave" = {
        "source.fixAll" = "explicit";
        "quickfix.biome" = "explicit";
      };

      # Activitus bar
      "activitusbar.activeColour" = "#9090ff";
      "activitusbar.views" = [
        {
          "name" = "explorer";
          "codicon" = "explorer-view-icon";
        }
        {
          "name" = "scm";
          "codicon" = "source-control-view-icon";
        }
        {
          "name" = "extensions";
          "codicon" = "extensions-view-icon";
        }
      ];

      "explorer.confirmDelete" = false;

      # Vim extension

      "vim.handleKeys" = {
        "<C-f>" = false;
        "<C-s>" = false;
        "<C-z>" = false;
        "<C-y>" = false;
        "<C-p>" = false;
      };

      "codeium.enableConfig" = {
        "*" = true;
      };

      "[javascript]" = {
        "editor.defaultFormatter" = "biomejs.biome";
      };

      "[json]" = {
        "editor.defaultFormatter" = "biomejs.biome";
      };
      "git.confirmSync" = false;
    };

    keybindings = [
      {
        key = "meta+f";
        command = "workbench.action.toggleSidebarVisibility";
      }
      {
        key = "ctrl+n";
        command = "explorer.newFile";
      }
      {
        key = "ctrl+shift+n";
        command = "explorer.newFolder";
      }
    ];
  };
}
