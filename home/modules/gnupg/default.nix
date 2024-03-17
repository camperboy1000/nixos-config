{ pkgs, ... }:

{
  home.packages = with pkgs; [ gnupg ];

  services.gpg-agent = {
    enable = true;
    enableScDaemon = true;
    pinentryPackage = pkgs.pinentry-qt;

    enableBashIntegration = true;
    enableFishIntegration = true;
    enableZshIntegration = true;
  };
}

