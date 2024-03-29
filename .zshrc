# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

plugins=(git)

source $ZSH/oh-my-zsh.sh

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  alias open='xdg-open'
  alias vpn='expressvpn status | grep "Connected"'
  alias upgrade='sudo apt-get upgrade'
  alias update='sudo apt-get update'
  alias say='echo "$1" | espeak -s 120 2>/dev/null'
  alias soundfix="pulseaudio --kill; pulseaudio --start"
fi

alias ipaddr="hostname -I | awk '{print \$1}'"
alias copy='xclip -sel clip'
alias emu='/home/adam/Android/Sdk/emulator/emulator @Zebra_Mobile_Device_API_30'

alias gcm='git commit'
alias gch='git checkout'
alias gps='git push origin $(git_current_branch)'
alias gpl='git pull origin $(git_current_branch)'
alias gft='git fetch'
alias gbr="git for-each-ref --format='%(refname:short)' refs/heads | fzf | xargs git checkout"
alias gbc="git rev-parse --abbrev-ref HEAD | tr -d '\n' | xclip -selection clipboard"
alias gst='git status'
alias gdi='git diff'
alias gap='git apply'
alias glo='git log'
alias gad='git add'
alias gcl='git clone'
alias gsh='git stash'
alias gsha='git stash --include-untracked'
alias gsp='git stash pop'
alias gmr='git merge'
alias gnu='git clean -fd; gch .'

alias grs='git reset --soft'
alias grh='git reset --hard'
alias grm='git restore --staged' 

alias grn='git branch -m'

alias gra='git remote set-url'

alias gcb='git checkout -b'

alias cl='clear'
alias kl='kill %1'
alias ce='GTK_IM_MODULE="xim" code'

alias tdev='tmux new-session \; split-window -h -p 20 \; split-window -v -p 45 \; attach'

alias vi='nvim'

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
_viewGitLogLineUnfancy="$_gitLogLineToHash | xargs -I % sh -c 'git show %'"
_viewGitFugative="$_gitLogLineToHash | xargs -I % sh -c 'nvim -c \"Gedit %\"'"

# fshow_preview - git commit browser with previews
gls() {
    glNoGraph |
        fzf --no-sort --reverse --tiebreak=index --no-multi \
            --ansi --preview="$_viewGitLogLine" \
		--header "enter to view, alt-y to copy hash, alt-v to open in vim, alt-f open with fugative" \
                --bind "enter:execute:$_viewGitLogLine   | less -R" \
                --bind "alt-v:execute:$_viewGitLogLineUnfancy | vim -" \
		--bind "alt-f:execute:$_viewGitFugative" \
                --bind "alt-y:execute:$_gitLogLineToHash | xclip"
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fcoc_preview - checkout git commit with previews
glsc() {
  local commit
  commit=$( glNoGraph |
    fzf --no-sort --reverse --tiebreak=index --no-multi \
        --ansi --preview="$_viewGitLogLine" ) &&
  git checkout $(echo "$commit" | sed "s/ .*//")
}

