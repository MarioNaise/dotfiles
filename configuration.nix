# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Bootloader
  boot = {
    plymouth = {
      enable = true;
      theme = "rings";
      themePackages = with pkgs; [
        (adi1090x-plymouth-themes.override {
          selected_themes = [ "rings" ];
        })
      ];
    };
    consoleLogLevel = 3;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
      "rd.systemd.show_status=auto"
    ];
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    # Hide OS choice for bootloaders (unless key is pressed)
    loader.timeout = 0;
  };

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.edwin = {
    isNormalUser = true;
    description = "Edwin";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    shell = pkgs.fish;
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    nix-index
    nix-tree
    nix-output-monitor
    nix-doc

    # Desktop
    brightnessctl
    grim
    hyprlock
    hyprpaper
    kitty
    nwg-look
    pavucontrol
    slurp
    waybar
    wl-clipboard
    wofi
    wofi-emoji
    xfce.thunar

    # Utils
    bat
    btop
    dust
    entr
    exiftool
    fd
    ffmpeg
    file
    fzf
    hwinfo
    inetutils
    jq
    lynx
    mc
    ncspot
    ngrok
    nmap
    ripgrep
    tldr
    tree
    unzip
    zip
    zoxide

    # Dev
    act
    cargo
    clang
    cmake
    copilot-cli
    gcc
    gh
    git
    git-lfs
    gnumake
    go
    nodejs
    postman
    python3
    redis
    rust-analyzer
    rustc
    sqlite
    tree-sitter
    vim
    wget
    yarn
    zig
    zsh

    # Fun
    asciiquarium-transparent
    cbonsai
    clock-rs
    cmatrix
    figlet
    gti
    neofetch
    onefetch
    pipes

    # Apps
    (retroarch.withCores (cores: with cores; [
      mgba
    ]))
    firefox-devedition
    gucharmap
    gimp3
    handbrake
    rpi-imager
    # spotify
    # blender
    # arc-browser
    # obsidian
    # godot
  ];

  # Programs
  programs.hyprland.enable = true;
  programs.fish.enable = true;
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
  programs.tmux = {
    enable = true;
    clock24 = true;
  };
  virtualisation.docker.enable = true;

  # Services
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
  };
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # jack.enable = true;
  };
  # services.nginx.enable = true;

  # NVIDIA
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true; # required for Wayland
    open = false; # Use proprietary driver
    nvidiaSettings = true;
  };
  hardware.graphics.enable = true;

  environment.variables = {
    LIBVA_DRIVER_NAME = "nvidia";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
  };
  #######################

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
