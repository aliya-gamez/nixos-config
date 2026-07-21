{username, ...}: {
	home = {
		inherit username;
		homeDirectory = "/home/${username}";

		# version
		stateVersion = "26.05";
	};

	# let home manager install and manage itself
	programs.home-manager.enable = true;
}
