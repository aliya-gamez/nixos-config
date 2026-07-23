{ ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {

      monitor = [
        ",preferred,auto,1"
      ];

      "$mod" = "SUPER";

      bind = [
        "$mod, Return, exec, ghostty"
        "$mod, Q, killactive"
        "$mod, D, exec, rofi -show drun"
        "$mod, E, exec, nautilus"
      ];

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
      };

      decoration = {
        rounding = 10;

        blur = {
          enabled = true;
        };
      };

      animations = {
        enabled = true;
      };
    };
  };
}