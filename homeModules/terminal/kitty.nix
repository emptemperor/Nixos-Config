

# Kitty Terminal configurations
{ config, lib, pkgs, ... }:

{
  options.terminal.kitty = lib.mkEnableOption "kitty";
  config = lib.mkIf config.terminal.kitty {

    programs.kitty = {
      enable = true;

      #font = {
      #  name = "JetBrainsMonoNF-SemiBold";
      #  size = 12#;
      #  package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
      #};

      settings = {
        window_padding_width = 5;
        #background_opacity = "0.7";
        #background_blur = 1;
        confirm_os_window_close = 0;
      };
    };

  };
}

