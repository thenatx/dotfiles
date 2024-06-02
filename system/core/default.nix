{...}: {
  imports = [
    ./boot.nix
    ./users.nix
    ./security.nix
    ./networking.nix
  ];

  services = {
    openssh = {
      enable = true;
    };
  };
}
