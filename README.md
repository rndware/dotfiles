# dotfiles
Backup of my dotfiles

## Install steps

Clone the dotfiles repo to correct location
```
git clone --bare git@github.com:rndware/dotfiles.git $HOME/.dotfiles
```
Alias to the scrope of the current shell
```
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```
Checkout the files
```
dotfiles checkout && rm -rf README.md
```
