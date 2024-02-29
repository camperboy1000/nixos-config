{ username, ... }:

{
  services.tailscale = {
    enable = true;
    extraUpFlags = [ "--operator=${username}" ];

    openFirewall = true;
    useRoutingFeatures = "client";
  };
}
