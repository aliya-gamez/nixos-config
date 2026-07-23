{
  description = "aliya flake";

  nixConfig = {
    extra-substituters = [
      "https://nix-community.cachix.org"
    ];

    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  inputs = {
  	# nixpgs
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    # catppuccin
    catppuccin = {
      url = "github:catppuccin/nix/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

		# home manager
		home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
		};
  };

  outputs = { 
  	self, 
  	nixpkgs,
    catppuccin,
  	home-manager,
  	... 
  } @ inputs: {

  	# nixos entrypoint
    nixosConfigurations = {
    
    	### START aliya laptop
    	alt = let
    		username = "aliya";
    		specialArgs = {inherit inputs username;};
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
              home-manager.users.${username} = {
                imports = [
                  ./home/${username}
                ];
              };
	 	        }
	 	      ];
        };   
      ### END aliya laptop

      ### START aliya desktop
      adt = let
    		username = "aliya";
    		specialArgs = {inherit inputs username;};
    	in
	    	nixpkgs.lib.nixosSystem {
	    		inherit specialArgs;
	    		system = "x86_64-linux";
	    		
	 	      modules = [
	 	        ./hosts/adt
            
	 	        # home manager
	 	        home-manager.nixosModules.home-manager 
	 	        {
	 	          home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.extraSpecialArgs = inputs // specialArgs;
              home-manager.users.${username} = {
                imports = [
                  ./home/${username}
                ];
              };
	 	        }
	 	      ];
        };
      ### END aliya desktop  			
    };
    
  };
}
