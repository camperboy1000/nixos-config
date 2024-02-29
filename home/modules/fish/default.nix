{ pkgs, ... }:

{
  home.packages = with pkgs; [ fastfetch ];

  programs = {
    fish = {
      enable = true;
      functions = { fish_greeting = "${pkgs.fastfetch}/bin/fastfetch"; };
    };

    command-not-found.enable = true;
  };
}
