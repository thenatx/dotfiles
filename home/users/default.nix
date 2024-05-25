{
  self,
  inputs,
  pkgs,
  ...
}: let
  inherit (inputs.hm.lib) homeManagerConfiguration;

  extraSpecialArgs = {inherit inputs self;};

  homeImports = {
    "thenat@nat" = [
      "${self}/home"
      ./thenat
    ];
  };
in {
  flake = {
    homeConfiguration = {
      "thenat-nat" = homeManagerConfiguration {
        modules = homeImports."thenat@nat";
        inherit pkgs extraSpecialArgs;
      };
    };
  };
}
