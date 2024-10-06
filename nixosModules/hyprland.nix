	{ config, lib, pkgs, inputs, ... }:

	{
	 options.hyprland.enable = lib.mkEnableOption "enables hyprland";
	 config = libmkIf config.hyprland.enable {
	   
	   nix.settings = {
	     # cachix for flake usage of hyprland.
	     # this is provided from hyprland wiki
	     substituters = ["https://hyprland.cachix.org"];
	     trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8wtkuGc"];
	   };

	   # The removal of KDE from sddm to launch hyprland instead.
	   services.displayManager.sddm = {
	     enable = true;
	     wayland.enable = true;
	     package = pkgs.kdePackages.sddm;
	   };

	   programs.hyprland = {
	     enable = true;	
	   };
	 };
	}
