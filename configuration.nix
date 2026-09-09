# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ _config, pkgs, ... }:

{
  zramSwap = {
    enable = true;
    memoryPercent = 300;
  };

  # OpenGL (required for Steam)
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Compositor
  programs.labwc.enable = true;

  # Greeter
  services.greetd = {
    enable = true;
    useTextGreeter = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet -t -r --remember-session --asterisks --cmd ${pkgs.labwc}/bin/labwc";
      };
    };
  };

  # IME
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = with pkgs; [ fcitx5-mozc fcitx5-anthy ];
  };

  # Nix
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };
    gc = {
       automatic = true;
       dates = "weekly";
       options = "--delete-older-than 7d";
    };
  };
  nixpkgs.config.allowUnfree = true;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxKernel.packages.linux_zen;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Tokyo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Printer
  services.printing.enable = true;

  # Sound
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    jack.enable = true;
    pulse.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  users.users."poske" = {
    isNormalUser = true;
    description = "poske";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  environment.systemPackages = with pkgs; [
    zsh
  ];

  # Containers
  virtualisation.podman = {
    enable = true;
    defaultNetwork.settings.dns_enabled = true;
  };

  # Auto mount media
  services.udisks2 = {
    enable = true;
    mountOnMedia = true;
  };

  system.stateVersion = "26.05"; # DON'T REMOVE THIS!
}
