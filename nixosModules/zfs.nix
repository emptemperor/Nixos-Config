{
  config,
  lib,
  pkgs,
  ... 
}:
{
  boot = {
    # booting with zfs
    supportedFilesystem.zfs = true;
    kernelPackages = pkgs.linuxPackages_xanmod_latest;
       zfs = {
        # Use by-id for intel cpu
        devNodes =
        "dev/disk/by-id";
        package = pkgs.zfs_unstable;
        requestEncryptionCredentials = cfg.encryption = true; 
       };
  }; 

# 16GB swap
swapDevices = [ { device = "/dev/disk/by-label/SWAP"; } ];



}
