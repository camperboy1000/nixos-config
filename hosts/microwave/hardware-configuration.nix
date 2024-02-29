{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot = {
    initrd = {
      availableKernelModules =
        [ "nvme" "xhci_pci" "ahci" "usb_storage" "sd_mod" ];
      kernelModules = [ "dm-snapshot" ];

      luks.devices = {
        cryptroot.device =
          "/dev/disk/by-uuid/a96e240d-ba7b-4cd8-aaf1-625bdeb115ba";
      };
    };

    kernelModules = [ "kvm-amd" ];
    extraModulePackages = [ ];
    blacklistedKernelModules = [ "psmouse" ];

    resumeDevice = "/dev/system/swap";
  };

  fileSystems = {
    "/" = {
      device = "/dev/system/root";
      fsType = "ext4";
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/5885-30EA";
      fsType = "vfat";
    };
  };

  swapDevices = [{ device = "/dev/system/swap"; }];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode =
    lib.mkDefault config.hardware.enableRedistributableFirmware;

}
