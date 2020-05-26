# dotfiles
Backup of my dotfiles and vscode settings

## Install steps

Clone the dotfiles repo to correct location
```
git clone --bare git@github.com:rndware/dotfiles.git $HOME/.dotfiles
```
Alias to the scrope of the current shell
```
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```
Run init command
```
./init.sh
```
