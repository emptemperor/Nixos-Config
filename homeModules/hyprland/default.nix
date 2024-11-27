
 # this file serves as a collective hub for all things hyprland managed by home manager.

 { config, lib, pkgs, inputs, ... }:

 {	
 	#imports
	imports = [
	  inputs.hyprland.homeManagerModules.default
	  ./keybinds.nix
	  ./settings.nix
	];


	# additional packages that go into home.nix

	home.packages = with pkgs; [
	  hyprshot
	];


	programs.wofi.enable = true;

















 }
