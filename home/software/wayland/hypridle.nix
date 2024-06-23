{pkgs, ...}: let
	# I get this of https://github.com/linuxmobile/kaku, thanks to L I N U X
  suspendScript = pkgs.writeShellScript "suspend-script" ''
    ${pkgs.pipewire}/bin/pw-cli i all 2>&1 | ${pkgs.ripgrep}/bin/rg running -q
    # only suspend if audio isn't running
    if [ $? == 1 ]; then
      ${pkgs.systemd}/bin/systemctl suspend
    fi
  '';

in {
  home.packages = with pkgs; [hypridle]; # To put the command in your path

  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
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
          timeout = 1200;
          on-timeout = suspendScript.outPath;
          on-resume = "hyprctl dispatch dpms on";
        }
      ];
    };
  };
}
