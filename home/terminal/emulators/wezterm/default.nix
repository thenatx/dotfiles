{...}: {
  programs.wezterm = {
    enable = true;

    extraConfig = ''
      local wezterm = require ("wezterm")

      local font_name = "ComicShannsMono Nerd Font Mono"

      return {

        font_size = 12,

        font = wezterm.font(font_name),
        font_rules = {
          {
            italic = true,
            font = wezterm.font(font_name),
          },
          {
            italic = false,
            font = wezterm.font(font_name),
          },
          {
            intensity = "Bold",
            font = wezterm.font(font_name),
          },
        },

        color_scheme = "Catppuccin Mocha",

        window_background_opacity = 0.8,

        warn_about_missing_glyphs = false,
        enable_scroll_bar = false,
        enable_tab_bar = false,
        scrollback_lines = 10000,
        window_padding = {
          left = 15,
          right = 15,
          top = 15,
          bottom = 15,
        },
        enable_wayland = false,
        check_for_updates = false,
        default_cursor_style = "SteadyBar",
        automatically_reload_config = true,

        disable_default_key_bindings = true,
        keys = {
          {
            key = "v",
            mods = "CTRL|SHIFT",
            action = wezterm.action({ PasteFrom = "Clipboard" }),
          },
          {
            key = "c",
            mods = "CTRL|SHIFT",
            action = wezterm.action({ CopyTo = "ClipboardAndPrimarySelection" }),
          },
        },

        window_close_confirmation = "NeverPrompt",
      }
    '';
  };
}
