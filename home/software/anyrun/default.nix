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
        translate
        symbols
        kidex
        shell
      ];

      y.absolute = 15;
      hideIcons = false;
      closeOnClick = false;
      width.fraction = 0.3;
      hidePluginInfo = true;
    };

    extraCss = builtins.readFile (./. + "/anyrun-dark.css");

    extraConfigFiles."applications.ron".text = ''
      Config(
        desktop_actions: false,
        max_entries: 10,
        terminal: Some("wezterm"),
      )
    '';
  };
}
