{
  self,
  inputs,
  ...
}: let
  inherit (inputs.hm.lib) homeManagerConfiguration;

  system = "x86_64-linux";
  pkgs = import inputs.nixpkgs {
    inherit system;

    config = {
      allowUnfree = true;
    };
  };

  extraSpecialArgs = {inherit inputs self;};

  homeImports = {
    "nat@thenat" = [
      "${self}/home"
      ./thenat
    ];
  };
in {
  flake = {
    homeConfigurations = {
      "nat@thenat" = homeManagerConfiguration {
        modules = homeImports."nat@thenat";
        inherit pkgs extraSpecialArgs;
      };
    };
  };
}
