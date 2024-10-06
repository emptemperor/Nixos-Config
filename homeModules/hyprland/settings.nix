
	# this serves as general settings for hyprland,
	# for key bindings, they will be in keybindings.nix

	{ config, lib, ... }:
	{
	 options.hyprland.settings = lib.mkEnableOption "settings";
	 #enable hyprland in home-manager,
	 wayland.windowManager.hyprland = {
	   enable = true;	
	 };
	 wayland.windowManager.hyprland.settings = {
          
	 #Some of these are subjected to be added later.
	   "$browser" = "firefox";
	   "$file" = "yazi";
	   "$menu" = "rofi -show drun";
	   "$terminal" = "kitty";
	   "$monitor" = "btop";

	   monitor ", 2880x1620@120, 0x0, 1";
	  
	   #exec-once[ ];
	   
	   env = [
	     "GDK_BACKEND,wayland"
	     "SDL_VIDEODRIVER,wayland"
	     "CLUTTER_BACKEND,wayland"
	     
	     "QT_QPA_PLATFORM,wayland"

	     "XDG_CURRENT_DESKTOP,Hyprland"
	     "XDG_SESSION_TYPE,wayland"
	     "XDG_SESSION_DESKTOP,Hyprland"

	   ];

	   #general settings
	   general = {
	     border size = 3;
	     gaps_in = 2;
	     gaps_out = 6;
	     layout = "dwindle";
	     resize_on_border = true;
	   };
	    
	   #master
	   master = {
	     mfact = 0.5;
	     new_status = "master";
	   };

	   #decoration
	   decoraction = {
	     rounding = 10;
	     drop_shadow = false;
	     blur = {
	       enable = false;
	       size = 4;
	       passes = 2;
	     };
	   };
	   
	   #touch pad
	   input.touchpad = {
	     natural_scroll = true;
	     drag_lock = true;
	     tap-and-drag = true;
	   };
	   
	   #gestures
	   gestures = {
	     workspace_swipe = true;	
	   };

	   #misc
	   misc = {
	     disable_hyprland_logo = true;
	     disable_splash_rendering = true;
	     font_family = "JetBrainsMonoNerdFont";
	     vrr = 1;	
	   };



	 };
	}
