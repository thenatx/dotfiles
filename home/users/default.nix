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
    "thenat@nat" = [
      "${self}/home"
      ./thenat
    ];
  };
in {
  flake = {
    homeConfigurations = {
      "thenat@nat" = homeManagerConfiguration {
        modules = homeImports."thenat@nat";
        inherit pkgs extraSpecialArgs;
      };
    };
  };
}
