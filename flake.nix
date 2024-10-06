{

  description = "My Flake";

  inputs = {
    # Flake url.
    nixpkgs.url = "nixpkgs/nixos-24.05";

    # impermenance url
    impermanence.url = "github:nix-community/impermanence";

    #hyprland url, for binaries. 
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

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
	  inputs.impermanence.nixosModules.impermanence
	  #./nixosModules/default.nix
	  ./configuration.nix
          #./flakeModules/default.nix
	  # ./homeModules/default.nix
	];
      };
    };	
  };

}
