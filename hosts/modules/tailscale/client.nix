{
  imports = [ ./default.nix ];
  services.tailscale.useRoutingFeatures = "client";
}
