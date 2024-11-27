
	# Serves to define hyprland specific settings

	{
	  wayland.windowManager.hyprland.settings = {
		
		"$browser" = "firefox";
		"$terminal" = "kitty";
		

		decoration = {
		  rounding = 6;
		  blur = {
		   enabled = false;
		   size = 4;
		   passes = 2;
		  };
		};

		input.touchpad = {
		  natural_scroll = true;
		  drag_lock = true;
		  tap-and-drag = true;
		};

		gestures = {
		  workspace_swipe = true;
		};
		

	  };	






	}
