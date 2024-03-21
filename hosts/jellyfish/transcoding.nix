{ config, pkgs, ... }:

{
  hardware.opengl = {
    enable = true;
    driSupport = true;

    extraPackages = with pkgs; [
      intel-media-driver
      intel-vaapi-driver
      vaapiVdpau
      libvdpau-va-gl
      intel-compute-runtime
    ];
  };

  users.groups = {
    video = {
      gid = 26;
      members = [ "root" config.services.jellyfin.user ];
    };

    render = {
      gid = 303;
      members = [ "root" config.services.jellyfin.user ];
    };
  };
}
