# ls
alias ls="ls --color=auto"
alias sl="ls"
alias l="ls -lh"
alias ll="ls -lah"

# General
alias q="exit"
alias e="nvim"
alias rf="rm -rf"
alias systemctl="sudo systemctl"
alias ss="sudo systemctl"
alias open="xdg-open"
alias o="xdg-open"
alias pinger="ping -c 3 archlinux.org"
alias copy="xclip -selection c"
alias t="todo.sh"

# Git
alias g="git"
alias gl="git log --oneline --decorate"
alias ga="git add"
alias gaa="git add -A"
alias gcm="git commit -m"
alias gs="git status"
alias gss="git status -s"
alias gb="git branch"
alias gc="git checkout"
alias gcb="git checkout -b"
alias gp="git push"

# Tmux
alias ta="tmux a"
alias tns="tmux new-session -s"
alias tat="tmux attach -t"
alias tls="tmux list-sessions"
alias tks="tmux kill-session -t"
alias tkserver="tmux kill-server"

# DevOps
alias d="docker"
alias tf="terraform"
alias dc="docker compose"
alias va="vagrant"
alias an="ansible"
alias anp="ansible-playbook"
alias gc="gcloud"
