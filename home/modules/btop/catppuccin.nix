{ lib, catppuccin, username, ... }:

let
  catppuccin_theme = ".config/btop/themes/catppuccin_${
      lib.strings.toLower catppuccin.flavor
    }.theme";
in {
  home.file = {
    "${catppuccin_theme}" = {
      source = "${catppuccin.btop}/themes/catppuccin_${
          lib.strings.toLower catppuccin.flavor
        }.theme";
    };
  };

  programs.btop = {
    settings = { color_theme = "/home/${username}/${catppuccin_theme}"; };
  };
}
