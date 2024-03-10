{ pkgs, ... }:

{
  home.packages = with pkgs; [
    coreutils
    moreutils

    pciutils
    iproute2
    input-utils
    sysfsutils
    usbutils

    zip
    unzip
    p7zip
    gnutar
    gzip
    xz
    zstd

    patchutils
  ];
}
