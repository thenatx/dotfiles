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
      }: {
        formatter = pkgs.alejandra;

        devShells = {
          rust = import ./dev/rust.nix {inherit inputs system;};
          node = import ./dev/node.nix {inherit pkgs;};
          python = import ./dev/python.nix {inherit pkgs;};
        };
      };
    };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    wallpapers = {
      url = "github:NatProgramer/wallpapers";
      flake = false;
    };

    hm = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    anyrun.url = "github:Kirottu/anyrun/c6101a31a80b51e32e96f6a77616b609770172e0";
    sss.url = "github:SergioRibera/sss/245914a6f19e421a9d81814ac9d275ba0f83cc41";
    ags.url = "github:Aylur/ags";

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    fenix = {
      url = "github:nix-community/fenix/monthly";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
