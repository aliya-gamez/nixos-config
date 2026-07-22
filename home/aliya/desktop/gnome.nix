{ config, pkgs, ... }:

{
  dconf = {
    enable = true;

    settings = {

      # GNOME desktop behavior
      "org/gnome/desktop/interface" = {
        accent-color = "pink";
        color-scheme = "prefer-dark";
        clock-show-weekday = true;
        enable-hot-corners = false;
      };


      # Disable animations
      "org/gnome/desktop/interface" = {
        enable-animations = false;
      };


      # Touchpad
      "org/gnome/desktop/peripherals/touchpad" = {
        tap-to-click = true;
        natural-scroll = true;
      };


      # Keyboard shortcuts
      "org/gnome/settings-daemon/plugins/media-keys" = {
        custom-keybindings = [
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/terminal/"
        ];
      };


      # Terminal shortcut
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/terminal" = {
        name = "Terminal";
        command = "kgx";
        binding = "<Super>Return";
      };


      # Nautilus
      "org/gnome/nautilus/preferences" = {
        default-folder-viewer = "list-view";
        show-hidden-files = true;
      };


      # Workspaces
      "org/gnome/mutter" = {
        dynamic-workspaces = true;
      };

      # Extensins
      "org/gnome/shell" = {
          enabled-extensions = [
            "Vitals@CoreCoding.com"
            "caffeine@patapon.info"
            "dash-to-dock@micxgx.gmail.com"
          ];
      };

    };
  };
}