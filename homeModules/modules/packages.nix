	
	# packages to be used in home manager, if configuring via as home-manager modules use the parent directory.

	{ config, lib, pkgs, ... }:
	
	{
	 options.modules.packages = lib.mkEnableOption "enables packages";
	 config = lib.mkIf config.modules.packages {
	   
	   home.packages = with pkgs; [ 
	     vscodium
	
	   ];
	 };



	}
