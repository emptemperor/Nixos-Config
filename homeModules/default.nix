

  # Default for packages alongside home.nix to be imported by home-manager
  # in flakeModules
  { config, lib, ... }:
  
  {
    imports = [
      ./home.nix
     # ./impermanence.nix
    ];


    }
    
