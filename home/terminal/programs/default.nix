{pkgs,...}: {
  imports = [
    ./eza.nix
    ./bat.nix
    ./playerctl.nix
    
    ./yazi
  ];
}
