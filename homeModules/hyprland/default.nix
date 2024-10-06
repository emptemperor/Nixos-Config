	{ pkgs, lib, config, ...}: 
	
	 #I'm going to attempt to keep this simple.
	 #This default.nix serves as a collection of all sub files related to hyprland
	 #While also enabling hyprland in home-manager.
	{ 
	  imports = [
	    ./settings.nix
	    ./keybinds.nix
	    ./windowrules.nix
	    ./animations.nix
	    ./dependencies.nix
	    ./hyprpaper.nix
	    
	  ];

	}
