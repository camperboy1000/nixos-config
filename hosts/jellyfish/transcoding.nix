{ config, pkgs, ... }:

{
  hardware.opengl = {
    enable = true;

    extraPackages = with pkgs; [
      intel-media-driver
      (intel-vaapi-driver.override { enableHybridCodec = true; })
      intel-compute-runtime
      vaapiVdpau
      libvdpau-va-gl
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
