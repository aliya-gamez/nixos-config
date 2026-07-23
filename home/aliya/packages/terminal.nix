{ pkgs, ... }: 

{
  home.packages = with pkgs; [
    fastfetch
    btop
    tree
  ];
}
