{ config, pkgs, ... }:

{
  programs.onedrive = {
    enable = true;

    settings = {
      sync_dir = "/home/aliya/onedrive";

      monitor_interval = "300";
      skip_dotfiles = "true";
      check_nomount = "false";
      check_nosync = "false";

      classify_as_big_delete = "1000";
      disable_notifications = "false";
      rate_limit = "0";
    };

  systemd.user.services.onedrive = {
    Unit = {
      Description = "OneDrive Client";
      After = [ "network-online.target" ];
      Wants = [ "network-online.target" ];
    };
    Service = {
      Restart = "on-failure";
      RestartSec = 10;
    };
    Install.WantedBy = [ "default.target" ];
  };
  };
}