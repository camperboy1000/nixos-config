{ pkgs, ... }:

{
  home.packages = with pkgs; [ fastfetch ];

  programs = {
    # Needed to source /etc/bashrc
    bash.enable = true;

    fish = {
      enable = true;
      functions = { fish_greeting = "${pkgs.fastfetch}/bin/fastfetch"; };
    };

    command-not-found.enable = true;
  };
}
