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
    localsend
    alacritty
    spotifyd
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
      settings = {
        user.name = "poske57";
        user.email = "poske+github@ubukha.com";
      };
    };
    noctalia = {
      enable = true;
    };
    firefox = {
      enable = true;
      languagePacks = [ "en-US" "ja-JP" ];
      configPath = "${config.xdg.configHome}/mozilla/firefox";
      profiles.default.search = {
        force = true;
        default = "ddg";
        privateDefault  = "ddg";
      };
    };
  };

  services = {
    mako.enable = true;
    swayidle.enable = true; # idle management daemon
    polkit-gnome.enable = true; # polkit
    spotifyd = {
      enable = true;
      settings.global = {
        device_name = "NixOS";
        bitrate = 150;
      };
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.file = {
    ".config/zed/AGENTS.md".source = ./dotfiles/agent/AGENTS.md;
    ".config/zed/settings.json".source = ./dotfiles/zed.jsonc;
    ".config/niri/config.kdl".source = ./dotfiles/niri/config.kdl;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
