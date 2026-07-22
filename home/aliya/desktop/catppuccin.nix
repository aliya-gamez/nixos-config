{ config, inputs, pkgs, ... }:

{
  imports = [inputs.catppuccin.homeModules.catppuccin];
  config = {
    catppuccin = {
      autoEnable = true;

      flavor = "mocha";
      accent = "pink";

      cursors = {
        enable = isGui;
        accent = "dark";
      };
    }
  }
}