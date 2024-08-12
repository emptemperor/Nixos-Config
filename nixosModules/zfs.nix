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
    kernelPackages = pkgs.linuxPackages_xanmod_latest;
       zfs = {
        # Use by-id for intel cpu
        devNodes =
        "dev/disk/by-id";
        package = pkgs.zfs_unstable;
        requestEncryptionCredentials = true; 
       };
  }; 

# 16GB swap
swapDevices = [ { device = "/dev/disk/by-label/SWAP"; } ];



}
