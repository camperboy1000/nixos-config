{
  services.xserver = {
    enable = true;
    libinput.enable = true;

    xkb = {
      layout = "us";
      variant = "";
    };

    desktopManager.plasma5.enable = true;
    displayManager = {
      sddm.enable = true;
      defaultSession = "plasmawayland";
    };
  };

  programs.dconf.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
