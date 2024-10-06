

  # Default for packages alongside home.nix to be imported by home-manager
  # in flakeModules

  
  {
    imports = [
      #./home.nix
      ./impermanence.nix
      ./hyprland
      ./modules
      ./terminal
    ];

    options = {
	hyprland.enable = lib.mkEnableOption "hyprland";
        modules.enable = lib.mkEnableOption "modules";
	terminal.enable = lib.mkEnableOption "terminal";

    };

    config = {

    hyprland = lib.mkIf config.hyprland.enable {
      dependencies = lib.mkDefault true;
      hyprpaper = lib.mkDefault true;
      settings = lib.mkDefault true;
    };

    terminal = lib.mkIf config.terminal.enable {
      kitty = lib.mkDefault true;	
    };

    modules = lib.mkIf config.modules.enable {
      packages = lib.mkDefault true;
      programs = lib.mkDefault true;
      themes = lib.mkDefault false;
    };

   };	
  }
