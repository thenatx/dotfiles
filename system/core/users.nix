{pkgs, ...}: {
  users.users.thenat = {
    extraGroups = ["networkmanager" "wheel"];
    initialPassword = "nixos";
    isNormalUser = true;
    createHome = true;
    shell = pkgs.zsh;

    packages = with pkgs; [
      alacritty
      kitty
      git

      discord
      betterdiscordctl
    ];
  };
}
