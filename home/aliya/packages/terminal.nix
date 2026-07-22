{ pkgs, ... }: 

{
  programs.ghostty = {
    enable = true;
  }
  home.packages = with pkgs; [
    fastfetch
  ];
}
