# source .bashrc
if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set path so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# set path so it includes go binaries
if [ -d "$HOME/go/bin" ] ; then
    PATH="$HOME/go/bin:$PATH"
fi

# set path so it includes rust binaries
source "$HOME/.cargo/env"

# Git prompt
if [ -f ~/.dotfiles/bash/git-prompt.sh ]; then
    source ~/.dotfiles/bash/git-prompt.sh
    export GIT_PS1_SHOWDIRTYSTATE=1
fi

# Git completions 
if [ -f ~/.dotfiles/bash/git-completion.bash ]; then
    source ~/.dotfiles/bash/git-completion.bash
fi

