#!/bin/bash

rm -rf .zshrc;
rm -rf .vimrc;

/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME pull;
/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout;

source ~/.zshrc;

rm -rf README.md;
rm -rf init.sh;
