{
  boot = {
    consoleLogLevel = 0;
    kernelParams = [ "quiet" "udev.log_level=3" ];

    initrd = {
      verbose = false;
      systemd.enable = true;
    };

    plymouth = {
      enable = true;
      theme = "breeze";
    };
  };
}
