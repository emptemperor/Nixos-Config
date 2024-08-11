{

  description = "My Flake";

  inputs = {
    # Flake url.
    nixpkgs.url = "nixpkgs/nixos-24.05";

    # home-manager
    home-manager = {
     # Specify version is not using unstable.
     url = "github:nix-community/home-manager/release-24.05";
     inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
       };
      };
    in
    {
    nixosConfigurations = {
     # we can do multiple here
     # but my config is single use so far
      nixos = lib.nixosSystem {
        specialArgs = {inherit inputs system;};
        modules = [ 
	  ./nixosModules/default.nix
          ./flakeModules/default.nix
	];
      };
    };	
  };

}
