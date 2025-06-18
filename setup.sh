#!/usr/bin/env bash

options=(
  .gitconfig
  nvim
  tmux
  fish
  bat
  btop
  hypr
  kitty
  waybar
  wofi
  ncspot
  xsettingsd
  gtk-3.0
  gtk-4.0
  .gtkrc-2.0
  wallpapers
)

select opt in "${options[@]}"; do
  if [[ -z $opt ]]; then
    break
  elif [[ $opt == ".gitconfig" || $opt == ".gtkrc-2.0" ]]; then
    ln -s $PWD/$opt $HOME/$opt
  elif [[ $opt == "bat" ]]; then
    ln -s $PWD/$opt $HOME/.config/$opt
    bat cache --build
  else
    ln -s $PWD/$opt $HOME/.config/$opt
  fi
done
