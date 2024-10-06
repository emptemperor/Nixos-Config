{ config, lib, pkgs, user, ... }:

{
  options.hyprland.hyprpaper = lib.mkEnableOption "hyprpaper";
  config = lib.mkIf config.hyprland.hyprpaper {

    services.hyprpaper = {
      enable = true;
      settings = {
      "$wp" = ./wallpapers;

      preload = [
      	"$wp/castlevania.png"
      ];

      wallpaper = [",$wp/castlevania.png"];

      };
    };

  };
}
