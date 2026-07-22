{ pkgs, ... }: 

{
  # Terminal: Ghostty
  programs.ghostty = {
    enable = true;
  };

  # Terminal-based packages
  home.packages = with pkgs; [
    fastfetch
  ];
}
