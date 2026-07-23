{ pkgs, ... }:

{
  # git
  programs.git = {
    enable = true;
    settings = {
      user.name = "Aliya Gamez";
      user.email = "contact@aliyagamez.com";
      init.defaultBranch = "main";
    };
  };
}