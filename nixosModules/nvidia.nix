 
  { config, lib, pkgs, ... }:
  {
    # Nvidia Driver 
    services.xserver.videoDrivers = ["nvidia"];
    hardware.opengl.enable = true;
    hardware.nvidia = {
       # Modesetting is necessary
       modesetting.enable = true;

       # Power Management
       powerManagement.enable = false;
       powerManagement.finegrained = false;

       open = false;
       
       nvidiaSettings = true;

       package = config.boot.kernelPackages.nvidiaPackages.stable;

       prime = {
           
	   sync.enable = true;

	   # Bus ids for Nvidia and Intel

	   nvidiaBusId = "PCI:1:0:0";
	   intelBusId = "PCI:0:2:0";

       };
    };
  }
