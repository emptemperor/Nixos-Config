

  # Serves as default imports of config and hardware nix files

 {
   imports = [
      #./configuration.nix
      ./hardware-configuration.nix
      ./zfs.nix
      ./hyprland.nix
      ./nvidia.nix
      ./home-manager.nix
      ./impermanence.nix
      ./catppuccin.nix
 
   ];
 } 
 
