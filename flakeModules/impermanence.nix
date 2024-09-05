
# Impermenance Modules.

  { config, lib, pkgs, inputs, ... }:
	
   
  let 
    cfg = config.custom.persist;
    hmPersistCfg = config.hm.custom.persist;
  in
  {
   options.custom = with lib; {
     persist = { 
       root = { 
         directories = mkOption {
           type = type.listOf types.str;
	   default = [ ];
	   description = "Directories to persist in root filesystem";
	 };
	 files = mkOption {
           type = types.listOf types.str;
	   default = [ ];
	   description = "Files to persist in root filesystem";
	 };
	 cache = {
	   directories = mkOption {
	     type = types.listOf types.str;
	     default = [ ];
	     description = "Directories to persist, but not to snapshot";
	   };
	   files = mkOption {
	     type = types.listOf types.str;
	     default = [ ];
	     description = "files to persist, but not to snapshot";
	   };
	 };
       };
       home = {
         directories = mkOption {
           type = types.listOf types.str;
	   default = [ ];
	   description = "Directories to persist in home directory";
	 };
	 files = mkOption {
           type = types.listOf types.str;
	   default = [ ];
	   description = "files to persist in home directory";
	 };
       };
     };
   };

   config = { 
    
    # clear /tmp on boot, since its a zfs dataset
    boot.tmp.cleanOnBoot = true;

    # Use tmpfs so no evaporation
    # root and home on tmpfs
    # neededForBoot is required to prevent perm errors when creating directories or symlinks
    fileSystems."/" = lib.mkForce {
      device = "tmpfs";
      fsType = "tmpfs";
      neededForBoot = true;
      options = [ 
        "defaults"
	"size=1G"
	"mode=755"
      ];
    };

    # I will leave this for future cases
    #security.sudo.extraConfig = "Defaults Lecture=never";
    
    # persistence enviornment 
    enviorment.persistence = {
      "/persist" = {
        hideMounts = true;
        files = [ "/etc/machine-id" ] ++ cfg.root.files;
	directories = [
          "/var/log" # systemd journal is stored in /var/log/journal
	  "/var/lib/nixos" # for persisting user uids and gids
	] ++ cfg.root.directories;

        users.emptemz = {
	   files = cfg.home.files ++ hmPersistCfg.home.files;
	   directories = [
	    "Downloads"
	    "Music"
	    "Pictures"
	    "Documents"
	    "Videos"
	    "CS_2113_work"
	    ".dotfiles/Nixos-Config"
	    ".gitconfig"
	    { directory = ".ssh"; mode = "0700"; }
	    { directory = ".local/share/keyrings"; mode = "0700"; }
	   ] ++ cfg.home.directories ++ hmPersistCfg.home.directories;
	};
      };
       
       "/persist/cache" = {
        hideMounts = true;
	inherit (cfg.root.cache) directories files;
	
	users.emptemz = {
	  inherit (hmPersistCfg.home.cache) directories files;
	};
       };
      };

      hm.xdg.dataFile."impermanence.txt".text =
      let
        getDirPath = prefix: d: "${prefix}${d.dirPath}";
        getFilePath = prefix: f: "${prefix}${f.filePath}";
        persistCfg = config.environment.persistence."/persist";
        persistCacheCfg = config.environment.persistence."/persist/cache";
        allDirectories =
          map (getDirPath "/persist") (persistCfg.directories ++ persistCfg.users.${user}.directories)
          ++ map (getDirPath "/persist/cache") (
            persistCacheCfg.directories ++ persistCacheCfg.users.${user}.directories
          );
        allFiles =
          map (getFilePath "/persist") (persistCfg.files ++ persistCfg.users.${user}.files)
          ++ map (getFilePath "/persist/cache") (
            persistCacheCfg.files ++ persistCacheCfg.users.${user}.files
          );
        sort-u = arr: lib.concatLines (lib.sort lib.lessThan (lib.unique arr));
      in
      ''
        # Directories
        ${sort-u allDirectories}
        # Files
        ${sort-u allFiles}
      '';
    };
   } 
