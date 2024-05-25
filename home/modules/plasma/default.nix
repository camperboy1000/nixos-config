{ pkgs, catppuccin, ... }:

{
  # This feels cursed, thanks I hate it...
  home.packages = with pkgs; [
    (catppuccin-kde.override {
      flavour = [ (lib.strings.toLower catppuccin.flavor) ];
      accents = [ (lib.strings.toLower catppuccin.color) ];
      winDecStyles = [ "modern" ];
    })

    (catppuccin-papirus-folders.override {
      flavor = lib.strings.toLower catppuccin.flavor;
      accent = lib.strings.toLower catppuccin.color;
    })

    catppuccin-cursors.${lib.strings.concatStrings [ (lib.strings.toLower catppuccin.flavor) catppuccin.color ]}
  ];

  programs.plasma = {
    enable = true;

    workspace = {
      clickItemTo = "select";
      lookAndFeel = "Catppuccin-${catppuccin.flavor}-${catppuccin.color}";
      iconTheme = "Papirus-Dark";
      cursorTheme = "Catppuccin-${catppuccin.flavor}-${catppuccin.color}-Cursors";
    };
  };
}
