{...}: let
  font_family = "GeistMono Nerd Font";
in {
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        hide_cursor = false;
        no_fade_in = true;
      };

      background = [
        {
          monitor = "";
          path = "screenshot";
          blur_passes = 3;
          blur_size = 6;
          noise = 0.1;
          contrast = 1.1;
          brightness = 1.2;
        }
      ];

      input-fields = [
        {
          monitor = "eDP-1";

          size = {
            width = 300;
            height = 50;
          };

          outline_thickness = 2;

          fade_on_empty = false;

          dots_spacing = 0.3;
          dots_center = true;
        }
      ];

      labels = [
        {
          monitor = "";
          text = "$TIME";
          inherit font_family;
          font_size = 50;

          position = {
            x = 0;
            y = 80;
          };

          valign = "center";
          halign = "center";
        }
      ];
    };
  };
}
