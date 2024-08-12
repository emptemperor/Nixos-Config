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

{
  # Define your file systems
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/YOUR-ROOT-UUID";
      fsType = "zfs";
      # Add any additional options you might need
    };
    # Define other file systems as needed
  };


}
