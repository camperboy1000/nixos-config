{
  virtualisation.libvirtd = {
    enable = true;
    onBoot = "ignore";
    onShutdown = "shutdown";

    qemu = {
      runAsRoot = false;

      ovmf.enable = true;
      swtpm.enable = true;
    };
  };
}
