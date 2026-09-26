{ config, pkgs, ... }:

{
  home.username = "poske";
  home.homeDirectory = "/home/" + config.home.username;

  # If you do want to update the value, then make sure to first check the
  # Home Manager release notes.
  home.stateVersion = "26.05";

  # The home.packages option allows you to install Nix packages.
  home.packages = with pkgs;[
    fastfetch
    neovim
    home-manager
    podman-compose
    localsend
    steam
    gamescope
    pavucontrol
    bluetui
    wlay
    wl-gammactl
    labwc-menu-generator
    brightnessctl
    claws-mail
    obsidian
    pi-coding-agent
    nil
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
        path = "$XDG_DATA_HOME/zsh/history";
      };
    };
    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
    git = {
      enable = true;
      settings = {
        user.name = "poske57";
        user.email = "poske@afabl.fyi";
        init.defaultBranch = "main";
        push.autoSetupRemote = true;
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
      settings.window.padding = {
            x = 2;
            y = 2;
      };
    };
    opencode = {
      enable = true;
      tui = {
        theme = "system";
      };
    };
  };

  services = {
    mako.enable = true;
    swayidle.enable = true;
    polkit-gnome.enable = true;
  };

  gtk = {
    enable = true;
    theme = {
      name = "Colloid-Dark";
      package = pkgs.colloid-gtk-theme;
    };
  };

  xdg.enable = true;

  home.sessionVariables = {
    EDITOR = "nvim";
    MESA_LOADER_DRIVER_OVERRIDE = "iris";
    LIBGL_DRIVERS_PATH = "/run/opengl-driver/lib/dri:/run/opengl-driver-32/lib/dri";
  };

  home.file = {
    ".config/nvim".source = ./dotfiles/nvim;
    ".config/labwc/".source = ./dotfiles/labwc;
    ".config/comis/settings.json".source = ./dotfiles/comis.json;
    ".local/share/icons/Bibata-Modern-Classic".source = ./dotfiles/cursor/Bibata-Modern-Classic;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
