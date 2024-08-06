#!/bin/bash

echo Enter directory name
read DIR

DIR=${DIR/#\~/$HOME}
DIR=${DIR/#\$HOME/$HOME}

for i in nvim tmux fish; do
  ln -s $PWD/$i $DIR/$i
done
ln -s $PWD/.gitconfig ~/.gitconfig
