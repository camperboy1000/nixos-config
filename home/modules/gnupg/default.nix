{
  services.gpg-agent = {
    enable = true;
    enableScDaemon = true;
    pinentryFlavor = "curses";

    enableBashIntegration = true;
    enableFishIntegration = true;
    enableZshIntegration = true;
  };
}

