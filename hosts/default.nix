{
  self,
  inputs,
  ...
}: let
  system = "${self}/system";
in {
  flake = {
    nixosConfigurations = {
      nat = inputs.nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs self;};
        modules = [
          "${system}/core"
          "${system}/hardware"
          ./nat
        ];
      };
    };
  };
}
