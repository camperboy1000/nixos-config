{ config, pkgs, ... }:

{
  hardware.opengl.enable = true;

  users.groups = {
    video = {
      gid = 26;
      members = [ config.services.jellyfin.user ];
    };

    render = {
      gid = 303;
      members = [ config.services.jellyfin.user ];
    };
  };
}
