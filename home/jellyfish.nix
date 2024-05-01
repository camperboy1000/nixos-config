{ pkgs, username, ... }:

{
  home.username = "${username}";
  home.homeDirectory = "/home/${username}";

  imports = [
    ./modules/bat
    ./modules/btop
    ./modules/fish
    ./modules/fzf
    ./modules/lsd
    ./modules/starship
    ./modules/tealdeer
    ./modules/thefuck
    ./modules/utils
  ];

  home.packages = with pkgs; [
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.11";

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;
}

