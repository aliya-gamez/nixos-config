{ pkgs, ... }:

{
  # GNOME Desktop Environment
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # Minimal Gnome
  services.gnome.core-apps.enable = false;
  services.gnome.core-developer-tools.enable = false;
  services.gnome.games.enable = false;
  environment.gnome.excludePackages = with pkgs; [ gnome-tour gnome-user-docs ];

  # Re-add some GNOME
  environment.systemPackages= with pkgs; [
    # GNOME
    nautilus
    gnome-control-center
    gnome-tweaks
    # GNOME Extensions
    gnomeExtensions.dash-to-dock
    gnomeExtensions.vitals
    gnomeExtensions.caffeine
    gnomeExtensions.blur-my-shell
  ];
}