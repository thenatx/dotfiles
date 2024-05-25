{
  pkgs,
  config,
  inputs,
  ...
}: {
  imports = [
    inputs.anyrun.homeManagerModules.default
  ];

  programs.anyrun = {
    enable = true;
    config = {
      plugins = with inputs.anyrun.packages.${pkgs.system}; [
        applications
        randr
        rink
        shell
        symbols
        translate
      ];

      width.fraction = 0.3;
      y.absolute = 15;
      hidePluginInfo = true;
      closeOnClick = true;
      hideIcons = false;
    };

    extraCss = builtins.readFile (./. + "/anyrun-dark.css");

    extraConfigFiles."applications.ron".text = ''
      Config(
        desktop_actions: false,
        max_entries: 10,
        terminal: Some("alacritty"),
      )
    '';
  };
}
