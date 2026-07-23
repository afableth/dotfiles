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
    neovim
    home-manager
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
      };
      history = {
        extended = true;
        ignoreDups = true;
        save = 1000000;
        share = true;
        size = 1000000;
      };
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.file = {
    ".config/zed/AGENTS.md".source = ./dotfiles/agent/AGENTS.md;
    ".config/zed/settings.json".source = ./dotfiles/zed.jsonc;
  };

  dconf.settings = {
    "org/gnome/shell" = {
      # お気に入りのアプリ
      favorite-apps = [
        "firefox.desktop"
        "dev.zed.Zed.desktop"
      ];
      # 拡張機能の有効化 (導入ではなく最初から有効状態で開始するための設定)
      # 拡張機能自体のインストール方法は通常のパッケージのインストール方法と同じなので割愛
      enabled-extensions = [

      ];
    };
    "org/gnome/desktop/interface" = {
      enable-animations = true;
      clock-show-weekday = true;
      text-scaling-factor = 1;
    };
    # 最大化ボタンや最小化ボタンを表示
    "org/gnome/desktop/wm/preferences" = {
      button-layout = ":minimize,maximize,close";
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
