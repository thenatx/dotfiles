{
  description = "My dotfiles nixos flake";

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux"];

      imports = [./hosts ./home/users];

      perSystem = {
        config,
        system,
        pkgs,
        ...
      }: let
        toolchain = with inputs.fenix.packages.${system};
          combine [
            complete.cargo
            complete.clippy
            complete.rust-src
            complete.rustc
            complete.rustfmt
            targets.x86_64-pc-windows-gnu.latest.rust-std
            targets.x86_64-unknown-linux-gnu.latest.rust-std
          ];
      in {
        formatter = pkgs.alejandra;

        devShells = {
          rust = pkgs.mkShell {
            packages = with pkgs; [
              gcc
              lldb_17
              toolchain
              pkg-config
              openssl.dev
              rust-analyzer
            ];

            shellHook = ''
              zsh
            '';
          };

          web = pkgs.mkShell {
            packages = with pkgs; [
              nodejs
              nodePackages.pnpm
              vscode-langservers-extracted
              nodePackages.typescript-language-server
              biome
            ];
            shellHook = ''
              zsh
            '';
          };

          python = pkgs.mkShell {
            packages = with pkgs; [
              python3
              python311Packages.python-lsp-server # Language server
            ];
            shellHook = ''
              zsh
            '';
          };
        };
      };
    };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    hm = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    fenix = {
      url = "github:nix-community/fenix/monthly";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Programs
    yazi.url = "github:sxyazi/yazi";
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    anyrun = {
      url = "github:Kirottu/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sss = {
      url = "github:SergioRibera/sss/ddcea6d83e7bbcdef47f124c903456495d4c2aad";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
