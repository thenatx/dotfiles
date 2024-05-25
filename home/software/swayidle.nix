{pkgs, ...}: {
  programs.swayidle = {
    enable = true;

    events = [
      {
        event = "resume";
        command = "${pkgs.hyprland}/bin/hyprctl dispatch dpms on eDP-1";
      }
      {
        event = "before-sleep";
        command = "${pkgs.swaylock}/bin/swaylock -fF";
      }
    ];

    timeouts = [
      {
        timeout = 280;
        command = "${pkgs.swaylock}/bin/swaylock";
      }
      {
        timeout = 410;
        command = "${pkgs.hyprland}/bin/hyprctl dispatch dpms off eDP-1 '";
      }
      {
        timeout = 1200;
        command = "systemctl suspend";
      }
    ];
  };
}
