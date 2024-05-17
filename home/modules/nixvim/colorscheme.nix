{ lib, catppuccin, ... }:

{
  programs.nixvim.colorschemes.catppuccin = {
    enable = true;
    settings.flavour = "${lib.strings.toLower catppuccin.flavor}"; # Notice the spelling...
  };
}
