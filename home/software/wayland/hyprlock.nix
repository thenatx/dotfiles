{...}: {
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        hide_cursor = true;
        pam_module = "hyprlock";
      };

      background = {
        monitor = "";
        path = "screenshot";
        blur_passes = 2;
        blur_size = 6;
        contrast = 0.8916;
        brightness = 0.8172;
        vibrancy = 0.1696;
        vibrancy_darkness = 0.0;
      };

      label = [
        {
          monitor = "";
          text = ''cmd[update:1000] echo "$(date +"%H - %M - %S")"'';
          color = "rgba(ffffffff)";
          font_size = 100;

          position = "50, 0";
          halign = "center";
          valign = "top";
        }
        {
          monitor = "";
          text = ''cmd[update:1000] echo "$(playerctl metadata --format '> {{ title }} <' || hyprctl splash)"'';

          position = "0, 0";
          halign = "center";
          valign = "bottom";
        }
      ];
    };
  };
}
