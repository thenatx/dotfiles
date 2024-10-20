{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./boot.nix
    ./users.nix
    ./security.nix
    ./networking.nix
  ];

  time.timeZone = "America/Bogota";

  environment.systemPackages = [
    (
      pkgs.catppuccin-sddm.override {
        flavor = "mocha";
        font = "${pkgs.comic-mono}";
        fontSize = "12";
        background = "${inputs.wallpapers}/cat-leaves.png";
        loginBackground = true;
      }
    )
  ];

  services = {
    # displatManager.sddm = {
    #   enable = true;
    #   theme = "Catppuccin Mocha";
    # };

    openssh = {
      enable = true;
    };
  };
}
