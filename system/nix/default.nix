{...}: {
  imports = [
    ./nixpkgs.nix
    ./nh.nix
  ];

  nix = {
    enable = true;
    extraOptions = ''
      extra-experimental-features = nix-command flakes
      warn-dirty = false
    '';

    settings = {
      builders-use-substitutes = true;
      auto-optimise-store = true;

      substituters = [
        "https://cache.nixos.org?priority=10"
        "https://hyprland.cachix.org"
        "https://anyrun.cachix.org"
        "https://sss.cachix.org"
      ];

      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vnO3p346s="
        "sss.cachix.org-1:YI2JMG95LEu62PC7VMz75N7bypEdUz9Z/Il1hkGH4AA="
      ];
    };
  };
}
