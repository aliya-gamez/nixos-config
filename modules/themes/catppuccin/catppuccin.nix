{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    catppuccin-gtk
    papirus-icon-theme
    bibata-cursors
  ];
}