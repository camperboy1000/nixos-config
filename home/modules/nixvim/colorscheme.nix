{ lib, catppuccin, ... }:

{
  programs.nixvim.colorschemes.catppuccin = {
    enable = true;
    flavour = "${lib.strings.toLower catppuccin.flavor}"; # Notice the spelling...
  };
}
