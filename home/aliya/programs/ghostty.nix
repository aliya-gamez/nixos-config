{ pkgs, ... }: 

{
  programs.ghostty = {
    enable = true;

    settings = {
      background-opacity = 1.0;
      window-padding-x = "8,6";
      shell-integration = "none";
    };
  };
}
