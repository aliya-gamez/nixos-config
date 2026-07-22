{ config, inputs, pkgs, ... }:

{
  imports = [inputs.catppuccin.homeModules.catppuccin];
  gtk = {
    enable = true;

    catppuccin = {
      enable = true;
      flavor = "mocha";
      accent = "pink";
      size = "standard";
      tweaks = [ "normal" ];
    };
    /*
    theme = {
      name = "Catppuccin-Mocha-Standard-Mauve-dark";
      package = pkgs.catppuccin-gtk;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 24;
    };
    */
  };
}