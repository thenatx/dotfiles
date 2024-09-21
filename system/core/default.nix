{...}: {
  imports = [
    ./boot.nix
    ./users.nix
    ./security.nix
    ./networking.nix
  ];

  time.timeZone = "America/Bogota";

  services = {
    openssh = {
      enable = true;
    };
  };
}
