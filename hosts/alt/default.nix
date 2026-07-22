{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.hostName = "alt"; # Define your hostname.
  networking.networkmanager.enable = true;

  # User accounts
  users.users."aliya" = {
    isNormalUser = true;
    description = "Aliya Gamez";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # GNOME Desktop Environment
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  services.gnome.core-apps.enable = false;
  services.gnome.core-developer-tools.enable = false;
  services.gnome.games.enable = false;
  environment.gnome.excludePackages = with pkgs; [ gnome-tour gnome-user-docs ];

  # Packages
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [

    # Terminal
  	git
  	wget
    micro
    # GNOME
    nautilus
    gnome-control-center
	# GNOME Extensions
	gnomeExtensions.dash-to-dock
	gnomeExtensions.vitals
  ];
  environment.variables.EDITOR = "micro";

  # Enable VS Code Server
  programs.nix-ld.enable = true;

  # SSH
	services.openssh = {
		enable = true;
		settings = {
			X11Forwarding = true;
			PermitRootLogin = "no";
			PasswordAuthentication = false;
		};
		ports = [ 22 ];
	};  

  # Time/Locale info
  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # X11: Keymap
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # NixOS Version
  system.stateVersion = "26.05";

}
