{ config, pkgs, ... }:

{
  home.username = "poske";
  home.homeDirectory = "/home/poske";

  # If you do want to update the value, then make sure to first check the
  # Home Manager release notes.
  home.stateVersion = "26.05";

  # The home.packages option allows you to install Nix packages.
  home.packages = with pkgs;[
    # TODO check "keifu"
    fastfetch
    neovim
    home-manager
    nil
    nixd
    localsend
    spotifyd
    steam
    wiremix
    bluetui
    wlay
  ];

  programs = {
    zsh = {
      enable = true;
      autocd = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
        ll = "ls -lAF";
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
        init.defaultBranch = "main";
        push.autoSetupRemote = true;
        merge.conflictStyle = "nvim -d";
        pull.rebase = true;
        rerere.enabled = true;
      };
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
    alacritty = {
      enable = true;
      settings = {
        window = {
          padding = {
            x = 2;
            y = 2;
          };
        };
      };
    };
    opencode = {
      enable = true;
      settings = {
      };
      tui = {
        theme = "system";
      };
    };
  };

  services = {
    mako.enable = true;
    swayidle.enable = true;
    polkit-gnome.enable = true; # polkit
    spotifyd = {
      enable = true;
      settings.global = {
        device_name = "NixOS";
        bitrate = 150;
      };
    };
  };

  xdg.enable = true;

  home.sessionVariables = {
    EDITOR = "nvim";
    MESA_LOADER_DRIVER_OVERRIDE = "iris";
    LIBGL_DRIVERS_PATH = "/run/opengl-driver/lib/dri:/run/opengl-driver-32/lib/dri";
  };

  home.file = {
    ".config/zed/AGENTS.md".source = ./dotfiles/agent/AGENTS.md;
    ".config/zed/settings.json".source = ./dotfiles/zed.jsonc;
    ".config/nvim/init.lua".source = ./dotfiles/nvim/init.lua;
    ".config/labwc/".source = ./dotfiles/labwc;
    ".local/share/icons/Bibata-Modern-Classic".source = ./dotfiles/cursor/Bibata-Modern-Classic;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
