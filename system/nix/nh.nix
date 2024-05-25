_: {
  environment.variables.FLAKE = "/home/thenat/natland";

  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      extraArgs = "--keep-since 15d";
    };
  };
}
