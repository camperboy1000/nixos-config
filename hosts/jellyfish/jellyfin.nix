{ config, ... }:

{
  imports = [ ./transcoding.nix ];

  services.jellyfin.enable = true;

  services.caddy = {
    enable = true;

    globalConfig = ''
      servers {
          trusted_proxies static 100.64.0.0/10
          client_ip_headers Cf-Connecting-Ip X-Forwarded-For
      }
    '';

    virtualHosts = {
      "jellyfish.goat-bangus.ts.net" = {
        extraConfig = ''
          reverse_proxy localhost:8096
          encode zstd gzip
        '';
      };
    };
  };

  services.tailscale.permitCertUid = config.services.caddy.user;
}
