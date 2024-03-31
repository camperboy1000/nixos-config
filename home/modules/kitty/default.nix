{ pkgs, catppuccin, ... }:

{
  programs.kitty = {
    enable = true;
    theme = "Catppuccin-${catppuccin.flavor}";

    font = {
      name = "Hack Nerd Font";
      size = 11;
      package = pkgs.nerdfonts.override { fonts = [ "Hack" ]; };
    };

    shellIntegration = {
      enableBashIntegration = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
    };

    settings = {
      remember_window_size = false;
      initial_window_width = "128c";
      initial_window_height = "38c";
      wayland_titlebar_color = "background";

      # Terminal bell
      window_alert_on_bell = true;
      bell_on_tab = "🔔 ";

      # Tab bar
      tab_bar_min_tabs = 1;
      tab_bar_edge = "bottom";
      tab_bar_style = "powerline";
      tab_powerline_style = "slanted";
      tab_title_template =
        "{title}{' :{}:'.format(num_windows) if num_windows > 1 else ''}";
    };
  };

  home.shellAliases = { "ssh" = "kitten ssh"; };
}
