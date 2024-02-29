{
  hardware.gpgSmartcards.enable = true;

  services = {
    udev.enable = true;
    pcscd.enable = true;
  };
}
