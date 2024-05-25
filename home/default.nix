{self, ...}: {
  imports = ["${self}/scripts"];

  home = {
    username = "thenat";
    homeDirectory = "/home/thenat";
    stateVersion = "23.11";
  };

  manual = {
    html.enable = false;
    json.enable = false;
    manpages.enable = false;
  };

  # Let Home Manager install and manage itself when in standalone mode
  programs.home-manager.enable = true;
}
