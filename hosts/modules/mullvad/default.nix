{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ mullvad-browser ];

  services.mullvad-vpn = {
    enable = true;
    package = pkgs.mullvad-vpn;
  };
}
