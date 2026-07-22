{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;

    # Config
    enableCompletion = true;
    enableBashCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    # Aliases
    shellAliases = {
      sudo = "sudo ";
      ll = "ls -lah";
      update = "sudo nixos-rebuild switch";
    };

    # History
    history = {
      size = 10000;
      ignoreAllDups = true;
      ignorePatterns = ["rm *" "pkill *" "cp *"];
    };

    # Oh-my-zsh
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
      ];
      theme = "bira";
    };
  };
}