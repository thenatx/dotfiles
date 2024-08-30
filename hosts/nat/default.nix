{self, ...}: let
  system = "${self}/system";
in {
  imports = [
    "${system}/nix"
    "${system}/programs"
    ./hardware-configuration.nix
  ];

  networking.hostName = "nat";
  system.stateVersion = "24.05";
}
