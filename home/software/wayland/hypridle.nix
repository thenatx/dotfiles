{pkgs, ...}: {
  home.packages = with pkgs; [hypridle]; # To put the command in your path

  services.hypridle = {
    enable = true;
    settings = {
      listener = [
        {
          timeout = 150;
          on-timeout = "brightnessctl -s set 50%";
          on-resume = "brightnessctl -s set 95%";
        }

        {
          timeout = 300;
          on-timeout = "pidof hyprlock || ${pkgs.hyprlock}/bin/hyprlock";
        }

        {
          timeout = 330;
          on-timeout = "${pkgs.hyprland}/bin/hyprctl dispatch dpms off";
          on-resume = "${pkgs.hyprland}/bin/hyprctl dispatch dpms on";
        }

        {
          timeout = 1200;
          on-timeout = "${pkgs.systemd}/bin/systemctl suspend";
        }
      ];
    };
  };
}
