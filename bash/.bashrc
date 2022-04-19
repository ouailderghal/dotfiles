# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ $DISPLAY ]] && shopt -s checkwinsize

PS1='\w > '

case ${TERM} in
  xterm*|rxvt*|Eterm|aterm|kterm|gnome*)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'

    ;;
  screen*)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'
    ;;
esac

[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion
[ -f $HOME/.bash_aliases ] && . $HOME/.bash_aliases

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Local binaries
LOCAL_PATH=$HOME/.local/
test -d $LOCAL_PATH/bin && PATH=$LOCAL_PATH/bin:$PATH

# Go
export GOPATH=$HOME/go/
test -d $GOPATH/bin && PATH=$GOPATH/bin:$PATH

# Composer binaries
COMPOSER_PATH=$HOME/.config/composer/
test -d $COMPOSER_PATH/vendor/bin && PATH=$COMPOSER_PATH/vendor/bin:$PATH

# Tina Draw binaries & man
TINA_PATH=$HOME/.local/share/tina/
test -d $TINA_PATH/bin && PATH=$TINA_PATH/bin:$PATH
test -d $TINA_PATH/doc && export MANPATH=$TINA_PATH/doc/man:$MANPATH

# Git prompt & completion
GIT_PROMPT_PATH=$HOME/.dotfiles/bash/
test -f $GIT_PROMPT_PATH/git-completion.bash && source $GIT_PROMPT_PATH/git-completion.bash

if [ -f $HOME/.dotfiles/bash/git-prompt.sh ]; then
    source $HOME/.dotfiles/bash/git-prompt.sh
    export GIT_PS1_SHOWDIRTYSTATE=1
    # PS1='\u@\h:\w$(__git_ps1 " (%s)") \n$ '
    PS1='\e[0;32m\u\e[m@\h:\e[0;32m\w\e[0;31m$(__git_ps1 " (%s)") \n\e[m$ '
else
    PS1='\u@\h:\w $ '
fi
