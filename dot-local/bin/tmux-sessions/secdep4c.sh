#!/bin/bash

SESSION_NAME="secdep4c"
SESSION_PATH="$HOME/Projects/phd/secdep4c/"
USER_SHELL="/usr/bin/zsh"

cd $SESSION_PATH

tmux has-session -t "$session_name" 2>/dev/null && exit
tmux new-session -d -s $SESSION_NAME

tmux new-window -t $SESSION_NAME:1 -n "nvim" "nvim ."
tmux new-window -t $SESSION_NAME:2 -n "shell" "$USER_SHELL"
tmux new-window -t $SESSION_NAME:3 -n "lf" "lf"
tmux new-window -t $SESSION_NAME:4 -n "mail" "neomutt"
tmux new-window -t $SESSION_NAME:5 -n "calendar" "khard interactive"
tmux new-window -t $SESSION_NAME:6 -n "irc" "weechat"
tmux new-window -t $SESSION_NAME:7 -n "scratch" "nvim $HOME/Documents/scratchpad/$SESSION_NAME.md"
tmux kill-window -t $SESSION_NAME:0

