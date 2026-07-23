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
    neovim
    home-manager
    nil
    discord
  ];

  programs = {
    zsh = {
      enable = true;
      autocd = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
        ll = "ls -laF";
        gs = "git status";
        pj = "cd ~/Projects/";
        grep = "grep --color=auto";
      };
      history = {
        extended = true;
        ignoreDups = true;
        save = 1000000;
        share = true;
        size = 1000000;
      };
    };
    git = {
      enable = true;
      extraConfig = {
        user.name = "poske57";
        user.email = "poske+github@ubukha.com";
      };
    };
    alacritty.enable = true;
    fuzzel.enable = true;
    waybar.enable = true;
    swaylock.enable = true;
    firefox = {
      enable = true;
      languagePacks = [ "en-US" "ja-JP" ];
      profiles.default.search = {
        force = true;
        default = "ddg";
        privateDefault  = "ddg";
      };
    };
  };
  services.mako.enable = true;
  services.swayidle.enable = true; # idle management daemon
  services.polkit-gnome.enable = true; # polkit

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.file = {
    ".config/zed/AGENTS.md".source = ./dotfiles/agent/AGENTS.md;
    ".config/zed/settings.json".source = ./dotfiles/zed.jsonc;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
