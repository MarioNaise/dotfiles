{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    brightnessctl
    grim
    hyprlock
    hyprpaper
    kdePackages.dolphin
    nwg-look
    pavucontrol
    slurp
    waybar
    wl-clipboard
    wofi
    wofi-emoji
  ];

  programs.hyprland.enable = true;
}
