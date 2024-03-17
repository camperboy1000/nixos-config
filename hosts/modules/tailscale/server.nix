{
  imports = [ ./default.nix ];
  services.tailscale.useRoutingFeatures = "server";
}
