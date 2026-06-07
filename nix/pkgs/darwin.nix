{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ghostty-bin
    neovim
    tmux
  ];
}
