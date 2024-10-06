

  # Serves as default imports of config and hardware nix files

 {
   imports = [
      #./configuration.nix
      ./hardware-configuration.nix
      ./zfs.nix
<<<<<<< HEAD
=======
      ./hyprland.nix
      ./nvidia.nix
      ./home-manager.nix
      ./impermanence.nix
>>>>>>> 17724f0f968fa241f7edfc6f54a51e4628fbc061
      
 
   ];
 } 
 
