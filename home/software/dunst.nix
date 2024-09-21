{...}: {
  services.dunst = {
    enable = true;
    settings = {
      global = {
        width = 300;
        height = 150;
        corner_radius = 8;
        notification_limit = 10;
        origin = "bottom-right";

        transparency = 70;
        frame_color = "#89b4fa";
        separator_color = "frame";

        font = "ComicSans 12";
      };

      urgency_low = {
        background = "#1e1e2e";
        foreground = "#cdd6f4";
      };

      urgency_normal = {
        background = "#1e1e2e";
        foreground = "#cdd6f4";
      };

      urgency_critical = {
        background = "#1e1e2e";
        foreground = "#cdd6f4";
        frame_color = "#fab387";
      };
    };
  };
}
