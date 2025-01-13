{pkgs, ...}: {
  services.mysql.enable = true;
  services.mysql.package = pkgs.mariadb_114;
  users.users.thenat = {
    extraGroups = ["networkmanager" "wheel" ];
    initialPassword = "nixos";
    isNormalUser = true;
    createHome = true;
    shell = pkgs.zsh;

    packages = with pkgs; [
      kitty
      git
    ];
  };
}
