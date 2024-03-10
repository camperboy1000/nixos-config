{ pkgs, ... }:

{
  home.packages = with pkgs; [ syncthingtray ];

  services.syncthing = {
    enable = true;

    # Not working on Plasma ATM
    # tray = { enable = true; };
  };
}
