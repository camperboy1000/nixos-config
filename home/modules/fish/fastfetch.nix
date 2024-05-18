{ pkgs, ... }:

{
  home.packages = with pkgs; [ fastfetch ];

  programs.fish = {
    functions = {
      fish_greeting = "${pkgs.fastfetch}/bin/fastfetch";
    };
  };

  xdg.configFile."fastfetch/config.jsonc".text = ''
    {
      "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
      "display": {
        "percent": {
          "type": 3
        }
      },
      "modules": [
        "title",
        "separator",
        "os",
        "host",
        "kernel",
        "uptime",
        "shell",
        "de",
        "wm",
        "wmtheme",
        "theme",
        "icons",
        "terminal",
        "cpu",
        "gpu",
        "memory",
        "swap",
        "disk",
        "battery",
        "poweradapter",
        "break",
        "datetime",
        "media",
        "break",
        "colors"
      ]
    }
  '';
}
