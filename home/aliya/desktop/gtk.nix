{ pkgs, ... }:

{
  gtk = {
    enable = true;

    theme = {
      name = "catppuccin-mocha-red-standard";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "red" ];
        variant = "mocha";
        size = "standard";
      };
    };

  };
}