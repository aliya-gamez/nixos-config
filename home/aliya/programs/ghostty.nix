{ pkgs, ... }: 

{
  programs.ghostty = {
    enable = true;

    settings = {
      background-opacity = 0.90;
      window-padding-x = "4,4";

      shell-integration = "none";
    };
  };
}
