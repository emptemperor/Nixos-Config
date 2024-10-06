

  # Default for packages alongside home.nix to be imported by home-manager
  # in flakeModules

  
  {
    imports = [
      ./home.nix
      ./impermanence.nix
    ];


  }
