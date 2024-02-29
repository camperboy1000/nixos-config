{ pkgs, ... }:

{
  home.packages = with pkgs; [ fuse rclone ];

  systemd.user.services = {
    "rclone@" = {
      Unit = {
        Description =
          "rclone: Remote FUSE filesystem for cloud storage config %i";
        Documentation = [ "man:rclone(1)" ];
        After = [ "network-online.target" ];
        Wants = [ "network-online.target" ];
        AssertPathIsDirectory = "%h/%i";
      };

      Service = {
        Type = "notify";
        ExecStart = ''
          ${pkgs.rclone}/bin/rclone mount \
            --config=%h/.config/rclone/rclone.conf \
            --vfs-cache-mode full \
            --vfs-cache-max-size 100M \
            --log-level INFO \
            --log-file /tmp/rclone-%i.log \
            # Google Drive Options
            --drive-export-formats link.html \
            %i: %h/%i
        '';
        ExecStop = "${pkgs.fuse}/bin/fusermount -u %h/%i";
      };

      Install = { WantedBy = [ "default.target" ]; };
    };
  };
}
