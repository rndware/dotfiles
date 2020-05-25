# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/adam/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

alias open='xdg-open'
alias vpn='expressvpn status | grep "Connected"'
alias upgrade='sudo apt-get upgrade'
alias update='sudo apt-get update'
alias say='echo "$1" | espeak -s 120 2>/dev/null'
# pactl set-default-sink 0

alias gcm='git commit'
alias gch='git checkout'
alias gps='git push'
alias gpl='git pull'
alias gbr='git branch'
alias gst='git status'
alias gdi='git diff'
alias gap='git apply'
alias glo='git log'
alias gad='git add'
alias gcl='git clone'
alias gsh='git stash'
alias gsp='git stash pop'

#[ -f ~/.fzf.bash ] && source ~/.fzf.bash

alias cl='clear'
alias bdl='cd ~/.vim/bundle'
alias soundfix="pulseaudio --kill; pulseaudio --start"

gll() {
  local out sha q
  while out=$(
      git log --graph --color=always \
          --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
      fzf --ansi --multi --no-sort --reverse --query="$q" --print-query); do
    q=$(head -1 <<< "$out")
    while read sha; do
      git show --color=always $sha | less -R
    done < <(sed '1d;s/^[^a-z0-9]*//;/^$/d' <<< "$out" | awk '{print $1}')
  done
}

alias glNoGraph='git log --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr% C(auto)%an" "$@"'
_gitLogLineToHash="echo {} | grep -o '[a-f0-9]\{7\}' | head -1"
_viewGitLogLine="$_gitLogLineToHash | xargs -I % sh -c 'git show --color=always % | diff-so-fancy'"

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# fcoc_preview - checkout git commit with previews
glpl() {
  local commit
  commit=$( glNoGraph |
    fzf --no-sort --reverse --tiebreak=index --no-multi \
        --ansi --preview="$_viewGitLogLine" ) &&
  git checkout $(echo "$commit" | sed "s/ .*//")
}

# fshow_preview - git commit browser with previews
gls() {
    glNoGraph |
        fzf --no-sort --reverse --tiebreak=index --no-multi \
            --ansi --preview="$_viewGitLogLine" \
                --header "enter to view, alt-y to copy hash" \
                --bind "enter:execute:$_viewGitLogLine   | less -R" \
                --bind "alt-y:execute:$_gitLogLineToHash | xclip"
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias dotfiles='/usr/bin/git --git-dir=/home/adam/.dotfiles/ --work-tree=/home/adam'
