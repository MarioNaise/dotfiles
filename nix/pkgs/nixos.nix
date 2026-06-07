{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # dev tools
    clang
    gcc
    git
    gnumake
    python3
    vim
    zsh

    # utils
    hwinfo

    # apps
    (retroarch.withCores (
      cores: with cores; [
        mgba
        melonds
      ]
    ))
    firefox-devedition
    gucharmap
    spotify
    ghostty
    # gimp3
    # handbrake
    # rpi-imager
    # blender
    # obsidian
    # godot
  ];
}
