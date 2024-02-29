{ lib, catppuccin, ... }:

{
  programs.starship = {
    enable = true;

    enableBashIntegration = true;
    enableFishIntegration = true;
    enableZshIntegration = true;

    enableTransience = true;

    settings = builtins.fromTOML (builtins.readFile
      "${catppuccin.starship}/palettes/${
        lib.strings.toLower catppuccin.flavor
      }.toml") // {
        palette = "catppuccin_${lib.strings.toLower catppuccin.flavor}";

        character = {
          success_symbol =
            "[[♥](green) ❯](${lib.strings.toLower catppuccin.color})";
          error_symbol = "[❯](red)";
          vimcmd_symbol = "[❮](green)";
        };

        directory = {
          truncation_length = 4;
          style = "bold ${lib.strings.toLower catppuccin.color}";
        };
      };
  };
}
