{ lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ sbctl ];

  boot.loader.systemd-boot.enable = lib.mkForce false;

  boot.lanzaboote = {
    enable = true;
    configurationLimit = 5;
    pkiBundle = "/etc/secureboot";
  };
}
