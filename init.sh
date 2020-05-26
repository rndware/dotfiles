#!/bin/bash

rm -rf .zshrc;
rm -rf .vimrc;

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME';

dotfiles pull;
source ~/.zshrc;

rm -rf README.md;
rm -rf init.sh;
