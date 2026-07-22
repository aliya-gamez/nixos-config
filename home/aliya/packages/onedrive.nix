{ pkgs, ... }:

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

    daemon = {
      enable = true;
      type = "monitor";
    };
  };
}