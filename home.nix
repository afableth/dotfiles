{ config, pkgs, ... }:

{
  home.username = "poske";
  home.homeDirectory = "/home/poske";

  # If you do want to update the value, then make sure to first check the
  # Home Manager release notes.
  home.stateVersion = "25.11";

  # The home.packages option allows you to install Nix packages.
  home.packages = with pkgs;[
    # TODO check "keifu"
    fastfetch
    git
  ];

  programs.zsh = {
    enable = true;
    autocd = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ll = "ls -laF";
      gs = "git status";
      cf = "cd ~/.config/home-manager/";
      pj = "cd ~/Projects/";
    };
    history = {
      extended = true;
      ignoreDups = true;
      save = 1000000;
      share = true;
      size = 1000000;
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
