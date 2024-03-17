{ username, ... }:

{
  services.tailscale = {
    enable = true;
    extraUpFlags = [ "--operator=${username}" ];

    openFirewall = true;
  };
}
