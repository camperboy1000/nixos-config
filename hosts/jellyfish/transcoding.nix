{ config, pkgs, ... }:

{
  hardware.opengl = {
    enable = true;
    enableDriSupport = true;

    extraPackages = with pkgs; [
      intel-media-driver
      intel-vaapi-driver
      vaapiVdpau
      libvdpau-va-gl
      intel-ocl
      intel-compute-runtime
    ];
  };

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
