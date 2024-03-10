{
  imports = [
    ./hardware-configuration.nix
    ../modules/kernel/linux-zen.nix
    ../modules/lanzaboote
    ../modules/shell/fish.nix

    ../modules/bluetooth
    ../modules/fprintd
    ../modules/libvirt
    ../modules/locale
    ../modules/networkmanager
    ../modules/nix
    ../modules/pipewire
    ../modules/pkgs
    ../modules/plasma
    ../modules/plymouth
    ../modules/smartcards
    ../modules/smartd
    ../modules/sudo
    ../modules/tailscale
    ../modules/tpm2

    ../modules/unfree/discord.nix
  ];

  time.timeZone = "America/New_York";

  networking = {
    hostName = "microwave";
    nameservers =
      [ "2620:fe::fe" "2620:fe::9" "9.9.9.9" "149.112.112.112" ]; # Quad9 DNS
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
