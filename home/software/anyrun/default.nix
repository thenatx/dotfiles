{
  pkgs,
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
				websearch
      ];

      y.absolute = 15;
      hideIcons = false;
      closeOnClick = false;
      width.fraction = 0.3;
      hidePluginInfo = true;
    };

    extraCss = builtins.readFile (./anyrun-dark.css);

    extraConfigFiles = {
			"applications.ron".text = ''
    	  Config(
  	      desktop_actions: false,
	        max_entries: 10,
        	terminal: Some("kitty"),
      	)
    	'';

			"websearch.ron".text = ''
				Config(
        	prefix: "?",
          engines: [
            DuckDuckGo,
            Custom(
              name: "nixpkgs",
              url: "search.nixos.org/packages?query={}&channel=unstable",
            )
					]
				)
			'';
		};
  };
}
