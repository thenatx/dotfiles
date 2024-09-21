{inputs, ...}: let
  font_family = "Comic Mono";
  colors = rec {
    base = "rgb(1e1e2e)";
    text = "rgb(${textAlpha})";

    surface0 = "rgb(313244)";
    accent = "rgb(${accentAlpha})";
    yellow = "rgb(f9e2af)";
    red = "rgb(f38ba8)";

    textAlpha = "cdd6f4";
    accentAlpha = "b4befe"; # Lavender
  };
in {
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        hide_cursor = true;
      };

      background = {
        monitor = "";
        # The "screenshot" option, throws a solid red color and disble the key board, i try solve that then
        path = "${inputs.wallpapers}/${import ./wallpaper.nix}";
        blur_passes = 3;
        color = colors.base;
      };

      label = [
        {
          monitor = "";
          text = ''
            cmd[update:30000] echo "$(date +"%R")"
          '';
          color = colors.text;
          font_size = 50;
          font_family = font_family;
          position = "0, 30";
          halign = "center";
          valign = "center";
        }

        {
          monitor = "";
          text = ''
            cmd[update:43200000] echo "$(date +"%A, %d %B %Y")"
          '';
          color = colors.text;
          font_size = 20;
          font_family = font_family;
          position = "0, 0";
          halign = "right";
          valign = "top";
        }
      ];

      input-field = {
        monitor = "";
        size = "300, 60";
        outline_thickness = 4;
        dots_size = 0.2;
        dots_spacing = 0.2;
        dots_center = true;
        outer_color = colors.accent;
        inner_color = colors.surface0;
        font_color = colors.text;
        fade_on_empty = false;
        placeholder_text = ''
          <span foreground="##${colors.textAlpha}"><i>󰌾 Logged in as </i><span foreground="##${colors.accentAlpha}">$USER</span></span>
        '';
        hide_input = false;
        check_color = colors.accent;
        fail_color = colors.red;
        fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
        capslock_color = colors.yellow;
        position = "0, -35";
        halign = "center";
        valign = "center";
      };
    };
  };
}
