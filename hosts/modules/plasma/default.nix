{
  services.desktopManager.plasma6.enable = true;

  services.xserver = {
    enable = true;

    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };
  };

  programs.dconf.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
