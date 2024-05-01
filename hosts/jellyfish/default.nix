{ pkgs, modulesPath, ... }:

{
  imports = [
    (modulesPath + "/virtualisation/proxmox-lxc.nix")
    ./jellyfin.nix
    ../modules/shell/fish.nix

    ../modules/nix
    ../modules/pkgs
    ../modules/sudo
    ../modules/systemd-resolved
    ../modules/tailscale
  ];

  time.timeZone = "America/New_York";

  networking = {
    hostName = "jellyfish";

    nameservers = [
      # Quad9
      "2620:fe::fe#dns.quad9.net"
      "2620:fe::9#dns.quad9.net"
      "9.9.9.9#dns.quad9.net"
      "149.112.112.112#dns.quad9.net"
    ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
