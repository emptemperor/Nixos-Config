{
  config,
  lib,
  pkgs,
  ... 
}:
{
  boot = {
    # booting with zfs
    supportedFilesystems.zfs = true;
    kernelPackages = pkgs.linuxPackages_xanmod;
       zfs = {
        # Use by-id for intel cpu
        devNodes =
        "/dev/disk/by-id";
        package = pkgs.zfs_unstable;
        requestEncryptionCredentials = true; 
       };
  }; 

# 16GB swap
swapDevices = [ { device = "/dev/disk/by-label/SWAP"; } ];

  # Define your file systems
  # standardized filesystem layout
  fileSystems = {
    # NOTE: root and home are on tmpfs
    # root partition, exists only as a fallback, actual root is a tmpfs
    "/" = {
      device = "zroot/root";
      fsType = "zfs";
      neededForBoot = true;
    };

    # boot partition
    "/boot" = {
      device = "/dev/disk/by-label/NIXBOOT";
      fsType = "vfat";
    };

    "/nix" = {
      device = "zroot/nix";
      fsType = "zfs";
    };

    "/tmp" = {
      device = "zroot/tmp";
      fsType = "zfs";
    };

    "/persist" = {
      device = "zroot/persist";
      fsType = "zfs";
      neededForBoot = true;
    };

    "/persist/cache" = {
      device = "zroot/cache";
      fsType = "zfs";
      neededForBoot = true;
    };
  };


}
