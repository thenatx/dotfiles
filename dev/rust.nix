{
  inputs,
  system,
}: let
  pkgs = inputs.nixpkgs.legacyPackages.${system};
  fenix = inputs.fenix;
in
  pkgs.mkShell {
    packages = with pkgs; [
      rust-analyzer

      (with fenix.packages.${system};
        combine [
          complete.cargo
          complete.clippy
          complete.rust-src
          complete.rustc
          complete.rustfmt
        ])

      # Build utils
      gcc
      pkg-config
    ];

    shellHook = ''
      zsh
    '';
  }
