{ config, pkgs, ... }:

{
  dconf = {
    enable = true;

    settings = {

      ### Gnome Desktop

      # Interface
      "org/gnome/desktop/interface" = {
        accent-color = "pink";
        color-scheme = "prefer-dark";
        clock-show-weekday = true;
        enable-hot-corners = false;
        enable-animations = false;
      };

      # Background
      "org/gnome/desktop/screensaver" = {
        picture-uri = "file:///run/current-system/sw/share/backgrounds/gnome/blendpills-l.jxl";
      };

      # Touchpad
      "org/gnome/desktop/peripherals/touchpad" = {
        tap-to-click = true;
        natural-scroll = true;
        click-method = "areas";
      };

      ### Settings Daemon

      # Keyboard shortcuts
      "org/gnome/settings-daemon/plugins/media-keys" = {
        custom-keybindings = [
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/terminal/"
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/google-chrome/"
        ];
      };

      # Terminal shortcut
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/terminal" = {
        name = "Terminal";
        command = "ghostty";
        binding = "<Super>Return";
      };

      # Google Chrome shortcut
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/google-chrome" = {
        name = "Google Chrome";
        command = "google-chrome-stable";
        binding = "<Super>q";
      };

      # Nightlight
      "org/gnome/settings-daemon/plugins/color" = {
        night-light-enabled = true;
		night-light-temperature = 3800;
      };

      ### Nautilus

      # Nautilus
      "org/gnome/nautilus/preferences" = {
        default-folder-viewer = "list-view";
        show-hidden-files = true;
      };

      ### Gnome SHell

      # Extensions
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