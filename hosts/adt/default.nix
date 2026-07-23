{ config, pkgs, ... }:

{
  imports = [ 
    ./hardware-configuration.nix 

    # Desktop
    ../../modules/desktop/gnome.nix
    ../../modules/desktop/hyprland
    ../../home/aliya/desktop/hyprland #test

    # Programs
    ../../modules/programs/spotify.nix
    ../../modules/programs/teams.nix

    # Services
    ../../modules/services/docker.nix
    ../../modules/services/postgresql.nix

    # System
    ../../modules/system

    # Themes
    #../../modules/themes/catppuccin
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.hostName = "adt"; # Define your hostname.
  networking.networkmanager.enable = true;

  # User accounts and shell configuration
  programs.zsh.enable = true;
  users.users."aliya" = {
    isNormalUser = true;
    description = "Aliya Gamez";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh; #shell
    packages = with pkgs; [];
  };

  # Reduce Disk Space
  boot.loader.systemd-boot.configurationLimit = 10;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
  nix.settings.auto-optimise-store = true;

  # Packages
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
  	git
    vim
  ];
  environment.variables.EDITOR = "micro";

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
