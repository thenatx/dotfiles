{pkgs, ...}: {
  home.packages = with pkgs; [hypridle];

  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };

      listener = [
        {
          timeout = 150;
          on-timeout = "brightnessctl -s set 50%";
          on-resume = "brightnessctl -s set 95%";
        }

        {
          timeout = 300;
          on-timeout = "hyprlock";
        }

        {
          timeout = 330;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }

        {
          timeout = 800;
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };
}
