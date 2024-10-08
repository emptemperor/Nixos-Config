{ config, pkgs, lib, inputs, user, ... }:

{
  imports = [ 
	./homeModules
	

  ];	
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "emptemz";
  home.homeDirectory = "/home/emptemz";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
     pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];
    # Enabling of subModules through home manager
    hyprland = {
      enable = true;
      #hyprpaper = false;
    };

    modules.enable = true;
    terminal.enable = true;

    xdg.userDirs = {
      enable = true;
      createDirectories = true;
    };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = { files = [
	     
	     ".dotfiles/Nixos-Config/flake.nix"
	     ".dotfiles/Nixos-Config/flake.lock"
	     ".dotfiles/Nixos-Config/install.sh"
	     ".dotfiles/Nixos-Config/recover.sh"
	     ".dotfiles/Nixos-Config/configuration.nix"
	     ".dotfiles/Nixos-Config/home.nix"
	     ".dotfiles/Nixos-Config/wallpapers/castlevania.png"
	     ".dotfiles/Nixos-Config/nixosModules/default.nix"
	     ".dotfiles/Nixos-Config/nixosModules/hardware-configuration.nix"
       ".dotfiles/Nixos-Config/nixosModules/home-manager.nix"
       ".dotfiles/Nixos-Config/nixosModules/hyprland.nix"
	     ".dotfiles/Nixos-Config/nixosModules/impermanence.nix"
       ".dotfiles/Nixos-Config/nixosModules/nvidia.nix"
	     ".dotfiles/Nixos-Config/nixosModules/zfs.nix"
	     ".dotfiles/Nixos-Config/homeModules/default.nix"
	     ".dotfiles/Nixos-Config/homeModules/impermanence.nix"
	     ".dotfiles/Nixos-Config/homeModules/hyprland/animations.nix"
	     ".dotfiles/Nixos-Config/homeModules/hyprland/default.nix"
       ".dotfiles/Nixos-Config/homeModules/hyprland/dependencies.nix"
	     ".dotfiles/Nixos-Config/homeModules/hyprland/hyprpaper.nix"
       ".dotfiles/Nixos-Config/homeModules/hyprland/keybindings.nix"
       ".dotfiles/Nixos-Config/homeModules/hyprland/settings.nix"
	     ".dotfiles/Nixos-Config/homeModules/hyprland/windowrules.nix"
       ".dotfiles/Nixos-Config/homeModules/modules/default.nix"
       ".dotfiles/Nixos-Config/homeModules/modules/packages.nix"
	     ".dotfiles/Nixos-Config/homeModules/modules/programs.nix"
	     ".dotfiles/Nixos-Config/homeModules/terminal/default.nix"
	     ".dotfiles/Nixos-Config/homeModules/terminal/kitty.nix"
	   ];
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/emptemz/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
     EDITOR = "vim";
    # NIXOS_OZONE_WL = 1;
  };

  # Let Home Manager install and manage itself.
  programs = {
    home-manager.enable = true;
  
  };
}
