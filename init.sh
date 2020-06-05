#!/bin/bash

rm -rf .zshrc;
rm -rf .vimrc;

/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME pull;
/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME reset --hard master;

source ~/.zshrc;

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  cp settings.json ~/.config/Code/User;
  cp keybindings.json ~/.config/Code/User;
fi

if [[ "$OSTYPE" == "darwin"* ]]; then
  cp settings.json ~/Library/Application\ Support/Code/User;
  cp keybindings.json ~/Library/Application\ Support/Code/User;
fi

rm -rf settings.json;
rm -rf README.md;
rm -rf init.sh;
