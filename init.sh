#!/bin/bash

rm -rf .zshrc;
rm -rf .vimrc;

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME';

dotfiles pull;
source ~/.zshrc;

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  cp settings.json ~/.config/Code/User;
fi

rm -rf settings.json;
rm -rf README.md;
rm -rf init.sh;
