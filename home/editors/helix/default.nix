{pkgs, ...}: {
  programs.helix = {
    enable = true;
    #    defaultEditor = true;

    settings = {
      theme = "catppuccin_mocha_transparent";

      editor = {
        mouse = false;
        gutters = [
          "diagnostics"
          "spacer"
          "line-numbers"
          "spacer"
          "diff"
        ];

        statusline = {
          left = [
            "spacer"
            "file-encoding"
            "diagnostics"
            "spacer"
            "file-name"
          ];

          center = ["separator" "mode" "separator"];

          right = ["version-control" "file-type" "spinner"];

          separator = "   ";

          mode = {
            normal = "N O R M A L";
            insert = "I N S E R T";
            select = "S E L E C T";
          };
        };

        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "block";
        };
      };
    };

    themes = {
      catppuccin_mocha_transparent = {
        inherits = "catppuccin_mocha";

        "ui.background" = {};
      };
    };

    extraPackages = with pkgs; [
      nil # Nix language server
    ];
  };
}
