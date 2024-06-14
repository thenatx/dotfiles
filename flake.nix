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
		
		ags.url = "github:Aylur/ags";

    hm = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

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

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

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
