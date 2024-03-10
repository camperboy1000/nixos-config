{ lib, catppuccin, ... }:

{
  programs.bat = {
    enable = true;

    themes = {
      "Catppuccin ${catppuccin.flavor}" = {
        src = catppuccin.bat;
        file = "themes/Catppuccin ${catppuccin.flavor}.tmTheme";
      };
    };

    config = { theme = "Catppuccin ${catppuccin.flavor}"; };
  };

  home.shellAliases = { "cat" = "bat"; };
}
