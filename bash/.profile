# source .bashrc
if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# Git prompt
if [ -f ~/.dotfiles/bash/git-prompt.sh ]; then
    source ~/.dotfiles/bash/git-prompt.sh
    export GIT_PS1_SHOWDIRTYSTATE=1
fi

# Git completions 
if [ -f ~/.dotfiles/bash/git-completion.bash ]; then
    source ~/.dotfiles/bash/git-completion.bash
fi

