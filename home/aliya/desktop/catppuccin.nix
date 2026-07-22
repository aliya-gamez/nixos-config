{ options, inputs, pkgs, ... }:

{
  imports = [inputs.catppuccin.homeModules.catppuccin];
  options = {
    catppuccin = {
      autoEnable = true;
    };
  };
}