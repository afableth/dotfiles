{ config, pkgs, ... }:

{
  # Meta
  home.username = "poske";
  home.homeDirectory = "/home/" + config.home.username;
  home.stateVersion = "26.05";
  programs.home-manager.enable = true;

  # Coding
  programs = {
    neovim.enable = true;
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
        path = "${config.xdg.dataHome}/zsh/history";
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
        user.name = "afabl";
        user.email = "hello@afabl.fyi";
        init.defaultBranch = "main";
        push.autoSetupRemote = true;
        pull.rebase = true;
        rerere.enabled = true;
        # commit signing
        commit.gpgsign = true;
        gpg.format = "ssh";
        user.signingkey
        = "key::ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPnJtuVDN563Leul7aThmEEMaMp3cFU+B0ijPGyn0lf+";
      };
    };
    alacritty = {
      enable = true;
      settings = {
        window.padding = {
          x = 2;
          y = 2;
        };
        font = {
          normal.family = "JetBrainsMono Nerd Font Mono";
        };
      };
    };
  };
  home.file.".config/nvim".source = ./dotfiles/nvim;

  # Office
  programs = {
    obsidian.enable = true;
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

  # The home.packages option allows you to install Nix packages.
  home.packages = with pkgs;[
    localsend
    bitwarden-desktop
    nerd-fonts.jetbrains-mono
    pi-coding-agent
    podman-compose
    # Game
    steam
    gamescope
    # Setting UI
    pavucontrol
    bluetui
    wlay
    wl-gammactl
    labwc-menu-generator
    brightnessctl
    fastfetch
    # Desktop
    paper-icon-theme
  ];

  services = {
    mako.enable = true;
    swayidle.enable = true;
    polkit-gnome.enable = true;
    udiskie = {
      enable = true;
      tray = "always";
      settings = {
        program_options = {
          mount_dir = "${config.xdg.dataHome}/mnt";
        };
      };
    };
  };

  # Desktop
  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
    gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
  };
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  xdg.enable = true;

  home.sessionVariables = {
    EDITOR = "nvim";
    MESA_LOADER_DRIVER_OVERRIDE = "iris";
    LIBGL_DRIVERS_PATH = "/run/opengl-driver/lib/dri:/run/opengl-driver-32/lib/dri";
    SSH_AUTH_SOCK = "${config.home.homeDirectory}/.bitwarden-ssh-agent.sock";
  };

  programs.waybar = {
    enable = true;
  };

  home.file = {
    ".config/labwc/".source = ./dotfiles/labwc;
    ".config/comis/settings.json".source = ./dotfiles/comis.json;
    ".config/waybar/".source = ./dotfiles/waybar;
  };
}
