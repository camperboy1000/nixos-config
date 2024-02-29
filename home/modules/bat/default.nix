{ lib, catppuccin, ... }:

{
  programs.bat = {
    enable = true;

    themes = {
      "catppuccin-${lib.strings.toLower catppuccin.flavor}" = {
        src = catppuccin.bat;
        file = "Catppuccin-${lib.strings.toLower catppuccin.flavor}.tmTheme";
      };
    };

    config = { theme = "catppuccin-${lib.strings.toLower catppuccin.flavor}"; };
  };

  home.shellAliases = { "cat" = "bat"; };
}
