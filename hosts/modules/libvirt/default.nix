{ pkgs, username, ... }:

{
  environment.systemPackages = with pkgs; [
    virtiofsd
    virtio-win
    libguestfs-with-appliance
  ];

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

  users.users."${username}".extraGroups = [ "libvirtd" ];
}
