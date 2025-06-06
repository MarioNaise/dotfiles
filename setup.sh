#!/bin/bash

DIR=${DIR/#\~/$HOME}
DIR=${DIR/#\$HOME/$HOME}

for i in nvim tmux fish bat; do
  ln -s $PWD/$i $HOME/.config/$i
done
ln -s $PWD/.gitconfig ~/.gitconfig

bat cache --build
