	
	# This file is to serve as themes in the future.
	{ config, lib, pkgs, inputs, ... }:

	{
	
	 config = lib.mkIf config.Modules.themes {
	    
	     qt = {
      		enable = true;
      		style.name = "kvantum";
      		platformTheme.name = "kvantum";
    	     };

    	     gtk = {
      		 enable = true;
      
                 iconTheme = {
                   name = "Adwaita";
                   package = pkgs.adwaita-icon-theme;
                 };
             };

    	     home.pointerCursor = {
      	       gtk.enable = true;
      	       name = "Bibata-Modern-Classic";
      	       size = 20;
      	       package = pkgs.bibata-cursors;
   	     };



	 };

	}
