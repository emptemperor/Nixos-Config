	#serves as keybindings for hyprland	
	{
		wayland.windowManager.hyprland.settings = {
		
			"$mod" = "SUPER";
			"$alt" = "ALT";

			bind = [
			  "$mod, T, exec, $terminal"
			  "$mod, F, exec, $browser"





			  # killing windows
			  "$mod, ESCAPE, killactive"
			  "$mod SHIFT, ESCAPE, exit"



			];
	

		};
	}
