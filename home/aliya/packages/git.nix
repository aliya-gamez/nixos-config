{ pkgs, ... }:

{
  # git
  programs.git = {
    enable = true;
    userName = "Aliya Gamez";
    userEmail = "contact@aliyagamez.com";
    settings = {
      init.defaultBranch = "main";
    };
  };
}