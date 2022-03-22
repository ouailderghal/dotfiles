#
# /etc/bash.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ $DISPLAY ]] && shopt -s checkwinsize


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

test -d $HOME/go/bin && PATH=$HOME/go/bin:$PATH
test -d $HOME/.local/bin && PATH=$HOME/.local/bin:$PATH
test -d $HOME/.config/composer/vendor/bin && PATH=$HOME/.config/composer/vendor/bin:$PATH
test -f $HOME/.dotfiles/bash/git-completion.bash && . $HOME/.dotfiles/bash/git-completion.bash

if [ -f $HOME/.dotfiles/bash/git-prompt.sh ]; then
    source $HOME/.dotfiles/bash/git-prompt.sh
    export GIT_PS1_SHOWDIRTYSTATE=1
    PS1='\w$(__git_ps1 " (%s)") > '
else
    PS1='\w > '
fi
