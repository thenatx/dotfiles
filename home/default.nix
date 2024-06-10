{
  self,
  inputs,
  ...
}: {
  imports = ["${self}/scripts"];

  home = rec {
    username = "thenat";
    homeDirectory = "/home/thenat";
    stateVersion = "23.11";

    file = {
      "${homeDirectory}/Pictures/wallpapers".source = inputs.wallpapers;
    };
  };

  manual = {
    html.enable = false;
    json.enable = false;
    manpages.enable = false;
  };

  # Let Home Manager install and manage itself when in standalone mode
  programs.home-manager.enable = true;
}
