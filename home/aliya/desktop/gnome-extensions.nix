{ config, pkgs, ... }:

{
  dconf = {
    settings = {

      ### Gnome SHell

      # Extensions
      "org/gnome/shell" = {
          enabled-extensions = [
            "Vitals@CoreCoding.com"
            "caffeine@patapon.info"
            "dash-to-dock@micxgx.gmail.com"
            "blur-my-shell@aunetx"
          ];
      };

      # Extension: Dash to Dock
      "org/gnome/shell/extensions/dash-to-dock" = {
        dock-fixed = true;
        dash-max-icon-size = 32;
        show-trash = false;
        click-action = "minimize-or-overview";

        transparency-mode = "DYNAMIC";
        customize-alphas = "true";
        min-alpha = 0.35;
        max-alpha = 0.70;
      };

      # Extension: Vitals
      "org/gnome/shell/extensions/vitals" = {
        alphabetize = false;
        use-higher-precision = true;
        fixed-widths = false;
        update-time = 3;
        hot-sensors = [
          "_memory_allocated_"
          "_memory_usage_"
          "_processor_usage_"
          "__network-rx_max__"
          "__network-tx_max__"
          "_voltage_bat0_in0_"
        ];
      };
      
    };
  };
}