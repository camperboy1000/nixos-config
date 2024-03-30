{ pkgs, username, ... }:

{
  home.username = "${username}";
  home.homeDirectory = "/home/${username}";

  imports = [
    ./modules/bat
    ./modules/btop
    ./modules/discord
    ./modules/fish
    ./modules/fonts
    ./modules/fzf
    ./modules/git
    ./modules/gnupg
    ./modules/kitty
    ./modules/librewolf
    ./modules/lsd
    ./modules/mpv
    ./modules/nixvim
    ./modules/rclone
    ./modules/starship
    ./modules/syncthing
    ./modules/tealdeer
    ./modules/thefuck
    ./modules/ungoogled-chromium
    ./modules/utils
    ./modules/vscodium
  ];

  home.packages = with pkgs; [
    nixfmt
    nmap

    libreoffice-qt
    localsend
    signal-desktop
    supersonic
    wireshark
    virt-manager
    virt-viewer
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

