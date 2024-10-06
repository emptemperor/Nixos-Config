

	# This default.nix serves as the import hub of modules within homeModules
	# Additionally in this same directory(emphasis) there is also packages.nix
	# packages.nix holds packages via home-manager.

	{
	 
	 imports = [
	   ./packages.nix
	   ./programs.nix

	 ];
	}
