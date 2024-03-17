{ config, pkgs, ... }:

{
  hardware.opengl.enable = true;
  hardware.opencl.extraPackages = with pkgs; [ intel-media-driver intel-ocl ];

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
