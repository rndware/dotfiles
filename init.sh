#!/bin/bash

rm -rf .zshrc;
rm -rf .vimrc;

dotfiles pull;
source ~/.zshrc;

rm -rf README.md;
rm -rf init.sh;
