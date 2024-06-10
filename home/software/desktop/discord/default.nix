{
  pkgs,
  config,
  ...
}: {
  home.packages = [pkgs.vesktop];

  home.file."${config.xdg.configHome}/vesktop/themes/mocha.css".source =
    ./mocha.css;
}
