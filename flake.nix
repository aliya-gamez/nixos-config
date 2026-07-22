{
  description = "aliya flake";

  inputs = {
  	# nixpgs
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

		# home manager
		home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
		};

    # catppuccin
    catppuccin.url = "github:catppuccin/nix/release-26.05";
  };

  outputs = { 
  	self, 
  	nixpkgs,
  	home-manager,
    catppuccin,
  	... 
  } @ inputs: {

  	# nixos entrypoint
    nixosConfigurations = {
    
    	### START aliya laptop
    	alt = let
    		username = "aliya";
    		specialArgs = {inherit username;};
    	in
	    	nixpkgs.lib.nixosSystem {
	    		inherit specialArgs;
	    		system = "x86_64-linux";
	    		
	 	      modules = [
	 	        ./hosts/alt
            
	 	        # home manager
	 	        home-manager.nixosModules.home-manager 
	 	        {
	 	          home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.extraSpecialArgs = inputs // specialArgs;
              home-manager.users.${username} = }
                imports = [
                  ./home/${username};
                  catppuccin.homeModules.catppuccin
                ];
              };
	 	        }

            # catppuccin

	 	      ];
	 	      
        };    			
    };
    
  };
}
