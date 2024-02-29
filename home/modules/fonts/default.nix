{ pkgs, ... }:

{
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    noto-fonts
    noto-fonts-emoji

    fira
    fira-mono
    fira-code

    liberation_ttf
    dejavu_fonts

    hack-font
    (nerdfonts.override { fonts = [ "Hack" ]; })
  ];
}
