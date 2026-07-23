{ pkgs, ... }:

{
  programs.waybar = {
    enable = true;

    settings = {
      main = {
        layer = "top";
        position = "top";

        modules-left = [
          "hyprland/workspaces"
        ];

        modules-right = [
          "network"
          "pulseaudio"
          "clock"
          "battery"
        ];
      };
    };
  };
}