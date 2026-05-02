{ config, pkgs, ... }:

{
  home.username = "ubukha";
  home.homeDirectory = "/var/home/ubukha";

  # If you do want to update the value, then make sure to first check the
  # Home Manager release notes.
  home.stateVersion = "25.11";

  # The home.packages option allows you to install Nix packages.
  home.packages = [
    # TODO check "keifu"
    pkgs.neovim
    pkgs.jq
    pkgs.github-cli
    pkgs.opencode
    pkgs.fastfetch
    pkgs.uv
    pkgs.zellij

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  programs.yazi = {
    enable = true;
    settings = {
      mgr = {
        sort_by = "natural";
        sort_sensitive = true;
        show_hidden = true;
        show_symlink = true;
      };
    };
  };
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

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  home.file = {
    ".config/alacritty/alacritty.toml".source = dotfiles/alacritty.toml;
    ".config/opencode/opencode.jsonc".source = dotfiles/opencode.jsonc;
    ".config/nvim".source = dotfiles/nvim;
    ".config/hypr/hyprland.conf".source = dotfiles/hyprland.conf;
    ".config/ghostty/config".source = dotfiles/ghostty.toml;
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/ubukha/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
