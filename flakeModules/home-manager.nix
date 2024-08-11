  # home manager module

  { config, lib, pkgs, inputs, ... }:

  {
    imports = [ inputs.home-manager.nixosModules.home-manager ];
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      extraSpecialArgs = {inherit inputs;};
      users.emptemz.imports = [
        ../homeModules/default.nix
    
     ];
    };	
  }
